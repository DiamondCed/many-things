import platform
import sys
if sys.version[0]==str(3):
  import tkinter as tk
if sys.version[0]==str(2):
  import Tkinter as tk
import tkcolorpicker as tkcolor
import os
from PIL import Image, ImageDraw
import PIL.ImageTk

# add instance
root = tk.Tk()

# change title
root.title("Texture Randomizer")

# make non resizable and of a minimal size
root.resizable(0,0)
root.minsize(950,300)
root.maxsize(950,300)

# add grid
win=tk.Frame(root)
win.grid(column=0,row=0,sticky=(tk.N,tk.W,tk.E,tk.S))
win.columnconfigure(0,weight=1)
win.rowconfigure(0,weight=1)

win.columnconfigure(1,weight=0)
win.rowconfigure(1,weight=0)

win.pack(pady=10,padx=10)

# widget format: tk.Name(parent,properties)

# text widgets
#tk.Label(win,text="This text is keeping the box to its current size.").pack()
#lbl2 = tk.Label(win,text="Text but w/ a variable")
#lbl2.pack()
# -------------

# button, checkbox and checkbox variable
#var=tk.IntVar()

#def hello():
#	print(var.get())

#button = tk.Button(win,text="That is a button",command=hello)
#button.pack()
#check = tk.Checkbutton(win,text="a",variable=var)
#check.pack()
# --------------

#listvar=tk.StringVar(win)
#options={"a","b","c","d"}
#listvar.set("a")
#list=tk.OptionMenu(win,listvar,*options)
#list.pack()

#functions used from main program

dirname=os.path.dirname("main.py")

def add_color(inpath,outpath):
  img = Image.open(inpath)
  img = img.convert("RGBA")
  w,h=img.size
  r=min(redvar.get(),255)
  g=min(greenvar.get(),255)
  b=min(bluevar.get(),255)
  color=[r,g,b]
  datas = img.getdata()
  newData = []
  for pixel in datas:
    newData.append((int(r*pixel[0]/255),int(g*pixel[1]/255),int(b*pixel[2]/255),pixel[3]))
  img.putdata(newData)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")

def fuse_base_color(incolor,inbase,outpath):
  add_color(incolor,"temp.png")
  overlay=Image.open("temp.png")
  background=Image.open(inbase)
  
  datasOver = overlay.getdata()
  datasBg = background.getdata()
  datasOut = []
  
  for i in range(len(datasOver)):
    if datasOver[i][3]==0:
      datasOut.append(datasBg[i])
    else:
      datasOut.append(datasOver[i])

  overlay.putdata(datasOut)
  if os.path.exists(outpath):
    os.remove(outpath)
  overlay.save(outpath, "PNG")

def recurseAllOptions(dir,prefix=""):
    options=[prefix + ("/" if not prefix=="" else "") + x for x in os.listdir(dir) if x!=".DS_Store"]
    toReplace=[]
    for i in range(len(options)):
        if(os.path.isdir(os.path.join(dir,options[i]))):
            toReplace.append(options[i])
    for i in range(len(toReplace)):
        index = options.index(toReplace[i])
        newOptions=recurseAllOptions(os.path.join(dir,toReplace[i]),prefix+("/" if not prefix=="" else "")+toReplace[i])
        options.remove(toReplace[i])
        for j in range(len(newOptions)):
            options.insert(index+j,newOptions[j])
    return options
    

#actual stuff down from here??
os.chdir(__file__.rsplit("\\",1)[0])
cwd=os.getcwd()
gems_directory = os.path.join(cwd,"Resources/assets/gems")
blocks_directory = os.path.join(cwd,"Resources/assets/blocks")
ores_base_directory = os.path.join(cwd,"Resources/assets/ores/base")
ores_color_directory = os.path.join(cwd,"Resources/assets/ores/color")
armor_directory = os.path.join(cwd,"Resources/assets/armors")
tools_directory = os.path.join(cwd,"Resources/assets/tools")

def create(a=1):
    red=-1 if togglevar.get()==1 else redvar.get()
    green=-1 if togglevar.get()==1 else greenvar.get()
    blue=-1 if togglevar.get()==1 else bluevar.get()
    gem=os.listdir(gems_directory).index(gemvar.get()) if gemvar.get() in recurseAllOptions(gems_directory) else -1
    block=os.listdir(blocks_directory).index(blockvar.get()) if blockvar.get() in recurseAllOptions(blocks_directory) else -1
    ore=os.listdir(ores_color_directory).index(orevar.get()) if orevar.get() in recurseAllOptions(ores_color_directory) else -1
    armor=os.listdir(armor_directory).index(armorvar.get()) if armorvar.get() in os.listdir(armor_directory) else -1
    tools=os.listdir(tools_directory).index(toolvar.get()) if toolvar.get() in os.listdir(tools_directory) else -1
    name=namevar.get()
    properties=[red,green,blue,gem,ore,block,armor,tools,name]
    props=""
    for i in properties:
        props=props+" "+str(i)
    print(props)
    os.system("python Randomize_Resources_Only.py"+props)


