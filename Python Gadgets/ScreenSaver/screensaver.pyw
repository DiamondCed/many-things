import tkinter as tk
from PIL import Image
from pystray import MenuItem as item
from pystray import Menu
import pystray
import os
import time
from pynput import mouse
from pynput import keyboard
import math
from copy import deepcopy
from noise import pnoise2
import random
import colorsys
import PIL.ImageTk
import sys

# set cwd to wherever this is
os.chdir(os.path.dirname(os.path.abspath(__file__)))

#both in seconds
MIN_INACT_SPAWN = 300  # time before screensaver triggers
SLEEP_DELAY = 5  # time between checks to start screensaver (the "uncertainty" on time of start)

dirs=os.listdir()
if "config.txt" in dirs:
    configs=open("config.txt","r").read()
    configs=configs.replace(" ","")
    configs=configs.split("\n")
    for elem in configs:
        elem = elem.split(":")
        if len(elem)>1:
            try:
                elem[1]=int(elem[1])
            except ValueError:
                #do nothing
                a=1
        if type(elem[1])==type(1):
            if elem[0]=="MIN_INACT_SPAWN":
                MIN_INACT_SPAWN=elem[1]
            elif elem[0]=="SLEEP_DELAY":
                SLEEP_DELAY=elem[1]

print(str(MIN_INACT_SPAWN)+", "+str(SLEEP_DELAY))

# setup keyboard and mouse input detection

def onInput(a=0,b=0,c=0,d=0):
    global inactLoops, lastActiveFrame
    lastActiveFrame=time.time()
    inactLoops=0


kl = keyboard.Listener(on_press=onInput,suppress=False)
kl.start()
ml = mouse.Listener(on_move=onInput,on_click=onInput,on_scroll=onInput,suppress=False)
ml.start()

paused=False

#screensaver code, mirrors the preload/setup/draw from p5
def scaleList(list,fac):
    for i in range(len(list)):
        list[i]=list[i]*fac
    return(list)

rotatSpd=0.05
colorSpd=1
PHI=(1+math.sqrt(5))/2
nPHI=1/PHI
TRI=(1+4*math.cosh(math.acosh(2+3/8)/3))/3
SCUBO=1.2 #scale cuboctahedron
SRCO=0.6 #scale rhombicuboctahedron
SSCUB=0.8 #scale snub cube
SGDID=1.25 #scale great dodecicosidodecahedron
#default scale/pos values
scal=70
redoScal=True
camDist=-400
#edges,faces,corners+ids,color,rotateFreeAxies,colorMode
settings=[1,1,0,[170,100,100],[1,1,1],2]
#these are just for backwards-compatibility, will never be changed
mode=2
useControls=False
allowSwitching=True
#corner coordinate lists
cubeCorners=[
    [-1,-1,-1], #0
    [-1,1,-1],  #1
    [-1,1,1],   #2
    [-1,-1,1],  #3
    [1,-1,1],   #4
    [1,-1,-1],  #5
    [1,1,-1],   #6
    [1,1,1]     #7
  ]
icoCorners=[
    [0,PHI,1],
    [0,-PHI,1],
    [0,PHI,-1],
    [0,-PHI,-1],
    
    [1,0,PHI],
    [-1,0,PHI],
    [1,0,-PHI],
    [-1,0,-PHI],
    
    [PHI,1,0],
    [-PHI,1,0],
    [PHI,-1,0],
    [-PHI,-1,0]  
  ]
dodeCorners=[
    [1,1,1],
    [1,1,-1],
    [1,-1,1],
    [1,-1,-1],
    [-1,1,1],
    [-1,1,-1],
    [-1,-1,1],
    [-1,-1,-1],
    [0,PHI,nPHI],
    [0,PHI,-nPHI],
    [0,-PHI,nPHI],
    [0,-PHI,-nPHI],
    [nPHI,0,PHI],
    [nPHI,0,-PHI],
    [-nPHI,0,PHI],
    [-nPHI,0,-PHI],
    [PHI,nPHI,0],
    [PHI,-nPHI,0],
    [-PHI,nPHI,0],
    [-PHI,-nPHI,0]
  ]
cuboctaCorners=[
    scaleList([1,1,0],SCUBO),
    scaleList([1,-1,0],SCUBO),
    scaleList([-1,1,0],SCUBO),
    scaleList([-1,-1,0],SCUBO),
    scaleList([1,0,1],SCUBO),
    scaleList([1,0,-1],SCUBO),
    scaleList([-1,0,1],SCUBO),
    scaleList([-1,0,-1],SCUBO),
    scaleList([0,1,1],SCUBO),
    scaleList([0,1,-1],SCUBO),
    scaleList([0,-1,1],SCUBO),
    scaleList([0,-1,-1],SCUBO)
  ]
rhombDodeCorners=[
    [-1,-1,-1],
    [-1,1,-1],
    [-1,1,1], 
    [-1,-1,1],
    [1,-1,1], 
    [1,-1,-1],
    [1,1,-1], 
    [1,1,1],
    [0,0,2],
    [0,0,-2],
    [0,2,0],
    [0,-2,0],
    [2,0,0],
    [-2,0,0]
  ]
