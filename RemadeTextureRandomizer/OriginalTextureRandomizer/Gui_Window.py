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
root.minsize(500,300)

# add grid
win=tk.Frame(root)
win.grid(column=0,row=0,sticky=(tk.N,tk.W,tk.E,tk.S))
win.columnconfigure(0,weight=1)
win.rowconfigure(0,weight=1)
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

def add_color(base,outpath):
  base = os.path.join(dirname, base)
  img = Image.open(base)
  img2 = Image.open(base)
  w,h=img.size
  r=redvar.get()
  g=greenvar.get()
  b=bluevar.get()
  color=(r,g,b,80)
  imDraw=ImageDraw.Draw(img2)
  imDraw.rectangle([0,0,img.size[0],img.size[1]],color)
  #img2.paste(color, [0,0,img.size[0],img.size[1]])

  background = img
  overlay = img2

  background = background.convert("RGBA")
  overlay = overlay.convert("RGBA")

  new_img = Image.blend(background, overlay, 0.50)
  if os.path.exists("temp.png"):
    os.remove("temp.png")
  new_img.save("temp.png","PNG")
  remove_semitrans("temp.png",outpath)

def remove_semitrans(image,outpath):
  image = os.path.join(dirname, image)
  img = Image.open(image)
  img = img.convert("RGBA")
  datas = img.getdata()

  newData = []
  for item in datas:
    if item[3] == 40:
        newData.append((0, 0, 0, 0))
    else:
        newData.append((item[0],item[1],item[2],255))

  img.putdata(newData)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")

  #os.remove("temp.png")

def alt_add_color(base,outpath):
  base = os.path.join(dirname, base)
  img = Image.open(base)
  img = img.convert("RGBA")
  w,h=img.size
  r=redvar.get()
  g=greenvar.get()
  b=bluevar.get()
  color=[r,g,b]
  datas = img.getdata()
  newData = []
  for item in datas:
    newData.append((int(r*item[0]/255),int(g*item[1]/255),int(b*item[2]/255),item[3]))
  img.putdata(newData)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")

def fuse_base_color(image1,image2,outpath):
  image1 = os.path.join(dirname, image1)
  image2 = os.path.join(dirname, image2)
  background=Image.open(image2)
  overlay=Image.open(image1)
  datasOver = overlay.getdata()
  datasBg = background.getdata()
  datasOut = []
  for i in range(len(datasOver)):
    if datasOver[i][3]==0:
      datasOut.append(datasBg[i])
    else:
      datasOut.append(datasOver[i])


  overlay.putdata(datasOut)
  #outpath = os.path.join(dirname, outpath)
  if os.path.exists(outpath):
    os.remove(outpath)
  overlay.save(outpath, "PNG")




#actual stuff down from here

dn=os.getcwd()

def create(a=1):
	gem=gems.index(gemvar.get())-1
	block=blocks.index(blockvar.get())-1
	ore=ores.index(orevar.get())-1
	red=redvar.get()
	green=greenvar.get()
	blue=bluevar.get()
	if togglevar.get()==1:
		red=-1
		green=-1
		blue=-1
	armor=armors.index(armorvar.get())-1
	#print(togglevar)
	name=namevar.get()
	properties=[red,green,blue,gem,ore,block,armor,name]
	props=""
	for i in properties:
		props=props+" "+str(i)
	#print("python Randomize_Resources_Only.py"+props)
	os.system("python Randomize_Resources_Only.py"+props)


def updateVisuals(a=1):
	gempath=os.path.join(dn,"color_textures/gems",gemvar.get())
	if gems.index(gemvar.get())==0:
		gempath=os.path.join(dn,"color_textures/gems/diamond.png")
	alt_add_color(gempath,os.path.join(dn,"previews/diamond.png"))
	enlargeImage(os.path.join(dn,"previews/diamond.png"))
	
	blockpath=os.path.join(dn,"color_textures/blocks",blockvar.get())
	if blocks.index(blockvar.get())==0:
		blockpath=os.path.join(dn,"color_textures/blocks/diamond.png")
	alt_add_color(blockpath,os.path.join(dn,"previews/diamond_block.png"))
	enlargeImage(os.path.join(dn,"previews/diamond_block.png"))
	
	orepath=os.path.join(dn,"color_textures/ores",orevar.get())
	if ores.index(orevar.get())==0:
		orepath=os.path.join(dn,"color_textures/ores/normal.png")
	orebasepath=os.path.join(dn,"base_textures/ores",orebases[ores.index(orevar.get())])
	if ores.index(orevar.get())==0:
		orebasepath=os.path.join(dn,"base_textures/ores/normal_base.png")
	alt_add_color(orepath,"temp.png")
	fuse_base_color("temp.png",orebasepath,os.path.join(dn,"previews/diamond_ore.png"))
	enlargeImage(os.path.join(dn,"previews/diamond_ore.png"))
	
	hatpaths=["error","diamond_helmet.png","netherite_helmet.png"]
	hatpath=os.path.join(dn,"color_textures",hatpaths[armors.index(armorvar.get())])
	if armors.index(armorvar.get())==0:
		hatpath=os.path.join(dn,"color_textures/diamond_helmet.png")
	alt_add_color(hatpath,os.path.join(dn,"previews/diamond_helmet.png"))
	enlargeImage(os.path.join(dn,"previews/diamond_helmet.png"))


	gemim=PIL.Image.open(os.path.join(dn,"previews/diamond.png"))
	gemimg=PIL.ImageTk.PhotoImage(gemim)
	gemimgl.configure(image=gemimg)
	gemimgl.image=gemimg
	
	blockim=PIL.Image.open(os.path.join(dn,"previews/diamond_block.png"))
	blockimg=PIL.ImageTk.PhotoImage(blockim)
	blockimgl.configure(image=blockimg)
	blockimgl.image=blockimg
	
	oreim=PIL.Image.open(os.path.join(dn,"previews/diamond_ore.png"))
	oreimg=PIL.ImageTk.PhotoImage(oreim)
	oreimgl.configure(image=oreimg)
	oreimgl.image=oreimg

	hatim=PIL.Image.open(os.path.join(dn,"previews/diamond_helmet.png"))
	hatimg=PIL.ImageTk.PhotoImage(hatim)
	hatimgl.configure(image=hatimg)
	hatimgl.image=hatimg
	

