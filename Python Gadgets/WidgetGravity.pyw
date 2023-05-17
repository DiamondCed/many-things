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

posScale=0.005
radScale=0.5
class Planet:
    def __init__(self,objlist,mass,position,velocity,color,pin=False):
        self.pin=pin
        self.color=color
        self.mass=mass
        self.radius=math.pow(3/(4*math.pi)*self.mass,1/3)
        self.objlist=objlist
        self.position=position
        self.velocity=velocity
        self.trail=[]
    
    def update_velocity(self):
        if self.pin:
            return
        global G
        totalforce=[0,0]
        for i in range(len(self.objlist)):
            if not self.objlist[i]==self and not (math.dist(self.position,self.objlist[i].position))==0:
                force=self.mass*self.objlist[i].mass*G/(math.dist(self.position,self.objlist[i].position)**2)
                #dir=math.atan2(self.position[0]-self.objlist[i].position[0],self.position[1]-self.objlist[i].position[1])
                if not (self.position[0]-self.objlist[i].position[0])==0:
                    dir=math.atan((self.position[1]-self.objlist[i].position[1])/(self.position[0]-self.objlist[i].position[0]))
                    dir+=(math.pi if self.position[0]>self.objlist[i].position[0] else 0)
                elif (self.position[1]-self.objlist[i].position[1])>=0:
                    dir=math.pi/2
                else:
                    dir=-math.pi/2
                
                #print(str(self.position)+", "+str(self.objlist[i].position)+" = "+str(dir))
                totalforce[0]+=force*math.cos(dir)
                totalforce[1]+=force*math.sin(dir)
        ax=totalforce[0]/self.mass
        ay=totalforce[1]/self.mass
        self.velocity[0]+=ax
        self.velocity[1]+=ay
    
    def update_position(self):
        self.trail.insert(0,[self.position[0],self.position[1]])
        if len(self.trail)>200:
            self.trail.pop()
        self.position[0]+=self.velocity[0]
        self.position[1]+=self.velocity[1]

    def show(self):
        
        cp=next(([planet.position[0],planet.position[1]] for planet in self.objlist if planet.pin==True), [0,0])
        #self.system_center_position()
        cp[0]-=20000
        cp[1]-=20000
        #print("["+str(cp[0]*posScale)+", "+str(cp[1]*posScale)+"]")
        #print("["+str(self.position[0]*posScale)+", "+str(self.position[0]*posScale)+"]")
        global canvas,flag_trail
        canvas.create_oval((self.position[0]-cp[0])*posScale-self.radius*radScale,(self.position[1]-cp[1])*posScale-self.radius*radScale,(self.position[0]-cp[0])*posScale+self.radius*radScale,(self.position[1]-cp[1])*posScale+self.radius*radScale,fill=self.hexColor())
        if not self.pin and not flag_trail==0 and not abs(self.position[0]-cp[0]-20000)>60000 and not abs(self.position[1]-cp[1]-20000)>60000:
            if flag_trail==1:
                fac=4
                maxlen=50
            if flag_trail==2:
                fac=8
                maxlen=200
            for i in range(math.floor(min(len(self.trail),maxlen)/fac)):
                x0=(self.position[0]-cp[0])*posScale if i==0 else (self.trail[fac*(i-1)][0]-cp[0])*posScale
                y0=(self.position[1]-cp[1])*posScale if i==0 else (self.trail[fac*(i-1)][1]-cp[1])*posScale
                x1=(self.trail[fac*(i)][0]-cp[0])*posScale
                y1=(self.trail[fac*(i)][1]-cp[1])*posScale
                canvas.create_line(x0,y0,x1,y1,fill=self.hexColor())
    
    def collision_test(self):
        for planet in self.objlist:
            if not planet==self:
                #print(math.dist(self.position,self.objlist[i].position))
                if math.dist(self.position,planet.position)<(self.radius+planet.radius)*100 and not (self.pin==True and planet.pin==True):
                    #print("ouch")
                    if planet.mass<=self.mass and not planet.pin:
                        self.objlist.remove(planet)
                    if planet.mass>=self.mass and not self.pin and self in self.objlist:
                        self.objlist.remove(self)
                    
    
    def system_center_mass(self):
        cm=[0,0]
        totalmass=0
        for i in range(len(self.objlist)):
            cm[0]+=self.objlist[i].position[0]*self.objlist[i].mass
            cm[1]+=self.objlist[i].position[1]*self.objlist[i].mass
            totalmass+=self.objlist[i].mass
        cm[0]/=totalmass
        cm[1]/=totalmass
        return cm
    
    def system_center_position(self):
        cp=[0,0]
        pins=[]
        for i in range(len(self.objlist)):
            cp[0]+=self.objlist[i].position[0]
            cp[1]+=self.objlist[i].position[1]
            if self.objlist[i].pin==True:
                pins.append(self.objlist[i])
        cp[0]/=len(self.objlist)
        cp[1]/=len(self.objlist)
        if not pins==[]:
            cp=[0,0]
            for i in range(len(pins)):
                cp[0]+=pins[i].position[0]
                cp[1]+=pins[i].position[1]
            cp[0]/=len(pins)
            cp[1]/=len(pins)
        return cp
    
    def system_average_pin_stats(self):
        pins=[]
        mass=0
        position=[0,0]
        for i in range(len(self.objlist)):
            if self.objlist[i].pin==True:
                pins.append(self.objlist[i])
        for star in pins:
            mass+=star.mass
            position[0]+=star.position[0]*star.mass
            position[1]+=star.position[1]*star.mass
        position[0]/=mass
        position[1]/=mass
        return [position,mass]
    
    def hexColor(self,col=None):
        #print(col)
        if col==None:
            col=self.color
        return ("#"+'%02x%02x%02x' % (int(col[0]*255), int(col[1]*255), int(col[2]*255)))
 