rhombicuboctaCorners=[
    scaleList([1,1,(1+math.sqrt(2))],SRCO),
    scaleList([1,-1,(1+math.sqrt(2))],SRCO),
    scaleList([1,1,-(1+math.sqrt(2))],SRCO),
    scaleList([1,-1,-(1+math.sqrt(2))],SRCO),
    
    scaleList([1,(1+math.sqrt(2)),1],SRCO),
    scaleList([1,-(1+math.sqrt(2)),1],SRCO),
    scaleList([1,(1+math.sqrt(2)),-1],SRCO),
    scaleList([1,-(1+math.sqrt(2)),-1],SRCO),
    
    scaleList([(1+math.sqrt(2)),1,1],SRCO),
    scaleList([(1+math.sqrt(2)),-1,1],SRCO),
    scaleList([(1+math.sqrt(2)),1,-1],SRCO),
    scaleList([(1+math.sqrt(2)),-1,-1],SRCO),
    
    scaleList([-1,1,(1+math.sqrt(2))],SRCO),
    scaleList([-1,-1,(1+math.sqrt(2))],SRCO),
    scaleList([-1,1,-(1+math.sqrt(2))],SRCO),
    scaleList([-1,-1,-(1+math.sqrt(2))],SRCO),
    
    scaleList([-1,(1+math.sqrt(2)),1],SRCO),
    scaleList([-1,-(1+math.sqrt(2)),1],SRCO),
    scaleList([-1,(1+math.sqrt(2)),-1],SRCO),
    scaleList([-1,-(1+math.sqrt(2)),-1],SRCO),
    
    scaleList([-(1+math.sqrt(2)),1,1],SRCO),
    scaleList([-(1+math.sqrt(2)),-1,1],SRCO),
    scaleList([-(1+math.sqrt(2)),1,-1],SRCO),
    scaleList([-(1+math.sqrt(2)),-1,-1],SRCO)
  ]
icosidodeCorners=[
    [0,0,PHI],
    [0,0,-PHI],

    [0,PHI,0],
    [0,-PHI,0],

    [PHI,0,0],
    [-PHI,0,0],

    [0.5,(PHI**2)/2,PHI/2],
    [0.5,(PHI**2)/2,-PHI/2],
    [0.5,-(PHI**2)/2,PHI/2],
    [0.5,-(PHI**2)/2,-PHI/2],
    [-0.5,(PHI**2)/2,PHI/2],
    [-0.5,(PHI**2)/2,-PHI/2],
    [-0.5,-(PHI**2)/2,PHI/2],
    [-0.5,-(PHI**2)/2,-PHI/2],

    [PHI/2,0.5,(PHI**2)/2],
    [PHI/2,0.5,-(PHI**2)/2],
    [PHI/2,-0.5,(PHI**2)/2],
    [PHI/2,-0.5,-(PHI**2)/2],
    [-PHI/2,0.5,(PHI**2)/2],
    [-PHI/2,0.5,-(PHI**2)/2],
    [-PHI/2,-0.5,(PHI**2)/2],
    [-PHI/2,-0.5,-(PHI**2)/2],

    [(PHI**2)/2,PHI/2,0.5],
    [(PHI**2)/2,PHI/2,-0.5],
    [(PHI**2)/2,-PHI/2,0.5],
    [(PHI**2)/2,-PHI/2,-0.5],
    [-(PHI**2)/2,PHI/2,0.5],
    [-(PHI**2)/2,PHI/2,-0.5],
    [-(PHI**2)/2,-PHI/2,0.5],
    [-(PHI**2)/2,-PHI/2,-0.5]
  ]
rhombTriaCorners=[
    [1,1,1],
    [1,1,-1],
    [1,-1,1],
    [1,-1,-1],
    [-1,1,1],
    [-1,1,-1],
    [-1,-1,1],
    [-1,-1,-1],
    [0,PHI,nPHI],
    [0,PHI,-nPHI],
    [0,-PHI,nPHI],
    [0,-PHI,-nPHI],
    [nPHI,0,PHI],
    [nPHI,0,-PHI],
    [-nPHI,0,PHI],
    [-nPHI,0,-PHI],
    [PHI,nPHI,0],
    [PHI,-nPHI,0],
    [-PHI,nPHI,0],
    [-PHI,-nPHI,0],
    
    [1,PHI,0],
    [1,-PHI,0],
    [-1,PHI,0],
    [-1,-PHI,0],
    
    [0,1,PHI],
    [0,-1,PHI],
    [0,1,-PHI],
    [0,-1,-PHI],
    
    [PHI,0,1],
    [-PHI,0,1],
    [PHI,0,-1],
    [-PHI,0,-1] 
  ]
