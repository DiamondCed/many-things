import sys
if sys.version[0]==str(3):
  import tkinter as tk
  import tkinter.font as font
if sys.version[0]==str(2):
  import Tkinter as tk
  import Tkinter.font as font
import math
import time
import random
import colorsys
#from PIL import Image, ImageDraw
#import PIL.ImageTk

def start_move(event):
    root.x = event.x
    root.y = event.y

def stop_move(event):
    root.x = None
    root.y = None

def do_move(event):
    deltax = event.x - root.x
    deltay = event.y - root.y
    x = root.winfo_x() + deltax
    y = root.winfo_y() + deltay
    root.geometry(f"+{x}+{y}")
  
class Pendulum:
    def __init__(self,θ1=0,θ2=0,color="#ffffff",points=False):
        self.θ1=θ1
        self.θ2=θ2
        self.ω1=0
        self.ω2=0
        self.α1=0
        self.α2=0
        self.showPoints=points
        self.points=[]
        self.color=color
        self.p1=[0,0]
        self.p2=[0,0]
    
    def update(self,inst=1):
        #consts
        l1=0.9
        l2=0.9
        x0=100
        y0=75
        m1=2
        m2=2
        g=9.81/1000000
        for i in range(int(inst)):
            temp1 = -g * (2 * m1 + m2) * math.sin(self.θ1)
            temp2 = -m2 * g * math.sin(self.θ1 - (2 * self.θ2))
            temp3 = -2 * math.sin(self.θ1 - self.θ2) * m2 * ((math.pow(self.ω2,2) * l2) + (math.pow(self.ω1,2) * l1 * math.cos(self.θ1 - self.θ2)))
            den = l1 * ((2 * m1) + m2 - (m2 * math.cos((2 * self.θ1) - (2 * self.θ2))))
            self.α1= (temp1+temp2+temp3)/den
    
            temp1 = 2 * math.sin(self.θ1 - self.θ2)
            temp2 = math.pow(self.ω1,2) * l1 * (m1 + m2)
            temp3 = g * (m1 + m2) * math.cos(self.θ1)
            temp4 = math.pow(self.ω2,2) * l2 * m2 * math.cos(self.θ1 - self.θ2)
            den = l2 * ((2 * m1) + m2 - (m2 * math.cos((2 * self.θ1) - (2 * self.θ2))))
            self.α2= (temp1*(temp2+temp3+temp4))/den
    
            self.ω1=self.ω1+self.α1
            self.ω2=self.ω2+self.α2
    
            self.θ1=(self.θ1+self.ω1)%(2*math.pi)
            self.θ2=(self.θ2+self.ω2)%(2*math.pi)
            
            self.p1[0]=l1*math.sin(self.θ1)*50+x0
            self.p1[1]=l1*math.cos(self.θ1)*50+y0
    
            self.p2[0]=l2*math.sin(self.θ2)*50+self.p1[0]
            self.p2[1]=l2*math.cos(self.θ2)*50+self.p1[1]
            
        if self.showPoints:
            self.points.append([self.p2[0],self.p2[1]])
            if len(self.points)>10:
                self.points.pop(0)
    
    def show(self,spheres=True,lines=True):
        #consts
        x0=100
        y0=75
        m1=2
        m2=2
        if lines:
            canvas.create_line(x0,y0,self.p1[0],self.p1[1],fill=self.hexColor())
            canvas.create_line(self.p1[0],self.p1[1],self.p2[0],self.p2[1],fill=self.hexColor())
        #canvas.create_line(x0,y0,self.p1[0]-m1*math.sin(self.θ1),self.p1[1]-m1*math.cos(self.θ1),fill=self.color)
        #canvas.create_line(self.p1[0]+2*m1*math.sin(self.θ2),self.p1[1]+m1*math.cos(self.θ2),self.p2[0]-m1*math.sin(self.θ2),self.p2[1]-m1*math.cos(self.θ2),fill=self.color)
        if spheres:
            canvas.create_oval(self.p1[0]-m1,self.p1[1]-m1,self.p1[0]+m1,self.p1[1]+m1,fill="white",width=0)
            canvas.create_oval(self.p2[0]-m2,self.p2[1]-m2,self.p2[0]+m2,self.p2[1]+m2,fill="white",width=0)
        
        if self.showPoints:
            for i in range(len(self.points)-1):
                canvas.create_line(self.points[i][0],self.points[i][1],self.points[i+1][0],self.points[i+1][1],fill=self.hexColor([x*min(2/(len(self.points)-i-1),1) for x in self.color]))

    def hexColor(self,col=None):
        #print(col)
        if col==None:
            col=self.color
        return ("#"+'%02x%02x%02x' % (int(col[0]*255), int(col[1]*255), int(col[2]*255)))

 
