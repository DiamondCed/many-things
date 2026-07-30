# Originally from Pixel Art Glassifier project, might contain leftover idiosyncracies from that

import numpy as np
from PIL import ImageColor
from texture_path_utility import *
from oklab_util import *
import debug_plotter

# color_format enum
RGB="rgb"
OKLAB="oklab"

color_data: np.ndarray = np.ndarray((0,0,0),list)
color_filename = ""
texture_filepaths = None
color_format = ""

def set_color_file(filepath: str):
    global color_data, color_filename, texture_filepaths, color_format
    color_data = np.load(filepath.strip("\""), allow_pickle=True) # let the user deal with this error themselves
    color_filename = os.path.relpath(filepath)
    meta_filename = "".join(color_filename.split(".")[:-1])+".json"
    try:
        with open(meta_filename, "r") as file:
            metadata = json.load(file)
        presets = metadata["presets"]
        antipresets = metadata["antipresets"]
        color_format = metadata["color_format"]
        texture_filepaths = get_texture_paths(presets, antipresets)
    except:
        texture_filepaths = None
        print("Metadata file missing or incorrectly formatted; try reextracting colorspace.")

def get_color_data() -> np.ndarray:
    return color_data

def get_texture_filepaths() -> list[str]:
    return texture_filepaths

def get_color_format() -> str:
    return color_format

class UninitializedException(Exception):
    pass
#default_filename = "source.npy"
#set_file(default_filename)

def _map_color(color: tuple, radius=-1):
    # check within iteratively larger squares around the target until it's no longer empty, 
    # then pick the nearest of those in taxicab metric. this does mean it slightly favors the diagonal directions, oh well. # (actually I think it does euclidian distance due to the squaring)
    if(not color_data.any()):
        raise UninitializedException()
    
    if radius==-1:
        radius = np.max(color_data.shape) # prevents the static definition becoming outdated
    
    if color_format==OKLAB:
        color = toOklab(color)
    offset = 0
    min_dist = float("inf")
    best_option = None
    best_color = (0,0,0)
    while offset<radius:
        subset = color_data[
            max(color[0]-offset,0):min(color[0]+offset,255)+1, 
            max(color[1]-offset,0):min(color[1]+offset,255)+1, 
            max(color[2]-offset,0):min(color[2]+offset,255)+1]
        subset[1:-1, 1:-1, 1:-1] = None # only keep the shell
        options = np.nonzero(subset)

        offset+=1
        if(options[0].size==0): 
            continue

        options = np.asarray(options).transpose().tolist()
        for option in options:
            actual_pos = [option[x] + max(color[x]-offset,0) for x in range(3)]
            dist = pow(sum([(actual_pos[x]-color[x])**2 for x in range(3)]), 0.5)
            if(dist<min_dist):
                best_option = subset[*option]
                best_color = tuple(actual_pos)
                min_dist = dist
                radius = min(radius, dist) # reduce search space to cube containing sphere containing best
    return (best_option, best_color)       
        
def map_color(color: tuple, radius=-1) -> list[int]:
    return _map_color(color, radius)[0]


"""      
for b in range(256):
    for g in range(256):
        for r in range(256):
            dat = color_data[r,g,b]
            if(dat):
                input(f"({r}, {g}, {b}): {dat}")
"""


if __name__ == '__main__':
    filename = input("Color map file name: ")
    set_color_file(filename)
    debug_plotter.init_colorspace_plot(color_data, color_format)
    while True:
        try:
            col = input("Enter color hex code: ")
            rgbcol = ImageColor.getcolor(col if col[0]=="#" else f"#{col}", "RGB")
            result, rescol = _map_color(rgbcol)
            debug_plotter.show_colorspace(rgbcol, rescol)
            if(not texture_filepaths):
                print(result) # default list output
            else:
                result.reverse()
                print("Block textures required: ")
                for ind in result:
                    print(texture_filepaths[ind])
        except ValueError as e:
            print("Invalid hex code, please try again")
            continue
        except IndexError:
            break

