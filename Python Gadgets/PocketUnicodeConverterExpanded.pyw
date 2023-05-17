import platform
import sys
if sys.version[0]==str(3):
  import tkinter as tk
if sys.version[0]==str(2):
  import Tkinter as tk
import os
import re
import subprocess
import win32clipboard as w32c
import traceback
from functools import partial

import time
#from PIL import Image, ImageDraw
#import PIL.ImageTk

def on_focus_out(event):
    if event.widget == root:
        #print("close")
        root.destroy()

def updateVisuals(a=1):
    if entry.get()!="" and int("0x"+entry.get(),0) <= int("0x110000",0):
        content.set(chr(int("0x"+entry.get(),0)))
    else:
        content.set("")
        
def updateHex(a=1):
    computeHex()
    calculation.set(calculation.get().upper())

def validateInt(P):
    pattern = '[^{a-fA-F0-9}]'
    #str.isdigit(P) or P == ""
    
    if re.search(pattern, P) == None or P == "":
        return True
    else:
        return False
        
def validateHex(P):
    pattern = '[^{A-Fa-f0-9{+}{\-}{*}{/}{\(}{\)}{%}}]'
    #str.isdigit(P) or P == ""
    
    if re.search(pattern, P) == None or P == "":
        return True
    else:
        return False

def copyValue(a=1):
    if not content.get()=="":
        print(content.get())
        w32c.OpenClipboard()
        w32c.SetClipboardText(content.get()[0],w32c.CF_UNICODETEXT)
        w32c.CloseClipboard()
        print(root.clipboard_get())
    #os.system('echo | set /p nul="' +content.get()+ '"| clip')
    #subprocess.run("echo " +toUnicode(content.get())+ " | clip",shell=True)
    #out=open("temp.txt","w")
    #out.write(content.get())
    #out.close()
    #subprocess.run("")
    #subprocess.run(("<nul set/p a=\""+content.get()+"\" | clip"),shell=True)
    #root.clipboard_clear()
    #print(content.get())
    #root.clipboard_append(content.get())
    #root.update()
    
def computeHex(a=1):
    components=list(calculation.get())
    temp=[]
    eq=""
    curr=""
    patternA = '[{A-Fa-f0-9}]'
    for i in range(len(components)):
        if re.search(patternA,components[i]):
            curr=curr+components[i]
        else:
            if not curr=="":
                temp.append("0x"+curr)
                eq=eq+"0x"+curr
                curr=""
            temp.append(components[i])
            eq=eq+components[i]
    if not curr=="":
        temp.append("0x"+curr)
        eq=eq+"0x"+curr
    try:
        result.set("="+hex(int(eval(eq))).upper().replace("X","x"))
    except:
        a=a
        #print(traceback.format_exc())
    if eq=="":
        result.set("=")

def toUnicode(chr):
    return("\\u"+(str(hex(ord(chr)))+"~")[2:-1])
    
def addHexChar(char):
    if char=="bcksp":
        calculation.set(calculation.get()[0:-1])
    elif char=="clr":
        calculation.set("")
    else:
        calculation.set(calculation.get()+char)
        
def launchShrunk(a=1):
    #/PocketUnicodeConverterExpanded.py
    #print("opening")
    subprocess.Popen("cd C:/Custom",shell=True)
    subprocess.Popen(("py PocketUnicodeConverter.pyw"+" "+entry.get()),shell=True)
    
#print(toUnicode('򫑖'))
    
# add instance
root = tk.Tk()
root.columnconfigure(1,weight=1)
root.columnconfigure(2,weight=1)
#root.rowconfigure(0,weight=1)


root.bind('<Control-c>', copyValue)

# define string variable
content=tk.StringVar(root)
content.set("")
entry=tk.StringVar(root)
entry.trace("w", lambda name, index, mode, entry=entry: updateVisuals(entry))
if len(sys.argv)>1:
    entry.set(sys.argv[1])
calculation=tk.StringVar(root)
calculation.trace("w", lambda name, index, mode, calculation=calculation: updateHex(calculation))
result=tk.StringVar(root)
result.set("=")

# change title
root.title("Pocket app")

# make non resizable and of a minimal size
root.resizable(0,0)
root.minsize(400,200)

# change window spawn position
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
root.geometry("400x200"+"+"+str(screen_width-420)+"+"+str(screen_height-280))

# add window contents
 # hex calculator
hexCal=tk.Frame(root)
tk.Label(hexCal,text="Hex Calculator").grid(column=1,row=1)
calc=tk.Frame(hexCal)
calc.columnconfigure(1,weight=1)
calc.columnconfigure(2,weight=1)
calc.columnconfigure(3,weight=1)
calc.columnconfigure(4,weight=1)
calc.rowconfigure(0,weight=1)
calc.rowconfigure(1,weight=1)
calc.rowconfigure(2,weight=1)
calc.rowconfigure(3,weight=1)
calc.rowconfigure(4,weight=1)

