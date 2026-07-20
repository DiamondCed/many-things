from PIL import Image
from map_color import get_color_data, set_color_file, get_color_format, RGB, OKLAB
import os
from oklab_util import toRGB
import matplotlib.pyplot as plt

set_color_file(input("Colorspace file path: "))
color_data = get_color_data()
color_format = get_color_format()

if not os.path.exists("./debug"):
    os.mkdir("./debug")
os.chdir("./debug")

points_x = []
points_y = []
points_z = []
points_c = []

if color_format==RGB:
    for page in range(color_data.shape[2]):
        img=Image.new("RGB",(256,256),(0,0,0))
        for r in range(color_data.shape[0]):
            for g in range(color_data.shape[1]):
                dat = color_data[r,g,page]
                if dat is None:
                    continue
                img.putpixel((r,g),(r,g,page))
                points_x.append(r)
                points_y.append(g)
                points_z.append(page)
                points_c.append((r/255,g/255,page/255))
        img.save(f"debug_{page}.png")

elif color_format==OKLAB:
    for page in range(color_data.shape[0]):
        img=Image.new("RGB",(256,256),(0,0,0))
        for a in range(color_data.shape[1]):
            for b in range(color_data.shape[2]):
                dat = color_data[page,a,b]
                if dat is None:
                    continue
                rgb = toRGB((page, a, b))
                img.putpixel((a,b),rgb)
                points_x.append(a)
                points_y.append(b)
                points_z.append(page)
                points_c.append([min(max(x/255,0),1) for x in rgb])
        img.save(f"debug_{page}.png")


fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.scatter3D(points_x, points_y, points_z, c = points_c, s = 10)
fig.show()
input()