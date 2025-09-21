import sys
if sys.version[0]==str(3):
  import tkinter as tk
if sys.version[0]==str(2):
  import Tkinter as tk
import subprocess
import win32clipboard as w32c
from functools import partial

from helper_funcs import *

class PocketUnicodeConverter(tk.Frame):
    def __init__(self, master, defaultText = ""):
        super().__init__(master)
        self.setup_window(defaultText)

    def setup_window(self, defaultText = ""):
        # Tweak master window settings
        self.master.title("Pocket app")
        self.master.resizable(0,0)
        self.master.minsize(200,200)

        self.master.bind('<Control-c>', self.copy_value)
        self.master.bind("<FocusOut>", self.on_focus_out)

        screen_width = self.master.winfo_screenwidth()
        screen_height = self.master.winfo_screenheight()
        self.master.geometry("200x200"+"+"+str(screen_width-220)+"+"+str(screen_height-280))
        
        # define variables
        self.content=tk.StringVar(self.master)
        self.content.set("")

        self.entry=tk.StringVar(self.master)
        self.entry.trace_add("write", lambda *_: self.updateVisuals())
        self.entry.set(defaultText)

        # define components
        # header
        tk.Label(self.master,text="Character ID:").pack()

        # entry field
        validate=self.master.register(validateInt)
        entryComp=tk.Entry(self.master,textvariable=self.entry,validate='all',validatecommand=(validate,'%P'))
        entryComp.pack()
        entryComp.focus_set()

        # spacer I think?
        tk.Label(self.master,text="").pack()

        # output field
        tk.Entry(self.master,textvariable=self.content,fg="black",state="readonly",font=("Arial 48"),justify=tk.CENTER,width=2).pack()

        # also spacer probably
        tk.Label(self.master,text="").pack()

        # self explanatory
        tk.Button(self.master,text="Expand",command=self.launch_expanded).pack()

    def on_focus_out(self, event):
        if event.widget == self.master:
            self.master.destroy()

    def updateVisuals(self):
        if self.entry.get()!="" and int("0x"+self.entry.get(),0) <= int("0x110000",0):
            self.content.set(chr(int("0x"+self.entry.get(),0)))
        else:
            self.content.set("")
    
    def copy_value(self, event):
        w32c.OpenClipboard()
        w32c.SetClipboardText(self.content.get()[0],w32c.CF_UNICODETEXT)
        w32c.CloseClipboard()
    
    # atrocious; pull this out by the roots and start the fuck over
    def launch_expanded(self):
        launchBig(self.entry.get())

