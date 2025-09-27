import os
import numpy as np
from PIL import ImageColor

color_data: np.ndarray = None
color_filename = ""
source_files = None

def set_file(filename: str):
    global color_data, color_filename, source_files
    color_data = np.load(filename, allow_pickle=True) # let the user deal with this error themselves
    color_filename = filename
    try:
        source_files = os.listdir(os.path.join(os.getcwd(), *filename.split(".")[:-1])) # if a directory by that name exists, the files within are assumed to correspond to indices
    except:
        source_files = None
        print("No source files found; no information will be given about which blocks to use")

default_filename = "source.npy"
set_file(default_filename)

def map_color(color: tuple) -> list:
    # check within iteratively larger squares around the target until it's no longer empty, 
    # then pick the nearest of those in taxicab metric. this does mean it slightly favors the diagonal directions, oh well. # (actually I think it does euclidian distance due to the squaring)
    offset = 0
    while offset<256: # 256 being the known size of the array in each of the 3 dimensions
        subset = color_data[
            max(color[0]-offset,0):min(color[0]+offset,255)+1, 
            max(color[1]-offset,0):min(color[1]+offset,255)+1, 
            max(color[2]-offset,0):min(color[2]+offset,255)+1]
        options = np.nonzero(subset)
        if(options[0].size==0):
            offset+=1
        else:
            min_dist = float("inf")
            best_option = None
            options = np.asarray(options).transpose().tolist()
            for option in options:
                dist = sum([(option[x]-offset//2)**2 for x in range(3)]) # technically dist squared but works the same here
                if(dist<min_dist):
                    best_option = option
                    min_dist = dist
            
            return subset[*best_option]

"""      
for b in range(256):
    for g in range(256):
        for r in range(256):
            dat = color_data[r,g,b]
            if(dat):
                input(f"({r}, {g}, {b}): {dat}")
"""


if __name__ == '__main__':
    filename = input("Color map file name? [leave empty for \"source.npy\"] ")
    if filename:
        set_file(filename)
    
    while True:
        try:
            col = input("Enter color hex code: ")
            rgbcol = ImageColor.getcolor(col if col[0]=="#" else f"#{col}", "RGB")
            mappedcol = map_color(rgbcol)
            if(not source_files):
                print(mappedcol) # default list output
            else:
                mappedcol.reverse()
                print("Block textures required: ")
                for ind in mappedcol:
                    print(source_files[ind])
        except ValueError:
            print("Invalid hex code, please try again")
            continue