def updateVisuals(a=1):
    gem_path=os.path.join(gems_directory,gemvar.get() if gemvar.get() in recurseAllOptions(gems_directory) else "diamond.png")
    add_color(gem_path,os.path.join(cwd,"previews/diamond.png"))
    enlargeImage(os.path.join(cwd,"previews/diamond.png"))
    
    block_path=os.path.join(blocks_directory,blockvar.get() if blockvar.get() in recurseAllOptions(blocks_directory) else "diamond.png")
    add_color(block_path,os.path.join(cwd,"previews/diamond_block.png"))
    enlargeImage(os.path.join(cwd,"previews/diamond_block.png"))
    
    ore_path=os.path.join(ores_color_directory,orevar.get() if orevar.get() in recurseAllOptions(ores_color_directory) else "diamond.png")
    fuse_base_color(ore_path,os.path.join(ores_base_directory,"stone.png"),os.path.join(cwd,"previews/diamond_ore.png"))
    enlargeImage(os.path.join(cwd,"previews/diamond_ore.png"))
    
    armor_path=os.path.join(armor_directory,armorvar.get() if armorvar.get() in os.listdir(armor_directory) else "diamond","helmet.png")
    add_color(armor_path,os.path.join(cwd,"previews/diamond_helmet.png"))
    enlargeImage(os.path.join(cwd,"previews/diamond_helmet.png"))
    
    tool_path=os.path.join(tools_directory,toolvar.get() if toolvar.get() in os.listdir(tools_directory) else "diamond","color/axe.png")
    tool_base_path=os.path.join(tools_directory,toolvar.get() if toolvar.get() in os.listdir(tools_directory) else "diamond","base/axe.png")
    fuse_base_color(tool_path,tool_base_path,os.path.join(cwd,"previews/diamond_pickaxe.png"))
    enlargeImage(os.path.join(cwd,"previews/diamond_pickaxe.png"))
    

    gemim=PIL.Image.open(os.path.join(cwd,"previews/diamond.png"))
    gemimg=PIL.ImageTk.PhotoImage(gemim)
    gemimgl.configure(image=gemimg)
    gemimgl.image=gemimg
	
    blockim=PIL.Image.open(os.path.join(cwd,"previews/diamond_block.png"))
    blockimg=PIL.ImageTk.PhotoImage(blockim)
    blockimgl.configure(image=blockimg)
    blockimgl.image=blockimg
	
    oreim=PIL.Image.open(os.path.join(cwd,"previews/diamond_ore.png"))
    oreimg=PIL.ImageTk.PhotoImage(oreim)
    oreimgl.configure(image=oreimg)
    oreimgl.image=oreimg

    armorim=PIL.Image.open(os.path.join(cwd,"previews/diamond_helmet.png"))
    armorimg=PIL.ImageTk.PhotoImage(armorim)
    armorimgl.configure(image=armorimg)
    armorimgl.image=armorimg
    
    toolim=PIL.Image.open(os.path.join(cwd,"previews/diamond_pickaxe.png"))
    toolimg=PIL.ImageTk.PhotoImage(toolim)
    toolimgl.configure(image=toolimg)
    toolimgl.image=toolimg
	

def enlargeImage(image):
	img=Image.open(image)
	size=(128,128)
	#print(img)
	new_img=img.resize(size,PIL.Image.NEAREST)
	#print(new_img)
	new_img.save(image,"PNG")

def toggleSliders(a=1):
    status = "disabled" if togglevar.get()==1 else "normal"
    redslider.config(state=status,from_=120*togglevar.get(),to=255-135*togglevar.get())
    redslider.state=status
    redslider.from_=120*togglevar.get()
    redslider.to=255-135*togglevar.get()
    greenslider.config(state=status,from_=120*togglevar.get(),to=255-135*togglevar.get())
    redslider.state=status
    greenslider.from_=120*togglevar.get()
    greenslider.to=255-135*togglevar.get()
    blueslider.config(state=status,from_=120*togglevar.get(),to=255-135*togglevar.get())
    redslider.state=status
    blueslider.from_=120*togglevar.get()
    blueslider.to=255-135*togglevar.get()



#Gem selection
tk.Label(win,text="Gem Type:",anchor="e").grid(row=1,column=1)
gemvar=tk.StringVar(win)

gem_options=recurseAllOptions(gems_directory)
gem_options.insert(0,"Random")

gemvar.set(gem_options[0])
gemlist=tk.OptionMenu(win,gemvar,*gem_options,command=updateVisuals)
gemlist.config(width=8)
gemlist.grid(row=1,column=2)


#Block selection
tk.Label(win,text="Block Type:",anchor="e").grid(row=1,column=4)
blockvar=tk.StringVar(win)

