from map_color import map_color, source_files
from schematic_maker import *
from PIL import Image
import numpy as np

imgpath = input("Image path: ")
imgpath = imgpath.strip("\"") # because by default copy as path adds quotes

def remove_transparency(image : Image.Image):
    if(not image.mode in ["RGBA","RGBa","LA","PA","La"]): # no transparency to remove in the first place
        return image
    data = np.array(image.convert("RGBA"))
    _,_,_,a = data.T

    t = (a==0)
    data[..., :-1][t.T] = (0,0,0) # makes all transparent pixels pure black, which is automatically masked out when glassifying
    newim = Image.fromarray(data)
    return newim

image = Image.open(imgpath)

image_quantized: Image.Image = remove_transparency(image).convert("RGB")#image.quantize(256, dither=Image.Dither.NONE).convert("RGB")

colors = image_quantized.getcolors(65536)
glass_colors = [map_color(x[1]) for x in colors]

"""
key = open("glassified_image_key.txt", "w")
key.write("block key: \n")
for i in range(len(source_files)):
    key.write(f"{i}: {source_files[i]}\n")
key.write("\n")

for i, color in enumerate(colors):
    line = f"{color[1]}: {glass_colors[i]}"
    key.write(line+"\n")
    print(line)
key.close()
"""
image_quantized.save("glassified_image_reference.png")


make_schematic(image_quantized, glass_colors, source_files)