def init_pendulums(amount=40):
    global pendulums
    a1=random.random()*math.pi+math.pi/2
    a2=random.random()*2*math.pi
    #print(str(a1/math.pi)+"π, "+str(a2/math.pi)+"π")
    pendulums=[]
    for i in range(amount):
        color=colorsys.hsv_to_rgb(i/amount,1,1)
        pendulums.append(Pendulum(a1,a2+0.00005*i,color,False))
        pendulums[len(pendulums)-1].update()

def pause_unpause():
    global flag_paused,pause_var
    if flag_paused:
        flag_paused=False
        pause_var.set('⏸')
    else:
        flag_paused=True
        pause_var.set('▶')

def toggle_color():
    global flag_spheres,sphere_var
    if flag_spheres:
        flag_spheres=False
        spheres_var.set('⚪')
    else:
        flag_spheres=True
        spheres_var.set('⚫')
    

def loop():
    global ptime, pendulums, flag_paused, flag_spheres
    deltaTime=math.ceil((time.time()-ptime)*1000)
    #print(deltaTime)
    ptime = time.time()
    if not flag_paused:
        for i in range(len(pendulums)):
            pendulums[i].update(min(deltaTime,20))
    
    canvas.delete("all")
    
    for i in range(len(pendulums)):
        pendulums[i].show(flag_spheres)
    
    root.update()
    root.after(10,loop)
    
# add instance
root = tk.Tk()

#root.bind('<Control-c>', copyValue)

# define string variable
#content=tk.StringVar(root)
#content.set("")
#entry=tk.StringVar(root)
#entry.trace("w", lambda name, index, mode, entry=entry: updateVisuals(entry))
#if len(sys.argv)>1:
    #entry.set(sys.argv[1])
#calculation=tk.StringVar(root)

# change title
root.title("Double Pendulum")
root.overrideredirect(True)

# make non resizable and of a minimal size and draggable
root.resizable(0,0)
root.minsize(200,215)

# change window spawn position
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
root.geometry("200x215"+"+"+str(screen_width-220)+"+"+str(10))
root.update_idletasks()

# add window contents
pixelImg = tk.PhotoImage(width=1,height=1)

canvas = tk.Canvas(root,bg="#000000",relief=tk.SUNKEN,width=root.winfo_width()-8,height=root.winfo_height()-19-8,borderwidth=4,confine=True)
canvas.place(x=-2,y=19-2)

drag = tk.Label(root,image=pixelImg,bg="#BBBBBB",relief=tk.RAISED,width=root.winfo_width(),height=15)
drag.bind("<ButtonPress-1>", start_move)
drag.bind("<ButtonRelease-1>", stop_move)
drag.bind("<B1-Motion>", do_move)
drag.place(x=0,y=0)

xFont = font.Font(size=9)
close_button = tk.Button(root, text='x', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=root.destroy)
close_button.place(x=root.winfo_width()-19,y=0)

new_button = tk.Button(root, text='⟳', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=init_pendulums)
new_button.place(x=0,y=0)

pause_var = tk.StringVar(root,"⏸︎")
pause_button = tk.Button(root, textvariable=pause_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=pause_unpause)
pause_button.place(x=19,y=0)

spheres_var = tk.StringVar(root,"⚫")
spheres_button = tk.Button(root,textvariable=spheres_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=toggle_color)
spheres_button.place(x=38,y=0)

#container = tk.Frame(root,bg="#999999",relief=tk.SUNKEN,width=root.winfo_width(),height=root.winfo_height()-19,borderwidth=4)
#container.place(x=0,y=19)







#tk.Label(root,text="Character ID:").pack()
#vcmd=root.register(validateInt)
#e=tk.Entry(root,textvariable=entry,validate='all',validatecommand=(vcmd,'%P'))
#e.pack()
#e.focus_set()
#tk.Label(root,text="").pack()
#bd=0,
#tk.Entry(root,textvariable=content,fg="black",state="readonly",font=("Arial 48"),justify=tk.CENTER,width=2).pack()

#tk.Label(root,text="").pack()
#tk.Button(root,text="Expand",command=launchExpanded).pack()

# add unfocus event
#root.bind("<FocusOut>", on_focus_out)

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

#CREATE!!!

#createbutton=tk.Button(win,text="Create Pack",command=create).grid(row=0,column=0)

# start loop

flag_paused=False
flag_spheres=True
ptime=0
pendulums=[]
init_pendulums(40)
root.after(1,loop)
root.mainloop()



#print(sys.version[0])

#if sys.version[0]==str(3):
#   input("Enter to quit")
#elif sys.version[0]==str(2):
#   raw_input("Enter to quit")
