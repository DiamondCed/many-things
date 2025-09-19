import glob
from PIL import Image
import argparse
import pathlib
import itertools

def make_gif(frame_folder, duration, output_file):
    imagenames = [*itertools.chain(*(glob.glob(f"{frame_folder}/*.{e}") for e in ["png","jpg"]))] # atrocious way to support multiple filetypes
    frames = [Image.open(image) for image in imagenames]
    frame_one = frames[0]
    if output_file is None:
        output_file = pathlib.Path(imagenames[0]).stem+".gif"
    frame_one.save(output_file, format="GIF", append_images=frames,
               save_all=True, duration=duration, loop=0)
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("folder",type=pathlib.Path)
    exclusive = parser.add_mutually_exclusive_group()
    exclusive.add_argument("-d","--duration",type=float) # native way to make gifs; the duration of each frame in ms
    exclusive.add_argument("-f","--framerate",type=float) # a more logical way to think of the input images; the number of frames per second
    parser.add_argument("-o","--output_file",type=pathlib.Path)
    # if neither provided: assume 50fps (the standard supported framerate)
    args = parser.parse_args()

    path = args.folder
    duration = args.duration if args.duration is not None else 1000/(args.framerate) if args.framerate is not None else 20 # = 50fps
    outpath = args.output_file # None case handled in function

    make_gif(path, duration, outpath)
