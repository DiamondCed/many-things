from texture_path_utility import get_texture_paths, presets_to_name
import json
import os
from tkinter import filedialog, simpledialog

os.chdir("sources")

textures = filedialog.askopenfilenames(defaultextension="png", initialdir=os.getcwd())
textures = [os.path.relpath(path) for path in textures]
preset_name = simpledialog.askstring("Preset Generator", "Preset Name: ")

with open(preset_name+".json", "w") as file:
    json.dump(textures, file, indent=4)