snubCubeCorners=[
    #scaleList([1,1/TRI,TRI],SSCUB),
    scaleList([1,1/TRI,-TRI],SSCUB),
    scaleList([1,-1/TRI,TRI],SSCUB),
    #scaleList([1,-1/TRI,-TRI],SSCUB),
    
    #scaleList([1/TRI,TRI,1],SSCUB),
    scaleList([1/TRI,-TRI,1],SSCUB),
    scaleList([1/TRI,TRI,-1],SSCUB),
    #scaleList([1/TRI,-TRI,-1],SSCUB),
    
    #scaleList([TRI,1,1/TRI],SSCUB),
    scaleList([TRI,-1,1/TRI],SSCUB),
    scaleList([TRI,1,-1/TRI],SSCUB),
    #scaleList([TRI,-1,-1/TRI],SSCUB),
    
    scaleList([-1,1/TRI,TRI],SSCUB),
    #scaleList([-1,1/TRI,-TRI],SSCUB),
    #scaleList([-1,-1/TRI,TRI],SSCUB),
    scaleList([-1,-1/TRI,-TRI],SSCUB),
    
    scaleList([-1/TRI,TRI,1],SSCUB),
    #scaleList([-1/TRI,-TRI,1],SSCUB),
    #scaleList([-1/TRI,TRI,-1],SSCUB),
    scaleList([-1/TRI,-TRI,-1],SSCUB),
    
    scaleList([-TRI,1,1/TRI],SSCUB),
    #scaleList([-TRI,-1,1/TRI],SSCUB),
    #scaleList([-TRI,1,-1/TRI],SSCUB),
    scaleList([-TRI,-1,-1/TRI],SSCUB),
    
    
    scaleList([1/TRI,1,TRI],SSCUB),
    #scaleList([1/TRI,1,-TRI],SSCUB),
    #scaleList([1/TRI,-1,TRI],SSCUB),    
    scaleList([1/TRI,-1,-TRI],SSCUB),
    
    scaleList([1,TRI,1/TRI],SSCUB),
    #scaleList([1,-TRI,1/TRI],SSCUB),
    #scaleList([1,TRI,-1/TRI],SSCUB),
    scaleList([1,-TRI,-1/TRI],SSCUB),
    
    scaleList([TRI,1/TRI,1],SSCUB),
    #scaleList([TRI,-1/TRI,1],SSCUB),
    #scaleList([TRI,1/TRI,-1],SSCUB),
    scaleList([TRI,-1/TRI,-1],SSCUB),
    
    #scaleList([-1/TRI,1,TRI],SSCUB),
    scaleList([-1/TRI,1,-TRI],SSCUB),
    scaleList([-1/TRI,-1,TRI],SSCUB),
    #scaleList([-1/TRI,-1,-TRI],SSCUB),
    
    #scaleList([-1,TRI,1/TRI],SSCUB),
    scaleList([-1,-TRI,1/TRI],SSCUB),
    scaleList([-1,TRI,-1/TRI],SSCUB),
    #scaleList([-1,-TRI,-1/TRI],SSCUB),
    
    #scaleList([-TRI,1/TRI,1],SSCUB),
    scaleList([-TRI,-1/TRI,1],SSCUB),
    scaleList([-TRI,1/TRI,-1],SSCUB),
    #scaleList([-TRI,-1/TRI,-1],SSCUB)
    
  ]