def init_planets(amount=2):
    global planets
    planets=[]
    #viewport=40000x40000
    planets.append(Planet(planets,50000,[0,0],[0,0],colorsys.hsv_to_rgb(0.175,1,1),True))
    planets.append(Planet(planets,500,[10000,0],[0,592],colorsys.hsv_to_rgb(0.5,1,1)))
    #planets.append(Planet(planets,500,[5000,0],[0,821],colorsys.hsv_to_rgb(0,1,1)))

G=66700  
masses=[100,500,4000,50000]
def add_planet(event=None,pos=None,vel=None):
    #print(str(event)+", "+str(pos)+", "+str(vel))

    cam=next(([planet.position[0],planet.position[1]] for planet in planets if planet.pin==True), [0,0])
    mass = masses[flag_size]
    if not event==None:
        position=[200*(event.x-0.005*(cam[0])-100),200*(event.y-0.005*(cam[1])-100)]
    #print(position)
    #print(planets[0].system_center_position())
    if flag_color==0:
        color=colorsys.hsv_to_rgb(color_options[random.randint(2,len(color_options))-1],1,1)
    else:
        color=colorsys.hsv_to_rgb(color_options[flag_color],1,1)
        
    if flag_mode==0 and not flag_size==3:
        #orbit
        if not math.dist([planets[0].system_average_pin_stats()[0][0],planets[0].system_average_pin_stats()[0][1]],[position[0],position[1]])==0:
            velocity_mag=G*(planets[0].system_average_pin_stats()[1]+mass)
            velocity_mag/=math.dist([planets[0].system_average_pin_stats()[0][0],planets[0].system_average_pin_stats()[0][1]],[position[0],position[1]])
            velocity_mag=velocity_mag**0.5
        else:
            return
        if not (position[0]-planets[0].system_average_pin_stats()[0][0])==0:
            velocity_dir=math.atan((position[1]-planets[0].system_average_pin_stats()[0][1])/(position[0]-planets[0].system_average_pin_stats()[0][0]))
            velocity_dir+=(math.pi if position[0]>planets[0].system_average_pin_stats()[0][0] else 0)
        elif (position[1]-planets[0].system_average_pin_stats()[0][1])>=0:
            velocity_dir=math.pi/2
        else:
            velocity_dir=-math.pi/2
        velocity_dir-=math.pi/2
        velocity=[velocity_mag*math.cos(velocity_dir),velocity_mag*math.sin(velocity_dir)]
    elif flag_mode==1 and not flag_size==3:
        #random
        velocity=[random.random()*500,random.random()*500]
    elif flag_mode==2 or flag_size==3:
        #zero
        velocity=[0,0]
        if event==None:
            position=pos
    elif flag_mode==3:
        #shot
        velocity=vel
        position=pos

    planets.append(Planet(planets,mass,position,velocity,color,flag_size==3))
 