block_options=recurseAllOptions(blocks_directory)
block_options.insert(0,"Random")

blockvar.set(block_options[0])
blocklist=tk.OptionMenu(win,blockvar,*block_options,command=updateVisuals)
blocklist.config(width=8)
blocklist.grid(row=1,column=5)


#Ore selection
tk.Label(win,text="Ore Type:",anchor="e").grid(row=1,column=7)
orevar=tk.StringVar(win)

ore_color_options=recurseAllOptions(ores_color_directory)  
ore_color_options.insert(0,"Random")
ore_base_options=recurseAllOptions(ores_base_directory)
ore_base_options.insert(0,"error")

orevar.set(ore_color_options[0])
orelist=tk.OptionMenu(win,orevar,*ore_color_options,command=updateVisuals)
orelist.config(width=8)
orelist.grid(row=1,column=8)


#color selection
redvar=tk.IntVar()
redvar.set(120)
greenvar=tk.IntVar()
greenvar.set(120)
bluevar=tk.IntVar()
bluevar.set(120)
togglevar=tk.IntVar()
togglevar.set(0)
checkcolor=tk.Checkbutton(win,text="Random color?",variable=togglevar,command=toggleSliders).grid(row=1,column=0)
redslider=tk.Scale(win,variable=redvar,from_=0,to=255,orient=tk.HORIZONTAL,activebackground="#ff0000",foreground="#ff0000",command=updateVisuals)
redslider.grid(row=2,column=0)
greenslider=tk.Scale(win,variable=greenvar,from_=0,to=255,orient=tk.HORIZONTAL,activebackground="#00FF00",foreground="#00FF00",command=updateVisuals)
greenslider.grid(row=3,column=0)
blueslider=tk.Scale(win,variable=bluevar,from_=0,to=255,orient=tk.HORIZONTAL,activebackground="#0000FF",foreground="#0000FF",command=updateVisuals)
blueslider.grid(row=4,column=0)


#Armor selection
tk.Label(win,text="Armor Type:",anchor="e").grid(row=1,column=9)
armorvar=tk.StringVar(win)

armor_options=[x for x in os.listdir(armor_directory) if x!=".DS_Store"]
armor_options.insert(0,"Random")

armorvar.set(armor_options[0])
armorlist=tk.OptionMenu(win,armorvar,*armor_options,command=updateVisuals)
armorlist.config(width=8)
armorlist.grid(row=1,column=10)

#Tools selection
tk.Label(win,text="Tool Type:",anchor="e").grid(row=1,column=11)
toolvar=tk.StringVar(win)

tool_options=[x for x in os.listdir(tools_directory) if x!=".DS_Store"]
tool_options.insert(0,"Random")

toolvar.set(tool_options[0])
toollist=tk.OptionMenu(win,toolvar,*tool_options,command=updateVisuals)
toollist.config(width=8)
toollist.grid(row=1,column=12)


#preview images
gemim=PIL.Image.open(os.path.join(cwd,"previews/diamond.png"))
gemimg=PIL.ImageTk.PhotoImage(gemim)
gemimgl=tk.Label(win,image=gemimg)
gemimgl.grid(row=3,column=1,columnspan=2)

blockim=PIL.Image.open(os.path.join(cwd,"previews/diamond_block.png"))
blockimg=PIL.ImageTk.PhotoImage(blockim)
blockimgl=tk.Label(win,image=blockimg)
blockimgl.grid(row=3,column=4,columnspan=2)

oreim=PIL.Image.open(os.path.join(cwd,"previews/diamond_ore.png"))
oreimg=PIL.ImageTk.PhotoImage(oreim)
oreimgl=tk.Label(win,image=oreimg)
oreimgl.grid(row=3,column=7,columnspan=2)

armorim=PIL.Image.open(os.path.join(cwd,"previews/diamond_helmet.png"))
armorimg=PIL.ImageTk.PhotoImage(armorim)
armorimgl=tk.Label(win,image=armorimg)
armorimgl.grid(row=3,column=9,columnspan=2)
    
toolim=PIL.Image.open(os.path.join(cwd,"previews/diamond_pickaxe.png"))
toolimg=PIL.ImageTk.PhotoImage(toolim)
toolimgl=tk.Label(win,image=toolimg)
toolimgl.grid(row=3,column=11,columnspan=2)

updateVisuals()

#Name field
tk.Label(win,text="   Material Name").grid(row=0,column=1)
tk.Label(win,text="(blank = random):").grid(row=0,column=2)
namevar=tk.StringVar()
name=tk.Entry(win,textvariable=namevar,width=10)
name.grid(row=0,column=4)

#CREATE!!!

createbutton=tk.Button(win,text="Create Pack",command=create).grid(row=0,column=0)


# start loop
win.mainloop()


#print(sys.version[0])
"""
if sys.version[0]==str(3):
   input("Enter to quit")
elif sys.version[0]==str(2):
   raw_input("Enter to quit")
"""
