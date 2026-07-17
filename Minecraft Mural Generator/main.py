# Originally from Pixel Art Glassifier project, might contain leftover idiosyncracies from that

from map_color import map_color, set_color_file, get_texture_filepaths
from reference_maker import make_reference
#from schematic_maker import *
from PIL import Image
import numpy as np

set_color_file(input("Color file path: "))

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
block_colors = [map_color(x[1]) for x in colors]

image_quantized.save("mural_image_quantized.png")

make_reference(image_quantized, block_colors, get_texture_filepaths())

#make_schematic(image_quantized, block_colors, get_source_filespaths())