greatDodecicosidodecaCorners=[
    
    scaleList([1/PHI**2,0,(2-1/PHI)],SGDID),
    scaleList([-1/PHI**2,0,(2-1/PHI)],SGDID),
    scaleList([1/PHI**2,0,-(2-1/PHI)],SGDID),
    scaleList([-1/PHI**2,0,-(2-1/PHI)],SGDID),
    
    scaleList([0,(2-1/PHI),1/PHI**2],SGDID),
    scaleList([0,(2-1/PHI),-1/PHI**2],SGDID),
    scaleList([0,-(2-1/PHI),1/PHI**2],SGDID),
    scaleList([0,-(2-1/PHI),-1/PHI**2],SGDID),
    
    scaleList([(2-1/PHI),1/PHI**2,0],SGDID),
    scaleList([(2-1/PHI),-1/PHI**2,0],SGDID),
    scaleList([-(2-1/PHI),1/PHI**2,0],SGDID),
    scaleList([-(2-1/PHI),-1/PHI**2,0],SGDID),
    
    
    scaleList([1,1/PHI**3,1],SGDID),
    scaleList([1,-1/PHI**3,1],SGDID),
    scaleList([1,1/PHI**3,-1],SGDID),
    scaleList([1,-1/PHI**3,-1],SGDID),
    
    scaleList([-1,1/PHI**3,1],SGDID),
    scaleList([-1,-1/PHI**3,1],SGDID),
    scaleList([-1,1/PHI**3,-1],SGDID),
    scaleList([-1,-1/PHI**3,-1],SGDID),
    
    scaleList([1/PHI**3,1,1],SGDID),
    scaleList([-1/PHI**3,1,1],SGDID),
    scaleList([1/PHI**3,-1,1],SGDID),
    scaleList([-1/PHI**3,-1,1],SGDID),
    
    scaleList([1/PHI**3,1,-1],SGDID),
    scaleList([-1/PHI**3,1,-1],SGDID),
    scaleList([1/PHI**3,-1,-1],SGDID),
    scaleList([-1/PHI**3,-1,-1],SGDID),
    
    scaleList([1,1,1/PHI**3],SGDID),
    scaleList([1,1,-1/PHI**3],SGDID),
    scaleList([-1,1,1/PHI**3],SGDID),
    scaleList([-1,1,-1/PHI**3],SGDID),
    
    scaleList([1,-1,1/PHI**3],SGDID),
    scaleList([1,-1,-1/PHI**3],SGDID),
    scaleList([-1,-1,1/PHI**3],SGDID),
    scaleList([-1,-1,-1/PHI**3],SGDID),
    
    
    scaleList([1/PHI,1/PHI**2,2/PHI],SGDID),
    scaleList([1/PHI,-1/PHI**2,2/PHI],SGDID),
    scaleList([1/PHI,1/PHI**2,-2/PHI],SGDID),
    scaleList([1/PHI,-1/PHI**2,-2/PHI],SGDID),
    
    scaleList([-1/PHI,1/PHI**2,2/PHI],SGDID),
    scaleList([-1/PHI,-1/PHI**2,2/PHI],SGDID),
    scaleList([-1/PHI,1/PHI**2,-2/PHI],SGDID),
    scaleList([-1/PHI,-1/PHI**2,-2/PHI],SGDID),
    
    scaleList([1/PHI**2,2/PHI,1/PHI],SGDID),
    scaleList([-1/PHI**2,2/PHI,1/PHI],SGDID),
    scaleList([1/PHI**2,-2/PHI,1/PHI],SGDID),
    scaleList([-1/PHI**2,-2/PHI,1/PHI,],SGDID),
    
    scaleList([1/PHI**2,2/PHI,-1/PHI],SGDID),
    scaleList([-1/PHI**2,2/PHI,-1/PHI],SGDID),
    scaleList([1/PHI**2,-2/PHI,-1/PHI],SGDID),
    scaleList([-1/PHI**2,-2/PHI,-1/PHI],SGDID),
    
    scaleList([2/PHI,1/PHI,1/PHI**2],SGDID),
    scaleList([2/PHI,1/PHI,-1/PHI**2],SGDID),
    scaleList([-2/PHI,1/PHI,1/PHI**2],SGDID),
    scaleList([-2/PHI,1/PHI,-1/PHI**2],SGDID),
    
    scaleList([2/PHI,-1/PHI,1/PHI**2],SGDID),
    scaleList([2/PHI,-1/PHI,-1/PHI**2],SGDID),
    scaleList([-2/PHI,-1/PHI,1/PHI**2],SGDID),
    scaleList([-2/PHI,-1/PHI,-1/PHI**2],SGDID)
  ]

#face corners lists
cubeFaces=[
    [0,1,2,3,0],
    [0,5,6,1,0],
    [5,6,7,4,5],
    [3,2,7,4,3],
    [1,6,7,2,1],
    [0,5,4,3,0]
  ]
icoFaces=[
    [0,4,5,0],
    [1,4,5,1],
    [2,6,7,2],
    [3,6,7,3],
    [1,4,10,1],
    [0,4,8,0],
    [4,8,10,4],
    [0,2,8,0],
    [0,2,9,0],
    [2,6,8,2],
    [6,8,10,6],
    [3,6,10,3],
    [0,5,9,0],
    [1,3,10,1],
    [2,7,9,2],
    [1,3,11,1],
    [1,5,11,1],
    [5,9,11,5],
    [3,7,11,3],
    [7,9,11,7]
  ]
dodeFaces=[
    [0,8,4,14,12,0],
    [4,14,6,19,18,4],
    [4,8,9,5,18,4],
    [18,19,7,15,5,18],
    [5,9,1,13,15,5],
    [1,9,8,0,16,1],
    [11,3,13,15,7,11],
    [10,11,7,19,6,10],
    [3,13,1,16,17,3],
    [11,10,2,17,3,11],
    [2,17,16,0,12,2],
    [10,2,12,14,6,10]
  ]
stelDodeFaces=[
    [0,1,9,4,11,0],
    [5,3,4,11,10,5],
    [1,7,10,11,6,1],
    [1,9,3,5,7,1],
    [11,0,7,5,2,11],
    [11,2,3,9,6,11],
    [6,0,10,2,4,6],
    [8,1,6,4,3,8],
    [8,5,10,0,1,8],
    [8,9,4,2,5,8],
    [8,7,0,6,9,8],
    [8,3,2,10,7,8]
  ]  #paired with icoCorners
cuboctaFaces=[
    [0,4,8,0],
    [0,5,9,0],
    [3,6,10,3],
    [3,7,11,3],
    [2,6,8,2],
    [2,7,9,2],
    [1,4,10,1],
    [1,5,11,1],
    [1,10,3,11,1],
    [1,4,0,5,1],
    [3,6,2,7,3],
    [10,4,8,6,10],
    [11,5,9,7,11],
    [9,0,8,2,9]
  ]
rhombDodeFaces=[
    [8,3,11,4,8],
    [9,0,11,5,9],
    [12,4,11,5,12],
    [13,0,11,3,13],
    [8,7,10,2,8],
    [13,2,10,1,13],
    [9,1,10,6,9],
    [12,6,10,7,12],
    [8,4,12,7,8],
    [12,5,9,6,12],
    [9,0,13,1,9],
    [13,3,8,2,13]
  ]
