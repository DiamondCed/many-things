from oklab_util import toRGB, toOklab
import matplotlib.pyplot as plt
import numpy as np

# to prevent circular imports
RGB="rgb"
OKLAB="oklab"

cloud = None
color_format = None
color_data = None

def init_colorspace_plot(p_color_data, p_color_format):
    global cloud, color_format, color_data
    
    color_format = p_color_format
    color_data = p_color_data

    existing_data = np.asarray(np.nonzero(color_data)).transpose().tolist()

    points_x = []
    points_y = []
    points_z = []
    points_c = []

    if color_format==RGB:
        for page in range(color_data.shape[2]):
            for r in range(color_data.shape[0]):
                for g in range(color_data.shape[1]):
                    dat = color_data[r,g,page]
                    if dat is None:
                        continue
                    points_x.append(r)
                    points_y.append(g)
                    points_z.append(page)
                    points_c.append((r/255,g/255,page/255))

    elif color_format==OKLAB:
        for point in existing_data:
            rgb = toRGB(point)
            points_x.append(point[0])
            points_y.append(point[1])
            points_z.append(point[2])
            points_c.append([min(max(x/255,0),1) for x in rgb])

    cloud = (points_x, points_y, points_z, points_c)

def show_colorspace(rgbTarget: tuple[int, int, int] = None, result: tuple[int, int, int] = None):
    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    
    target = rgbTarget
    rgbResult = result
    if color_format==OKLAB:
        target = toOklab(rgbTarget)
        rgbResult = toRGB(result)
        ax.set_xlabel("l")
        ax.set_ylabel("a")
        ax.set_zlabel("b")
    
    ax.plot(result[0], result[1], result[2], c=[min(max(x/255,0),1) for x in rgbResult], marker="o", ms=10)
    ax.plot(target[0], target[1], target[2], c=[min(max(x/255,0),1) for x in rgbTarget], marker="s", ms=10)
    ax.scatter3D(cloud[0], cloud[1], cloud[2], c = cloud[3], s = 20)
    fig.show()
    #input()


