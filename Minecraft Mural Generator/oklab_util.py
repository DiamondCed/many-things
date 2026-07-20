import colortools_cx
import numpy as np
from math import floor
from colour import Oklab_to_XYZ, XYZ_to_sRGB


def _map(x, a, b, newA, newB):
    return ((x-a)/(b-a)*(newB-newA))+newA

def _lchToLab(oklch: dict) -> dict:
    a = oklch["c"]*np.cos(np.deg2rad(oklch["h"]))
    b = oklch["c"]*np.sin(np.deg2rad(oklch["h"]))
    return {"l": oklch["l"], "a": a, "b": b}

def _labToBytes(col: dict) -> tuple[int, int, int]:
    return (floor(_map(col["l"], 0, 1, 0, 255)),
            floor(_map(col["a"], -0.5, 0.5, 0, 255)), 
            floor(_map(col["b"], -0.5, 0.5, 0, 255)))

def toOklab(color: tuple[int, int, int]) -> tuple[int, int, int]:
    oklch = colortools_cx.rgb_to_oklch(*color)
    oklab = _lchToLab(oklch)
    return _labToBytes(oklab)
    
def getOklabDist(col1: tuple[int, int, int], col2: tuple[int, int, int]):
    return np.linalg.norm(np.asarray(col2)-np.asarray(col1))

def toRGB(labBytes: tuple[int, int, int]):
    labFloats = (_map(labBytes[0],0,255,0,1),
                 _map(labBytes[1],0,255,-0.5,0.5),
                 _map(labBytes[2],0,255,-0.5,0.5))
    rgbFloats = XYZ_to_sRGB(Oklab_to_XYZ(labFloats))
    return tuple([floor(_map(rgbFloats[i],0,1,0,255)) for i in range(3)])