class PUCExpanded(PocketUnicodeConverter):
    def __init__(self, master, defaultText = ""):
        super().__init__(master, defaultText)
    
    def setup_window(self, defaultText=""):
        # Tweak master window settings
        self.master.title("Pocket app")
        self.master.resizable(0,0)
        self.master.minsize(400,200)

        self.master.bind('<Control-c>', self.copy_value)
        self.master.bind("<FocusOut>", self.on_focus_out)

        screen_width = self.master.winfo_screenwidth()
        screen_height = self.master.winfo_screenheight()
        self.master.geometry("400x200"+"+"+str(screen_width-420)+"+"+str(screen_height-280))

        # configure grid layout (?)
        self.master.columnconfigure(1,weight=1)
        self.master.columnconfigure(2,weight=1)

        # define variables
        self.content=tk.StringVar(self.master)
        self.content.set("")

        self.entry=tk.StringVar(self.master)
        self.entry.trace_add("write", lambda *_: self.updateVisuals())
        self.entry.set(defaultText)

        self.calculation=tk.StringVar(self.master)
        self.calculation.trace_add("write", lambda *_: self.updateHex())

        self.result=tk.StringVar(self.master)
        self.result.set("=")

        # define components
         # hex calculator
        hexCal=tk.Frame(self.master)
        tk.Label(hexCal,text="Hex Calculator").grid(column=1,row=1)
        # button grid
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
                lbl=(" "+(hex(i+4*j))[2:]+" ").upper()
                tk.Button(calc,command=partial(self.addHexChar,lbl[1:-1]),font=calcfont,text=lbl).grid(column=i,row=j+1)
        
        tk.Button(calc,command=partial(self.addHexChar,"+"),font=calcfont,text=" + ").grid(column=4,row=1,padx=xpad)
        tk.Button(calc,command=partial(self.addHexChar,"-"),font=calcfont,text=" - ").grid(column=4,row=2,padx=xpad)
        tk.Button(calc,command=partial(self.addHexChar,"*"),font=calcfont,text=" * ").grid(column=4,row=3,padx=xpad)
        tk.Button(calc,command=partial(self.addHexChar,"/"),font=calcfont,text=" / ").grid(column=4,row=4,padx=xpad)
        tk.Button(calc,command=partial(self.addHexChar,"%"),font=calcfont,text=" % ").grid(column=2,row=0)

        tk.Button(calc,command=partial(self.addHexChar,"("),font=calcfont,text=" ( ").grid(column=0,row=0,pady=ypad)
        tk.Button(calc,command=partial(self.addHexChar,")"),font=calcfont,text=" ) ").grid(column=1,row=0,pady=ypad)

        tk.Button(calc,command=partial(self.addHexChar,"bcksp"),font=calcfont,text=" < ").grid(column=4,row=0,pady=ypad)
        tk.Button(calc,command=partial(self.addHexChar,"clr"),font=calcfont,text=" C ").grid(column=3,row=0,pady=ypad)

        calc.grid(column=1,row=3)

        # "screen" field I think
        valHex=self.master.register(validateHex)
        expField=tk.Entry(hexCal,width=26,textvariable=self.calculation,validate='all',validatecommand=(valHex,'%P'))

        expField.grid(column=1,row=4,pady=4)

        tk.Entry(hexCal,state="readonly",textvariable=self.result,width=26).grid(column=1,row=5)

        hexCal.grid(column=1,row=1,sticky=tk.N)

         # character converter
        # See parent class for details I guess
        charCon=tk.Frame(self.master)

        tk.Label(charCon,text="Character ID:").grid(column=1,row=1)

        validateUnicode=self.master.register(validateInt)
        entryComp=tk.Entry(charCon,textvariable=self.entry,validate='all',validatecommand=(validateUnicode,'%P'))
        entryComp.grid(column=1,row=2)
        entryComp.focus_set()

        tk.Label(charCon,text="").grid(column=1,row=3)
        tk.Entry(charCon,textvariable=self.content,fg="black",state="readonly",font=("Arial 48"),justify=tk.CENTER,width=2).grid(column=1,row=4)

        tk.Label(charCon,text="").grid(column=1,row=5)
        tk.Button(charCon,text="Shrink",command=self.launchShrunk).grid(column=1,row=6)

        charCon.grid(column=2,row=1,sticky=tk.N)
    
    def updateHex(self):
        self.result.set(evaluateHex(self.calculation.get()))
        self.calculation.set(self.calculation.get().upper())

    def addHexChar(self, char):
        if char=="bcksp":
            self.calculation.set(self.calculation.get()[0:-1])
        elif char=="clr":
            self.calculation.set("")
        else:
            self.calculation.set(self.calculation.get()+char)
    
    # also atrocious, start the fuck over  
    def launchShrunk(self):
        launchSmall(self.entry.get())


def launchSmall(defaultText = ""):
    global root
    if root is not None:
        root.destroy() # in case one was previously running I guess
    root = tk.Tk()
    pucApp = PocketUnicodeConverter(root, defaultText)
    pucApp.mainloop()

def launchBig(defaultText = ""):
    global root
    if root is not None:
        root.destroy()
    root = tk.Tk()
    pucApp = PUCExpanded(root, defaultText)
    pucApp.mainloop()

# Actually launching the app
if __name__=="__main__":
    global root 
    root = None
    launchSmall()
    