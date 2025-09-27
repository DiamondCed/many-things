from PIL import Image, ImageStat
import os
import numpy as np

MAX_HEIGHT = 5
EPS = 2 # 2/255 ~= 0.7%, close enough I guess
# same_rule enum
NONE = 0
PAIRS = 1
PAIRS_MATCHING = 2
# sampling_rule enum
CENTER = 0
AVERAGE = 1
CORNER = 2

source = "source"
same_rule = PAIRS
sampling_rule = AVERAGE

def validate_same_rule(new, old):
    if(same_rule==NONE):
        return new!=old
    elif(same_rule==PAIRS):
        return new//2!=old//2 # so 0 and 1 are considered the same block, 2 and 3, and so on
    elif(same_rule==PAIRS_MATCHING):
        return new//2!=old//2 or image_paths[new][0]!=image_paths[old][1] # allows non-paired entries as long as their files don't start with the same letter

os.chdir(source)
image_paths = os.listdir()

base_entries = []
intermediate_entries = []
final_entries = np.empty((256,256,256), list) # stored as lists of indices into the paths list, from bottom to top

print("Extracting base colors... ", end="", flush=True)
for i, image_path in enumerate(image_paths):
    try:
        image = Image.open(image_path)
        if image.mode != 'RGBA': # deals with the pesky Palette Mode images
            image = image.convert('RGBA')
    except:
        print(f"\"{image_path}\" is not an recognized image file")
        continue
    (w, h) = image.size
    if sampling_rule == CENTER:
        col = image.getpixel((w//2, h//2))
    elif sampling_rule == AVERAGE:
        pixels = list(image.getdata())
        nonempty = []
        for pixel in pixels:
            if pixel[3]>0:
                nonempty.append(pixel)
        temp = Image.new("RGBA",(1,len(nonempty)))
        temp.putdata(nonempty)
        col = ImageStat.Stat(temp).mean
    elif sampling_rule == CORNER:
        col = image.getpixel((0,0))
    base_entries.append((col,i))
print("Done")

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
        if new_color[3]>=255-EPS or len(new_entry[1])>=MAX_HEIGHT:
            final_entries[new_color[0], new_color[1], new_color[2]] = new_entry[1]
        else:
            intermediate_entries.append(new_entry)
print("Done")
print(np.count_nonzero(final_entries))
os.chdir("..")
np.save(source, final_entries)