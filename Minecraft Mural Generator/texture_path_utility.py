import os
import json

# Will always return the same list given the same sources
def get_texture_paths(presets: list[str], antipresets: list[str] = []): 
    paths = []
    for preset in presets:
        with open(os.path.join("sources", preset+".json"), "r") as file:
            paths += json.load(file)
    antipaths = []
    for preset in antipresets:
        with open(os.path.join("sources", preset+".json"), "r") as file:
            antipaths += json.load(file)
    paths = list(set(paths)-set(antipaths))
    paths.sort()
    return paths

# just to ensure the naming convention is consistent, otherwise everything breaks
def name_to_presets(name: str) -> tuple[list, list]:
    presets = name.split("+")
    antipresets = presets.pop().split("-")
    presets.append(antipresets.pop(0)) # the first name after the last + was also a positive
    return (presets, antipresets)

def presets_to_name(presets: list[str], antipresets: list[str] = []):
    return "-".join(["+".join(presets)]+antipresets)