rhombicuboctaFaces=[
    [2,3,15,14,2],
    [8,9,11,10,8],
    [20,21,23,22,20],
    [0,1,13,12,0],
    [4,6,18,16,4],
    [5,7,19,17,5],
    [1,5,17,13,1],
    [0,1,9,8,0],
    [0,4,16,12,0],
    [12,13,21,20,12],
    [3,7,19,15,3],
    [14,15,23,22,14],
    [2,6,18,14,2],
    [2,3,11,10,2],
    [5,7,11,9,5],
    [4,6,10,8,4],
    [17,19,23,21,17],
    [16,18,22,20,16],
    [2,6,10,2],
    [3,7,11,3],
    [15,19,23,15],
    [14,18,22,14],
    [12,16,20,12],
    [13,17,21,13],
    [0,4,8,0],
    [1,5,9,1]
  ]
icosidodeFaces=[
    [13,29,28,12,3,13],
    [12,28,20,12],
    [12,3,8,12],
    [3,13,9,3],
    [13,29,21,13],
    [5,29,28,5],
    [28,20,18,26,5,28],
    [20,18,0,20],
    [18,26,10,18],
    [5,26,27,5],
    [21,29,5,27,19,21],
    [21,19,1,21],
    [19,27,11,19],
    [11,27,26,10,2,11],
    [10,6,2,10],
    [11,2,7,11],
    [0,20,12,8,16,0],
    [0,14,16,0],
    [8,24,16,8],
    [24,8,3,9,25,24],
    [4,24,25,4],
    [17,9,25,17],
    [13,9,17,1,21,13],
    [1,15,17,1],
    [19,11,7,15,1,19],
    [7,15,23,7],
    [6,10,18,0,14,6],
    [6,14,22,6],
    [15,23,4,25,17,15],
    [22,14,16,24,4,22],
    [23,7,2,6,22,23],
    [22,23,4,22]
  ]
greatDodeFaces=[
    [0,5,1,10,8,0],
    [11,9,2,6,3,11],
    [7,2,8,10,3,7],
    [4,0,9,11,1,4],
    [3,7,2,8,10,3],
    [4,0,9,11,1,4],
    [5,0,2,7,11,5],
    [1,3,6,8,4,1],
    [10,6,2,0,4,10],
    [9,7,3,1,5,9],
    [7,6,10,1,11,7],
    [5,4,8,2,9,5]
  ]  #paired with icoCorners
greatIcoFaces=[
    [0,7,10,0],
    [4,3,9,4],
    [2,3,5,2],
    [0,1,6,0],
    [2,3,4,2],
    [0,1,7,0],
    [2,4,11,2],
    [1,7,8,1],
    [5,7,10,5],
    [4,6,9,4],
    [0,10,11,0],
    [3,8,9,3],
    [0,6,11,0],
    [3,5,8,3],
    [1,8,9,1],
    [2,10,11,2],
    [1,6,9,1],
    [2,5,10,2],
    [4,6,11,4],
    [5,7,8,5]
  
  ]  #paired with icoCorners
greatStelDodeFaces=[
    [0,19,17,4,11,0],
    [7,8,3,18,16,7],
    [0,19,1,14,15,0],
    [7,16,6,13,12,7],
    [0,11,9,2,15,0],
    [7,12,5,10,8,7],
    [1,10,5,17,19,1],
    [6,9,2,18,16,6],
    [1,14,3,8,10,1],
    [6,9,11,4,13,6],
    [2,18,3,14,15,2],
    [5,12,13,4,17,5]
  ]  #paired with dodeCorners
ditriicosidodeFaces=[
    [0,1,8,16,9,0],
    [8,14,0,4,12,8],
    [0,2,16,12,17,0],
    [14,10,12,6,2,14],
    [18,6,4,19,14,18],
    [5,4,9,18,8,5],
    [19,11,6,7,10,19],
    [10,3,2,11,17,10],
    [17,13,16,3,1,17],
    [13,11,15,3,7,13],
    [18,15,19,5,7,18],
    [1,15,9,13,5,1],
    [0,9,4,0],
    [17,12,10,17],
    [1,0,17,1],
    [11,13,17,11],
    [12,6,4,12],
    [4,5,19,4],
    [19,11,15,19],
    [7,5,13,7],
    [7,18,6,7],
    [11,6,2,11],
    [10,14,19,10],
    [2,14,0,2],
    [14,18,8,14],
    [2,3,16,2],
    [3,1,15,3],
    [8,12,16,8],
    [8,5,1,8],
    [9,16,13,9],
    [7,3,10,7],
    [18,15,9,18]
  ]  #paired with dodeCorners
rhombTriaFaces=[
    [14,24,12,25,14],
    [14,29,6,25,14],
    [14,29,4,24,14],
    [25,6,23,10,25],
    [25,10,21,2,25],
    [25,2,28,12,25],
    [24,12,28,0,24],
    [24,4,22,8,24],
    [24,0,20,8,24],
    [28,2,21,17,28],
    [28,0,20,16,28],
    [28,17,30,16,28],
    [23,6,29,19,23],
    [29,4,22,18,29],
    [29,19,31,18,29],
    [23,19,31,7,23],
    [22,18,31,5,22],
    [21,3,30,17,21],
    [20,16,30,1,20],
    [21,10,23,11,21],
    [22,8,20,9,22],
    [23,7,27,11,23],
    [21,11,27,3,21],
    [22,9,26,5,22],
    [20,1,26,9,20],
    [27,13,30,3,27],
    [27,15,31,7,27],
    [26,5,31,15,26],
    [26,1,30,13,26],
    [27,13,26,15,27]
  ]