calcfont="Courier 8"
xpad=4
ypad=2
for i in range(4):
    for j in range(4):
        lbl=(" "+(hex(i+4*j)+"-")[2:-1]+" ").upper()
        tk.Button(calc,command=partial(addHexChar,lbl[1:-1]),font=calcfont,text=lbl).grid(column=i,row=j+1)
        
tk.Button(calc,command=partial(addHexChar,"+"),font=calcfont,text=" + ").grid(column=4,row=1,padx=xpad)
tk.Button(calc,command=partial(addHexChar,"-"),font=calcfont,text=" - ").grid(column=4,row=2,padx=xpad)
tk.Button(calc,command=partial(addHexChar,"*"),font=calcfont,text=" * ").grid(column=4,row=3,padx=xpad)
tk.Button(calc,command=partial(addHexChar,"/"),font=calcfont,text=" / ").grid(column=4,row=4,padx=xpad)
tk.Button(calc,command=partial(addHexChar,"%"),font=calcfont,text=" % ").grid(column=2,row=0)

tk.Button(calc,command=partial(addHexChar,"("),font=calcfont,text=" ( ").grid(column=0,row=0,pady=ypad)
tk.Button(calc,command=partial(addHexChar,")"),font=calcfont,text=" ) ").grid(column=1,row=0,pady=ypad)

tk.Button(calc,command=partial(addHexChar,"bcksp"),font=calcfont,text=" < ").grid(column=4,row=0,pady=ypad)
tk.Button(calc,command=partial(addHexChar,"clr"),font=calcfont,text=" C ").grid(column=3,row=0,pady=ypad)


calc.grid(column=1,row=3)

vcmd1=root.register(validateHex)
c=tk.Entry(hexCal,width=26,textvariable=calculation,validate='all',validatecommand=(vcmd1,'%P'))

c.grid(column=1,row=4,pady=4)

tk.Entry(hexCal,state="readonly",textvariable=result,width=26).grid(column=1,row=5)

hexCal.grid(column=1,row=1,sticky=tk.N)


 # character converter
charCon=tk.Frame(root)

tk.Label(charCon,text="Character ID:").grid(column=1,row=1)

vcmd2=root.register(validateInt)
e=tk.Entry(charCon,textvariable=entry,validate='all',validatecommand=(vcmd2,'%P'))
e.grid(column=1,row=2)
e.focus_set()
#tk.Label(root,text="").grid(column=2,row=3)

tk.Label(charCon,text="").grid(column=1,row=3)
tk.Entry(charCon,textvariable=content,fg="black",state="readonly",font=("Arial 48"),justify=tk.CENTER,width=2).grid(column=1,row=4)

tk.Label(charCon,text="").grid(column=1,row=5)
tk.Button(charCon,text="Shrink",command=launchShrunk).grid(column=1,row=6)


charCon.grid(column=2,row=1,sticky=tk.N)


# add unfocus event
root.bind("<FocusOut>", on_focus_out)

#win=tk.Frame(root)
root.mainloop()

# add grid
#win=tk.Frame(root)
#win.grid(column=0,row=0,sticky=(tk.N,tk.W,tk.E,tk.S))
#win.columnconfigure(0,weight=1)
#win.rowconfigure(0,weight=1)
#win.pack(pady=10,padx=10)



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


#actual stuff down from here

#dn=os.getcwd()


#def updateVisuals(a=1):
    #a=2
    #test=tk.Label(root,text="There").pack()
	#gemim=PIL.Image.open(os.path.join(dn,"previews/diamond.png"))
	#gemimg=PIL.ImageTk.PhotoImage(gemim)
	#gemimgl.configure(image=gemimg)
	#gemimgl.image=gemimg


#Gem selection
#tk.Label(win,text="Gem Type:").grid(row=1,column=1)

#gemvar=tk.StringVar(win)
#rawgems=os.listdir(os.path.join(dn,"color_textures/gems"))
#gems=["Random"]
#for i in range(0,len(rawgems)):
#	if not rawgems[i]==".DS_Store":
#		gems.append(rawgems[i])
#gemvar.set(gems[0])
#gemlist=tk.OptionMenu(win,gemvar,*gems,command=updateVisuals)
#gemlist.grid(row=1,column=2)


#CREATE!!!

#createbutton=tk.Button(win,text="Create Pack",command=create).grid(row=0,column=0)


# start loop
#win.mainloop()


#print(sys.version[0])

#if sys.version[0]==str(3):
#   input("Enter to quit")
#elif sys.version[0]==str(2):
#   raw_input("Enter to quit")