shot_start=[]
shot_active=False
def shot_init(event):
    #print("start")
    if not flag_mode==3:
        add_planet(event)
    global shot_start,shot_active
    cam=next(([planet.position[0],planet.position[1]] for planet in planets if planet.pin==True), [0,0])
    shot_start=[200*(event.x-0.005*(cam[0])-100),200*(event.y-0.005*(cam[1])-100)]
    shot_active=True

shot_preview=[]
shot_scale=0.1
def shot_compute(event):
    global shot_preview
    if not flag_mode==3:
        return
    shot_preview=[]
    cam=next(([planet.position[0],planet.position[1]] for planet in planets if planet.pin==True), [0,0])
    shot_end=[200*(event.x-0.005*(cam[0])-100),200*(event.y-0.005*(cam[1])-100)]
    
    amt=30
    
    
    mass=masses[flag_size]
    currPos=[shot_start[0],shot_start[1]]
    currVel=[shot_scale*(shot_start[0]-shot_end[0]),shot_scale*(shot_start[1]-shot_end[1])]
    for i in range(amt):
        totalforce=[0,0]
        for i in range(len(planets)):
            if not (math.dist(currPos,planets[i].position))==0:
                force=mass*planets[i].mass*G/(math.dist(currPos,planets[i].position)**2)
                #dir=math.atan2(self.position[0]-self.objlist[i].position[0],self.position[1]-self.objlist[i].position[1])
                if not (currPos[0]-planets[i].position[0])==0:
                    dir=math.atan((currPos[1]-planets[i].position[1])/(currPos[0]-planets[i].position[0]))
                    dir+=(math.pi if currPos[0]>planets[i].position[0] else 0)
                elif (currPos[1]-planets[i].position[1])>=0:
                    dir=math.pi/2
                else:
                    dir=-math.pi/2
                
                #print(str(self.position)+", "+str(self.objlist[i].position)+" = "+str(dir))
                totalforce[0]+=force*math.cos(dir)
                totalforce[1]+=force*math.sin(dir)
        ax=totalforce[0]/mass
        ay=totalforce[1]/mass
        currVel[0]+=ax
        currVel[1]+=ay
        currPos[0]+=currVel[0]
        currPos[1]+=currVel[1]
        shot_preview.append([currPos[0],currPos[1]])
    

def shot_release(event):
    #print("stop")
    if not flag_mode==3:
        return
    global shot_start,shot_preview,shot_active
    cam=next(([planet.position[0],planet.position[1]] for planet in planets if planet.pin==True), [0,0])
    shot_end=[200*(event.x-0.005*(cam[0])-100),200*(event.y-0.005*(cam[1])-100)]
    add_planet(None,[shot_start[0],shot_start[1]],[shot_scale*(shot_start[0]-shot_end[0]),shot_scale*(shot_start[1]-shot_end[1])])
    shot_start=[]
    shot_preview=[]
    shot_active=False

def pause_unpause():
    global flag_paused,pause_var
    if flag_paused:
        flag_paused=False
        pause_var.set('⏸')
    else:
        flag_paused=True
        pause_var.set('▶')
        
def swap_mode():
    global flag_mode,mode_var
    chars=['◯','✹','𐩑','➶']
    flag_mode=(flag_mode+1)%4
    mode_var.set(chars[flag_mode])
    
def swap_size():
    global flag_size,size_var
    chars=['🞄','●','⬤','☉']
    flag_size=(flag_size+1)%4
    size_var.set(chars[flag_size])
    