def enlargeImage(image):
	img=Image.open(image)
	size=(128,128)
	#print(img)
	new_img=img.resize(size,PIL.Image.NEAREST)
	#print(new_img)
	new_img.save(image,"PNG")

def toggleSliders(a=1):
	if togglevar.get()==1:
		status="disabled"
		redslider.config(state=status,from_=120,to=120)
		redslider.state=status
		redslider.from_=120
		redslider.to=120
		greenslider.config(state=status,from_=120,to=120)
		greenslider.state=status
		greenslider.from_=120
		greenslider.to=120
		blueslider.config(state=status,from_=120,to=120)
		blueslider.state=status
		blueslider.from_=120
		blueslider.to=120
		
	if not togglevar.get()==1:
		status="normal"
		redslider.config(state=status,from_=0,to=255)
		redslider.state=status
		redslider.from_=0
		redslider.to=255
		greenslider.config(state=status,from_=0,to=255)
		greenslider.state=status
		greenslider.from_=0
		greenslider.to=255
		blueslider.config(state=status,from_=0,to=255)
		blueslider.state=status
		blueslider.from_=0
		blueslider.to=255


#Gem selection
tk.Label(win,text="Gem Type:").grid(row=1,column=1)

gemvar=tk.StringVar(win)
rawgems=os.listdir(os.path.join(dn,"color_textures/gems"))
gems=["Random"]
for i in range(0,len(rawgems)):
	if not rawgems[i]==".DS_Store":
		gems.append(rawgems[i])
gemvar.set(gems[0])
gemlist=tk.OptionMenu(win,gemvar,*gems,command=updateVisuals)
gemlist.grid(row=1,column=2)


#Block selection
tk.Label(win,text="Block Type:").grid(row=1,column=4)

blockvar=tk.StringVar(win)
rawblocks=os.listdir(os.path.join(dn,"color_textures/blocks"))
blocks=["Random"]
for i in range(0,len(rawblocks)):
	if not rawblocks[i]==".DS_Store":
		blocks.append(rawblocks[i])
blockvar.set(blocks[0])
blocklist=tk.OptionMenu(win,blockvar,*blocks,command=updateVisuals)
blocklist.grid(row=1,column=5)


#Ore selection
tk.Label(win,text="Ore Type:").grid(row=1,column=7)

orevar=tk.StringVar(win)
rawores=os.listdir(os.path.join(dn,"color_textures/ores"))
ores=["Random"]
for i in range(0,len(rawores)):
	if not rawores[i]==".DS_Store":
		ores.append(rawores[i])
raworebases=os.listdir(os.path.join(dn,"base_textures/ores"))
orebases=["error"]
for i in range(0,len(raworebases)):
	if not raworebases[i]==".DS_Store":
		orebases.append(raworebases[i])
orevar.set(ores[0])
orelist=tk.OptionMenu(win,orevar,*ores,command=updateVisuals)
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
tk.Label(win,text="Armor Type:").grid(row=1,column=9)

armorvar=tk.StringVar(win)
armors=["Random","diamond","netherite"]
armorvar.set(armors[0])
armorlist=tk.OptionMenu(win,armorvar,*armors,command=updateVisuals)
armorlist.grid(row=1,column=10)


#preview images
gemim=PIL.Image.open(os.path.join(dn,"previews/diamond.png"))
gemimg=PIL.ImageTk.PhotoImage(gemim)
gemimgl=tk.Label(win,image=gemimg)
gemimgl.grid(row=3,column=2)

blockim=PIL.Image.open(os.path.join(dn,"previews/diamond_block.png"))
blockimg=PIL.ImageTk.PhotoImage(blockim)
blockimgl=tk.Label(win,image=blockimg)
blockimgl.grid(row=3,column=5)

oreim=PIL.Image.open(os.path.join(dn,"previews/diamond_ore.png"))
oreimg=PIL.ImageTk.PhotoImage(oreim)
oreimgl=tk.Label(win,image=oreimg)
oreimgl.grid(row=3,column=8)

hatim=PIL.Image.open(os.path.join(dn,"previews/diamond_helmet.png"))
hatimg=PIL.ImageTk.PhotoImage(hatim)
hatimgl=tk.Label(win,image=hatimg)
hatimgl.grid(row=3,column=10)
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

if sys.version[0]==str(3):
   input("Enter to quit")
elif sys.version[0]==str(2):
   raw_input("Enter to quit")
