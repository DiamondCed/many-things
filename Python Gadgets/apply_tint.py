import argparse
import PIL.Image as im
import re

# setup for file select dialog
import tkinter as tk
from tkinter import filedialog

root = tk.Tk()
root.withdraw()
# /file select setup

parser = argparse.ArgumentParser()
parser.add_argument("files", nargs="*")
parser.add_argument("-c", "--color", type=str)

args = parser.parse_args()

print("Getting Target Files...")
filenames = args.files
if(len(filenames) == 0):
    filenames = filedialog.askopenfilenames(
        title='Select images'
    ) 
    if len(filenames)==0:
        exit() 
print(f"{filenames}\n")

print("Getting Tint Color...")
color = args.color
if(color is None):
    color=input("Color code: 0x")
else:
    print(f"{color}\n")

color = color.upper().removeprefix("#").removeprefix("0x").zfill(6)
if(not re.match(r"[\dABCDEF]{6}", color)):
    input(f"Invalid color code {color};")


tint_channels = [int.from_bytes(bytes.fromhex(color[2*i:2*(i+1)])) for i in range(3)]

for filename in filenames:
    img = im.open(filename).convert("RGBA")
    bands = [img.getchannel(band) for band in ["R", "G", "B"]]
    tinted_bands = [im.eval(bands[i], lambda x: tint_channels[i]*x/255) for i in range(len(bands))]
    tinted_img = im.merge("RGBA", [*tinted_bands, img.getchannel("A")])

    new_filename = filename.split(".")
    new_filename[0] += "_tinted" # this returning None is my villain origin story istg
    new_filename = ".".join(new_filename)
    tinted_img.save(new_filename)
    tinted_img.show()

    