snubCubeFaces=[
    [1,12,6,19,1],
    [4,17,5,16,4],
    [0,13,7,18,0],
    [10,22,11,23,10],
    [2,20,9,15,2],
    [3,14,8,21,3],
    [1,2,4,1],
    [19,20,22,19],
    [13,15,17,13],
    [7,9,11,7],
    [0,3,5,0],
    [18,21,23,18],
    [12,14,16,12],
    [6,8,10,6],
    [1,2,19,1],
    [2,19,20,2],
    [6,19,22,6],
    [6,10,22,6],
    [6,8,12,6],
    [8,12,14,8],
    [1,4,16,1],
    [1,12,16,1],
    [7,9,13,7],
    [9,13,15,9],
    [0,5,17,0],
    [0,13,17,0],
    [0,3,18,0],
    [3,18,21,3],
    [7,18,23,7],
    [7,11,23,7],
    [2,4,15,2],
    [4,15,17,4],
    [9,11,20,9],
    [11,20,22,11],
    [5,14,16,5],
    [3,5,14,3],
    [8,10,21,8],
    [10,21,23,10]
  ]
stelTruncHexaFaces=[
    [0,7,22,0],
    [10,12,19,10],
    [8,14,17,8],
    [2,5,20,2],
    
    [9,15,16,9],
    [3,4,21,3],
    [1,6,23,1],
    [11,13,18,11],
    
    [16,17,8,20,5,4,21,9,16],
    [4,5,2,0,7,6,1,3,4],
    [18,19,12,14,17,16,15,13,18],
    [6,7,22,10,19,18,11,23,6],
    [13,15,9,21,3,1,23,11,13],
    [14,12,10,22,0,2,20,8,14]
  ]  #paired with rhombicuboctaCorners
greatDodecicosidodecaFaces=[
    [11,22,20,10,47,36,30,34,37,45,11],
    [40,46,8,21,23,9,44,41,32,28,40],
    [38,51,10,24,26,11,49,39,35,31,38],
    [8,50,42,29,33,43,48,9,27,25,8],
    [58,50,13,17,51,56,1,35,33,0,58],
    [54,43,6,16,18,7,41,55,27,23,54],
    [34,3,57,47,19,15,46,59,2,32,34],
    [22,26,53,37,7,14,12,6,39,52,22],
    [56,38,4,13,15,5,36,57,24,20,56],
    [55,44,14,18,45,53,3,30,28,2,55],
    [52,49,16,12,48,54,0,29,31,1,52],
    [59,40,5,19,17,4,42,58,21,25,59],
    [54,23,21,58,0,54],
    [20,22,52,1,56,20],
    [41,7,37,34,32,41],
    [5,40,28,30,36,5],
    [51,17,19,47,10,51],
    [18,16,49,11,45,18],
    [46,15,13,50,8,46],
    [35,39,6,43,33,35],
    [9,48,12,14,44,9],
    [42,4,38,31,29,42],
    [59,25,27,55,2,59],
    [26,24,57,3,53,26],
    [6,12,16,6],
    [40,46,59,40],
    [11,22,26,11],
    [9,23,27,9],
    [36,47,57,36],
    [5,15,19,5],
    [39,49,52,39],
    [8,21,25,8],
    [10,20,24,10],
    [43,48,54,43],
    [1,31,35,1],
    [3,30,34,3],
    [42,50,58,42],
    [7,14,18,7],
    [4,13,17,4],
    [41,44,55,41],
    [2,28,32,2],
    [38,51,56,38],
    [0,29,33,0],
    [37,45,53,37]
  ]
  
presets=[
    [cubeCorners,cubeFaces],
    [icoCorners,icoFaces],
    [dodeCorners,dodeFaces],
    [icoCorners,stelDodeFaces],
    [cuboctaCorners,cuboctaFaces],
    [rhombDodeCorners,rhombDodeFaces],
    [rhombicuboctaCorners,rhombicuboctaFaces],
    [icosidodeCorners,icosidodeFaces],
    [icoCorners,greatDodeFaces],
    [icoCorners,greatIcoFaces],
    [dodeCorners,greatStelDodeFaces],
    [dodeCorners,ditriicosidodeFaces],
    [rhombTriaCorners,rhombTriaFaces],
    [snubCubeCorners,snubCubeFaces],
    [rhombicuboctaCorners,stelTruncHexaFaces],
    [greatDodecicosidodecaCorners,greatDodecicosidodecaFaces]
  ]



