# Originally from Pixel Art Glassifier project, might contain leftover idiosyncracies from that

from PIL import Image, ImageStat
import numpy as np
from texture_path_utility import *
from oklab_util import *
from tkinter import simpledialog, messagebox
import json

MAX_DEPTH = 1
EPS = 2 # 2/255 ~= 0.7%, close enough I guess (for opacity)
# same_rule enum
NONE = 0
PAIRS = 1
PAIRS_MATCHING = 2
# sampling_rule enum
CENTER = 0
AVERAGE = 1
CORNER = 2
# color_format enum
RGB="rgb"
OKLAB="oklab"

WINDOW_TITLE = "Extract Colorspace"

presets = ["source_vanilla_survival_side","source_cobblemon_side"]
anti_presets = ["shulker_boxes", "glass", "noisy", "high_contrast", "semitransparent", "holey", "evo_stone_blocks"]
same_rule = NONE
sampling_rule = AVERAGE
color_format = OKLAB

def validate_same_rule(new, old):
    if(same_rule==NONE):
        return new!=old
    elif(same_rule==PAIRS):
        return new//2!=old//2 # so 0 and 1 are considered the same block, 2 and 3, and so on
    elif(same_rule==PAIRS_MATCHING):
        return new//2!=old//2 or image_paths[new][0]!=image_paths[old][1] # allows non-paired entries as long as their files don't start with the same letter

def rgb_to_defined_format(color: tuple[int, int, int]|tuple[int,int,int,int]):
    if(color_format==RGB):
        return [*color] # copy just in case
    elif(color_format==OKLAB):
        return toOklab(color)


image_paths = get_texture_paths(presets, anti_presets)

base_entries = []
intermediate_entries = []
final_entries = np.empty((256,256,256), list) # stored as lists of indices into the paths list, from bottom to top

print("Extracting base colors... ", end="", flush=True)
for i, image_path in enumerate(image_paths):
    try:
        image = Image.open(os.path.join("sources",image_path))
        image = image.convert('RGBA') # in case it was in palette mode
    except Exception as e:
        print(f"\"{image_path}\" is not a recognized image file")
        continue
    (w, h) = image.size
    
    rgb_color: tuple[int,int,int]
    final_color: tuple[int,int,int]
    if sampling_rule == CENTER:
        rgb_color = image.getpixel((w//2, h//2))
        final_color = rgb_to_defined_format(rgb_color)
    elif sampling_rule == AVERAGE:
        pixels = list(image.getdata())
        nonempty = []
        for pixel in pixels:
            if pixel[3]>0:
                formatted_pix = rgb_to_defined_format(pixel)
                nonempty.append(formatted_pix)
        temp = Image.new("RGBA",(1,len(nonempty))) # since we only want the mean this should be fine despite the data being oklab
        temp.putdata(nonempty)
        final_color = ImageStat.Stat(temp).mean 
    elif sampling_rule == CORNER:
        rgb_color = image.getpixel((0,0))
        final_color = rgb_to_defined_format(rgb_color)

    base_entries.append((final_color,i))
print("Done")

if MAX_DEPTH==1:
    for entry in base_entries:
        col_int = [min(round(entry[0][i]),255) for i in range(len(entry[0]))]
        final_entries[col_int[0], col_int[1], col_int[2]] = [entry[1]]
else:
    gen = 0
    print("Combining colors... ", end="", flush=True)
    intermediate_entries = [(x[0], [x[1]]) for x in base_entries]
    while len(intermediate_entries)>0:
        curr_entry = intermediate_entries.pop(0)
        curr_color = curr_entry[0]
        # pure console logging, no logic
        if(len(curr_entry[1])>gen):
            gen=len(curr_entry[1])
            print(f"gen {gen}... ", end="", flush=True)
        # </logging>
        for added_entry in base_entries:
            if not validate_same_rule(added_entry[1], curr_entry[1][-1]):
                continue
            added_color = added_entry[0]
            new_alpha = round((1 - (1 - added_color[3]/255) * (1 - curr_color[3]/255))*255)
            new_color = tuple([min(round(added_color[x] * added_color[3]/new_alpha + curr_color[x] * (255-added_color[3])/new_alpha),255) for x in range(3)]+[new_alpha])

            new_entry = (new_color, [*curr_entry[1], added_entry[1]])
            if new_color[3]>=255-EPS or len(new_entry[1])>=MAX_DEPTH:
                final_entries[new_color[0], new_color[1], new_color[2]] = new_entry[1]
            else:
                intermediate_entries.append(new_entry)
    print("Done")
print(np.count_nonzero(final_entries))

os.chdir("colorspaces")

canWrite = False
while not canWrite:
    canWrite = True
    output_name = simpledialog.askstring(WINDOW_TITLE, "Colorspace Name: ")
    if os.path.isfile(f"{output_name}.npy"):
        canWrite = messagebox.askyesno(WINDOW_TITLE, "Overwrite existing colorspace?")
    elif os.path.isfile(f"{output_name}.json"):
        messagebox.showinfo(WINDOW_TITLE, "Metadata for name found, but colorspace file missing")

metadata = {"presets": presets, "antipresets": anti_presets, "color_format": color_format}

with open(output_name+".json", "w") as file:
    json.dump(metadata, file, indent=4)
np.save(output_name, final_entries)