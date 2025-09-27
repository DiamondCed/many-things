from PIL import Image
from map_color import color_data
import os

if not os.path.exists("./debug"):
    os.mkdir("./debug")
os.chdir("./debug")

for page in range(color_data.shape[2]):
    img=Image.new("RGB",(256,256),(0,0,0))
    for r in range(color_data.shape[0]):
        for g in range(color_data.shape[1]):
            dat = color_data[r,g,page]
            if dat is None:
                continue
            img.putpixel((r,g),(r,g,page))

    img.save(f"debug_{page}.png")