def swap_color():
    global flag_color,color_button
    flag_color=(flag_color+1)%len(color_options)
    color_button["foreground"]="#000000" if flag_color==0 else Planet.hexColor(None,colorsys.hsv_to_rgb(color_options[flag_color],1,1))

def swap_trail():
    global flag_trail,trail_var
    chars=['⨯','/','//']
    flag_trail=(flag_trail+1)%3
    trail_var.set(chars[flag_trail])
    
    
    
def loop():
    global ptime, planets, flag_paused
    deltaTime=math.ceil((time.time()-ptime)*1000)
    #print(deltaTime)
    ptime = time.time()
    
    if not flag_paused:
        for planet in planets:
            planet.collision_test()
        
        for i in range(len(planets)):
            planets[i].update_velocity()
            planets[i].update_position()

    
    canvas.delete("all")
    
    for i in range(len(planets)):
        planets[i].show()
    fac=1
    cp=next(([planet.position[0],planet.position[1]] for planet in planets if planet.pin==True), [0,0])
    cp[0]-=20000
    cp[1]-=20000
    
    
    for i in range(math.floor(len(shot_preview)/fac)):
        x0=(shot_start[0]-cp[0])*posScale if i==0 else (shot_preview[fac*(i-1)][0]-cp[0])*posScale
        y0=(shot_start[1]-cp[1])*posScale if i==0 else (shot_preview[fac*(i-1)][1]-cp[1])*posScale
        x1=(shot_preview[fac*(i)][0]-cp[0])*posScale
        y1=(shot_preview[fac*(i)][1]-cp[1])*posScale
        canvas.create_line(x0,y0,x1,y1,fill="#FF0000")
    
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
root.title("Gravity Simulation")
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
#canvas.bind("<Button-1>",add_planet)
canvas.bind("<ButtonPress-1>", shot_init)
canvas.bind("<ButtonRelease-1>", shot_release)
canvas.bind("<B1-Motion>", shot_compute)

drag = tk.Label(root,image=pixelImg,bg="#BBBBBB",relief=tk.RAISED,width=root.winfo_width(),height=15)
drag.bind("<ButtonPress-1>", start_move)
drag.bind("<ButtonRelease-1>", stop_move)
drag.bind("<B1-Motion>", do_move)
drag.place(x=0,y=0)

xFont = font.Font(size=9)
close_button = tk.Button(root, text='x', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=root.destroy)
close_button.place(x=root.winfo_width()-19,y=0)

new_button = tk.Button(root, text='⟳', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=init_planets)
new_button.place(x=0,y=0)

pause_var = tk.StringVar(root,"⏸︎")
pause_button = tk.Button(root, textvariable=pause_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=pause_unpause)
pause_button.place(x=19,y=0)

mode_var = tk.StringVar(root,"◯")
mode_button = tk.Button(root, textvariable=mode_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=swap_mode)
mode_button.place(x=38,y=0)

size_var = tk.StringVar(root,"●")
size_button = tk.Button(root, textvariable=size_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=swap_size)
size_button.place(x=57,y=0)

color_var = tk.StringVar(root,"🌢")
color_button = tk.Button(root, textvariable=color_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=swap_color)
color_button.place(x=76,y=0)

trail_var = tk.StringVar(root,"/")
trail_button = tk.Button(root, textvariable=trail_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=swap_trail)
trail_button.place(x=95,y=0)

"""spheres_var = tk.StringVar(root,"⚫")
spheres_button = tk.Button(root,textvariable=spheres_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=toggle_color)
spheres_button.place(x=38,y=0)"""

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
#0=orbit,1=random,2=zero,3=shot
flag_mode=0
#small,medium,big,star
flag_size=1
#random,10 picks of color?
color_options=[None,0,0.1,0.16,0.33,0.43,0.5,0.66,0.76,0.83]
flag_color=0
#none, short+high quality, long+low quality
flag_trail=1
ptime=0
planets=[]
init_planets(2)
root.after(1,loop)
root.mainloop()



#print(sys.version[0])

#if sys.version[0]==str(3):
#   input("Enter to quit")
#elif sys.version[0]==str(2):
#   raw_input("Enter to quit")