class Shape:
    def __init__(self,usedPreset):
        self.usedPreset=usedPreset
        self.baseCorners=None
        self.corners=None
        self.faceVertices=None
        self.setBaseValues(usedPreset)
        
        self.color=random.random()*255
        
        self.angles=[0,0,0,0]
        self.translations=[screensaver.winfo_width()/2,screensaver.winfo_height()/2,0]
        self.scale=0.4
        
        self.randOffset=random.random()*time.time()/1000

    def update(self): 
        self.color=(self.color+colorSpd*(pnoise2((time.time()-startTime)/10,self.randOffset+3**15,1))+256)%256
        
        # the angles and translations change depending on a noise map
        self.angles[1]+=rotatSpd*(pnoise2((time.time()-startTime)/10,self.randOffset,1))
        self.angles[0]+=rotatSpd*(pnoise2((time.time()-startTime)/10+3**5,self.randOffset+3**5,1))
        self.angles[2]+=rotatSpd*(pnoise2((time.time()-startTime)/10+3**7,self.randOffset+3**7,1))
    
        self.translations[0]=(screensaver.winfo_width()-5*2*scal/10)*(pnoise2((time.time()-startTime)/5+3**8,self.randOffset+3**8,1))
        self.translations[1]=(screensaver.winfo_height()-5*2*scal/10)*(pnoise2((time.time()-startTime)/5+3**9,self.randOffset+3**9,1))
        self.translations[2]=(5*scal-5*2*scal/10)*(pnoise2((time.time()-startTime)/5+3**9,self.randOffset+3**9,1))
        #self.translations[0]=screensaver.winfo_width()*(pnoise2((time.time()-startTime)/5+3**8,self.randOffset+3**8,1))
        #self.translations[1]=screensaver.winfo_height()*(pnoise2((time.time()-startTime)/5+3**9,self.randOffset+3**9,1))
        #self.translations[2]=5*scal*9/10*(pnoise2((time.time()-startTime)/5+3**9,self.randOffset+3**9,1))
        
        self.updateCorners()

    def show(self):
    
        # draw the faces
        for i in range(len(self.faceVertices)):
            pts = []
            for j in range(len(self.faceVertices[i])):
                coords2d=To2d(self.corners[self.faceVertices[i][j]])
                pts.append(coords2d[0]+screensaver.winfo_width()/2)
                pts.append(coords2d[1]+screensaver.winfo_height()/2)
            canvas.create_polygon(pts,outline="",fill=hexColor(self.color,0.5))
            
        # draw the edges
        for i in range(len(self.faceVertices)):
            pts = []
            for j in range(len(self.faceVertices[i])):
                coords2d=To2d(self.corners[self.faceVertices[i][j]])
                pts.append(coords2d[0]+screensaver.winfo_width()/2)
                pts.append(coords2d[1]+screensaver.winfo_height()/2)
    
            #canvas.create_polygon(pts,outline="#ffffff",fill="",width=1) #white outline
            canvas.create_polygon(pts,outline=hexColor(self.color,1),fill="",width=1) #brighter main color outline
    
    def addPolysTo(self,polyList):
    
        for i in range(len(self.faceVertices)):
            pts = []
            avgZ = 0
            for j in range(len(self.faceVertices[i])):
                avgZ = avgZ - self.corners[self.faceVertices[i][j]][2]
                coords2d=To2d(self.corners[self.faceVertices[i][j]])
                pts.append(coords2d[0]+screensaver.winfo_width()/2)
                pts.append(coords2d[1]+screensaver.winfo_height()/2)
            polyList.append([pts,avgZ/len(pts),self.color])

    
    def updateCorners(self):
        # applies rotations to the base coordinate locations to get the rotated coordinates
  
        # do all 3 rotations at once in modes 0-2 because no player intervention
        a=self.angles[2]
        b=self.angles[1]
        y=self.angles[0]
        rotat=[
            [math.cos(a)*math.cos(b),math.cos(a)*math.sin(b)*math.sin(y)-math.sin(a)*math.cos(y),math.cos(a)*math.sin(b)*math.cos(y)+math.sin(a)*math.sin(y)],
            [math.sin(a)*math.cos(b),math.sin(a)*math.sin(b)*math.sin(y)+math.cos(a)*math.cos(y),math.sin(a)*math.sin(b)*math.cos(y)-math.cos(a)*math.sin(y)],
            [-math.sin(b),math.cos(b)*math.sin(y),math.cos(b)*math.cos(y)]
        ]
        for i in range(len(self.corners)):
            newCoords=[0,0,0]
            vx=self.baseCorners[i][0]
            vy=self.baseCorners[i][1]
            vz=self.baseCorners[i][2]
            newCoords[0]=(rotat[0][0]*vx+rotat[0][1]*vy+rotat[0][2]*vz) * self.scale + self.translations[0]/scal
            newCoords[1]=(rotat[1][0]*vx+rotat[1][1]*vy+rotat[1][2]*vz) * self.scale + self.translations[1]/scal
            newCoords[2]=(rotat[2][0]*vx+rotat[2][1]*vy+rotat[2][2]*vz) * self.scale + self.translations[2]/scal
    
            self.corners[i]=newCoords
    
    def setBaseValues(self,val):
        #updates the values used to draw the shape to that of the id, val
        self.baseCorners=deepcopy(presets[val][0])
        self.corners=deepcopy(presets[val][0])
        self.faceVertices=deepcopy(presets[val][1])

startTime=0
shapesAmt=5
shapes=[]
bg=None


#horizontalStretch=1
#verticalStretch=1

def load():
    global scal,camDist,startTime,shapesAmt,shapes,horizontalStretch,verticalStretch,bg
    shapes=[]
    for i in range(shapesAmt):
        shapes.append(Shape(math.floor(random.random()*len(presets))))
    startTime=time.time()
    if(redoScal):  
        scal=min(screensaver.winfo_width(),screensaver.winfo_height())/5
        camDist=5*scal
        #horizontalStretch=90/(2*math.atan(screensaver.winfo_width()/(5*scal))/math.pi*180)
        #verticalStretch=90/(2*math.atan(screensaver.winfo_height()/(5*scal))/math.pi*180)
    im=Image.open("background.jpg")
    im=im.resize([1920,1080])
    bg=PIL.ImageTk.PhotoImage(im)

def loop(a=1):
    global settings, angles, canvas, translations, shapes, inactLoops
    
    # update all shapes' colors, angles, translations and corners 
    for i in range(len(shapes)):
        shapes[i].update()  

    # draw the shape
    canvas.delete("all")
    
    # add the background image
    
    canvas.create_image(screensaver.winfo_width()/2,screensaver.winfo_height()/2,image=bg)
    
    # draw the shapes
    for i in range(len(shapes)):
        sorted(shapes,key=lambda shape:-shape.translations[2])[i].show()
    
    # get all the polygons from all the shapes and sort them by average z position, then draw faces then edges aka: the bad z-buffer method
    #polys=[]
    #for i in range(len(shapes)):
        #shapes[i].addPolysTo(polys)
    #for i in range(len(polys)):
        #canvas.create_polygon(sorted(polys,key=lambda poly: -poly[1])[i][0],outline="",fill=hexColor(sorted(polys,key=lambda poly: -poly[1])[i][2],0.5))
        #canvas.create_polygon(sorted(polys,key=lambda poly: -poly[1])[i][0],outline="#ffffff",fill="")
    
    #canvas.create_text(20,20,text=usedPreset,fill="#ffffff")
    
    screensaver.update()
    #manage screensaver window itself
    if(inactLoops==0):
        screensaver.destroy()
    screensaver.after(1,loop)
    
def To2d(coords):
    # projects 3d coordinates onto the 2d screen at z=0, as seen from a camera at x=0, y=0, z=camdist
    out=[0,0]
    out[0]=scal * abs(abs(camDist)-scal*coords[2])*coords[0]/abs(camDist)#*horizontalStretch
    out[1]=scal * abs(abs(camDist)-scal*coords[2])*coords[1]/abs(camDist)#*verticalStretch
    return(out)

def hexColor(col,brt=1):
    return ("#"+'%02x%02x%02x' % (int(colorsys.hsv_to_rgb(col/256,1,brt)[0]*255), int(colorsys.hsv_to_rgb(col/256,1,brt)[1]*255), int(colorsys.hsv_to_rgb(col/256,1,brt)[2]*255)))

# main loop code

screensaver = None
canvas=None

quit = False
lastActiveTime = time.time()
inactLoops=0

def mainLoop(icon):
    icon.visible=True
    global inactLoops,lastActiveTime,screensaver,canvas
    while(quit==False):
        inactLoops+=1
        
        if(paused):
            onInput()
        if(inactLoops>MIN_INACT_SPAWN/(SLEEP_DELAY) and time.time()-lastActiveTime>MIN_INACT_SPAWN and (not paused)):
            #spawn tk window for screensaver
            screensaver = tk.Tk()
            screensaver.title("test")
            screensaver.attributes('-fullscreen', True)
            screensaver.config(cursor="none")
            screensaver.focus_force()
            screensaver.update_idletasks()
            canvas = tk.Canvas(screensaver,bg="#000000",width=screensaver.winfo_width(),height=screensaver.winfo_height(),borderwidth=0,confine=True)
            canvas.place(x=-2,y=-2)
            load()
            screensaver.after(1,loop)
            screensaver.mainloop()
        time.sleep(SLEEP_DELAY)
    # remove the icon from the system tray when closing
    icon.stop()

# create system tray icon

icon=None

def quit_program(a=1):
    global quit
    quit=True
    
    icon.stop()
    kl.stop()
    ml.stop()
    sys.exit()
    #raise SystemExit()
    
def pause_program(a=1):
    global paused,kl,ml
    if paused:
        icon.menu=pystray.Menu(item('Pause', pause_program,default=True),item('Quit', quit_program))
        icon.icon = Image.open("icon_green.png")
        kl = keyboard.Listener(on_press=onInput,suppress=False)
        kl.start()
        ml = mouse.Listener(on_move=onInput,on_click=onInput,on_scroll=onInput,suppress=False)
        ml.start()
        paused=False
    else:
        icon.menu=pystray.Menu(item('Resume', pause_program,default=True),item('Quit', quit_program))
        icon.icon = Image.open("icon_red.png")
        kl.stop()
        ml.stop()
        paused=True

image = Image.open("icon_green.png")
menu = pystray.Menu(item('Pause', pause_program,default=True),item('Quit', quit_program))
icon = pystray.Icon("name", image, "Screensaver", menu)
icon.run(mainLoop)

kl.stop()
ml.stop()