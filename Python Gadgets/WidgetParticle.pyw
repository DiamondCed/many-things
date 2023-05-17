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
  
class Particle:
    def __init__(self,x=0,y=0,a=0,color=0):
        self.x=x
        self.y=y
        self.a=a
        self.color=color
        self.ignoreWalls=False

    def update(self,inst=1):
        #consts
        speed=0.5
        global walls
        for i in range(int(inst)):
            px=self.x
            py=self.y
            self.x+=math.cos(self.a)*speed
            self.y+=math.sin(self.a)*speed
            if self.ignoreWalls==False:
                collideWall=self.testCollision(px,py,walls)
                if collideWall!=None:
                    n=collideWall[0].getNormal(collideWall[1][0],collideWall[1][1])
                    self.a=(2*n-self.a+math.pi)%(2*math.pi)
                    self.color+=10
                    self.ignoreWalls=True
            else:
                self.ignoreWalls=False
            # loop if gone through a screen boundary
            self.color+=10 if (self.x>200 or self.y>200 or self.x<0 or self.y<0) else 0
            self.x-=200 if self.x>200 else 0
            self.y-=200 if self.y>200 else 0
            
            self.x+=200 if self.x<0 else 0
            self.y+=200 if self.y<0 else 0
    
    def show(self):
        #consts
        length=10
        canvas.create_line(self.x-math.cos(self.a)*length/2,self.y-math.sin(self.a)*length/2,self.x+math.cos(self.a)*length/2,self.y+math.sin(self.a)*length/2,fill=self.hexColor())
        #canvas.create_line(x0,y0,self.p1[0]-m1*math.sin(self.θ1),self.p1[1]-m1*math.cos(self.θ1),fill=self.color)
        #canvas.create_line(self.p1[0]+2*m1*math.sin(self.θ2),self.p1[1]+m1*math.cos(self.θ2),self.p2[0]-m1*math.sin(self.θ2),self.p2[1]-m1*math.cos(self.θ2),fill=self.color)
        
        #if self.showPoints:
        #    for i in range(len(self.points)-1):
        #        canvas.create_line(self.points[i][0],self.points[i][1],self.points[i+1][0],self.points[i+1][1],fill=self.hexColor([x*min(2/(len(self.points)-i-1),1) for x in self.color]))

    def hexColor(self,col=None):
        #print(col)
        if col==None:
            col=self.color
        return ("#"+'%02x%02x%02x' % (int(colorsys.hsv_to_rgb(col/360,1,1)[0]*255), int(colorsys.hsv_to_rgb(col/360,1,1)[1]*255), int(colorsys.hsv_to_rgb(col/360,1,1)[2]*255)))
        
    def testCollision(self,px,py,walls):
        x1=px
        y1=py
        x2=self.x
        y2=self.y
        
        collided=None
        
        for i in range(len(walls)):
            collidecoords=walls[i].getIntersection([[x1,y1],[x2,y2]])
            if not collidecoords==None:
                collided=[walls[i],collidecoords]
        return collided
    
class Wall:
    def __init__(self,x0,y0,x1,y1,type=0,x2=0,y2=0):
        self.points=[[x0,y0],[x1,y1]]
        self.type=type
        if(self.type==1):
            self.points.append([x2,y2])
    
    def show(self):
        if(self.type==0):
            canvas.create_line(self.points[0][0],self.points[0][1],self.points[1][0],self.points[1][1],fill="#ffffff")
            #n=self.getNormal(0,0)
            #canvas.create_line(100,100,100+math.cos(n)*10,100+math.sin(n)*10,fill="#ffffff")
            #canvas.create_line(100,100,100+math.cos(math.pi)*10,100+math.sin(math.pi)*10,fill="#ffffff")
            #canvas.create_line(100,100,100+math.cos(2*n-0-math.pi)*10,100+math.sin(2*n-0-math.pi)*10,fill="#ffffff")
        elif(self.type==1):
            canvas.create_line(self.points[0][0],self.points[0][1],self.points[1][0],self.points[1][1],self.points[2][0],self.points[2][1],fill="#ffffff",smooth=True)
            #canvas.create_line(100,100,self.points[0][0],self.points[0][1],fill="#999999")
            #n=self.getNormal(0,0,t=0.4)
            #canvas.create_line(100,100,100+math.cos(n)*10,100+math.sin(n)*10,fill="#ffffff")
            #canvas.create_line(100,100,100+math.cos(math.pi)*10,100+math.sin(math.pi)*10,fill="#ffffff")
            #canvas.create_line(100,100,100+math.cos(2*n-0-math.pi)*10,100+math.sin(2*n-0-math.pi)*10,fill="#ffffff")
    
    
    def getNormal(self,x,y,t=-1):
        a=0
        if(self.type==0):
            if not self.points[1][0]-self.points[0][0]==0:
                a=math.atan((self.points[1][1]-self.points[0][1])/(self.points[1][0]-self.points[0][0]))+math.pi/2
            else:
                # vertical line has normal of 0 and/or pi
                a=0
        elif(self.type==1 and t==-1):
            tx=quad((self.points[0][0]-2*self.points[1][0]+self.points[2][0]),(-2*self.points[0][0]+2*self.points[1][0]),self.points[0][0]-x)
            ty=quad((self.points[0][1]-2*self.points[1][1]+self.points[2][1]),(-2*self.points[0][1]+2*self.points[1][1]),self.points[0][1]-y)
            t=0
            # find the root present on both x and y coordinates
            for i in range(len(tx)):
                for j in range(len(ty)):
                    if round(tx[i],4)==round(ty[j],4):
                        t=tx[i]
            a=self.getNormal(x,y,t)
        elif(self.type==1 and not t==-1):
            x0=lerp(self.points[0][0],self.points[1][0],t)
            y0=lerp(self.points[0][1],self.points[1][1],t)
            x1=lerp(self.points[1][0],self.points[2][0],t)
            y1=lerp(self.points[1][1],self.points[2][1],t)
            a=0 if x0==x1 else (math.atan((y1-y0)/(x1-x0))+math.pi/2)
        return a
    
    def getIntersection(self,line_ends):
        intersection=[-1,-1]
        if self.type==0:
            # line-line intersection, easier
            if not self.points[0][0]==self.points[1][0]:
                a0=(self.points[1][1]-self.points[0][1])/(self.points[1][0]-self.points[0][0])
                b0=self.points[0][1]-self.points[0][0]*a0
            
            if not line_ends[0][0]==line_ends[1][0]:
                a1=(line_ends[1][1]-line_ends[0][1])/(line_ends[1][0]-line_ends[0][0])
                b1=line_ends[0][1]-line_ends[0][0]*a1
                
            # if wall is a vertical line:
            if self.points[0][0]==self.points[1][0]:
                # if other line is also vertical, set to none
                if line_ends[0][0]==line_ends[1][0]:
                    intersection=None
                # otherwise:
                else:
                    intersection[0]=self.points[0][0]
                    intersection[1]=a1*intersection[0]+b1
            # otherwise, if other line is vertical:
            elif line_ends[0][0]==line_ends[1][0]:
                # already covered case where both are vertical
                intersection[0]=line_ends[0][0]
                intersection[1]=a0*intersection[0]+b0
            # otherwise, if both a0 and a1 are the same:
            elif a0==a1:
                # if b0 and b1 aren't equal, they don't intersect
                # if they are equal, there's an infinite amount of intersections and we don't like that either
                intersection=None
            # in every other case:
            else:
                # normal intersection calculation
                intersection[0]=(b1-b0)/(a0-a1)
                intersection[1]=a0*intersection[0]+b0
            
            # check if the intersection point is in range of both lines
            if not intersection==None:
                # this is ridiculous and also bad but whatever, tests if the intersection point is valid
                x00=min(self.points[0][0],self.points[1][0])
                x01=max(self.points[0][0],self.points[1][0])
                y00=min(self.points[0][1],self.points[1][1])
                y01=max(self.points[0][1],self.points[1][1])
                x10=min(line_ends[0][0],line_ends[1][0])
                x11=max(line_ends[0][0],line_ends[1][0])
                y10=min(line_ends[0][1],line_ends[1][1])
                y11=max(line_ends[0][1],line_ends[1][1])
                if not (intersection[0]>=x00 and intersection[0]<=x01 and intersection[0]>=x10 and intersection[0]<=x11 and intersection[1]>=y00 and intersection[1]<=y01 and intersection[1]>=y10 and intersection[1]<=y11):
                    intersection = None
        # quad-line intersection, harder
        elif self.type==1:
            # do magic things the internet people understood for me
            intersections=[];
            
            normal=[
                line_ends[0][1]-line_ends[1][1],
                line_ends[1][0]-line_ends[0][0]
            ]

            # Q-coefficients
            c2=[
                self.points[0][0]+self.points[1][0]*-2+self.points[2][0],
                self.points[0][1]+self.points[1][1]*-2+self.points[2][1]
            ]
            
            c1=[
                self.points[0][0]*-2+self.points[1][0]*2,
                self.points[0][1]*-2+self.points[1][1]*2
            ]
            
            c0=[
                self.points[0][0],
                self.points[0][1]
            ]
            
            # Transform to line 
            coefficient=line_ends[0][0]*line_ends[1][1]-line_ends[1][0]*line_ends[0][1]
            a=normal[0]*c2[0] + normal[1]*c2[1]
            b=(normal[0]*c1[0] + normal[1]*c1[1])/a
            c=(normal[0]*c0[0] + normal[1]*c0[1] + coefficient)/a
            
            # solve the roots
            roots=[]
            d=b*b-4*c
            if d>0:
                e=d**(1/2)
                roots.append((-b+d**(1/2))/2)
                roots.append((-b-d**(1/2))/2)
            elif d==0:
                roots.push(-b/2);

            # calc the solution points
            for i in range(len(roots)):
                minX=min(line_ends[0][0],line_ends[1][0])
                minY=min(line_ends[0][1],line_ends[1][1])
                maxX=max(line_ends[0][0],line_ends[1][0])
                maxY=max(line_ends[0][1],line_ends[1][1])
                t = roots[i]
                if t>=0 and t<=1:
                    # possible point -- pending bounds check
                    point=[
                        lerp(lerp(self.points[0][0],self.points[1][0],t),lerp(self.points[1][0],self.points[2][0],t),t),
                        lerp(lerp(self.points[0][1],self.points[1][1],t),lerp(self.points[1][1],self.points[2][1],t),t)
                    ]
                    x=point[0]
                    y=point[1]
                    # bounds checks
                    #print(str(int(x))+">="+str(int(minX))+" and "+str(int(y))+">="+str(int(minY))+" and "+str(int(x))+"<="+str(int(maxX))+" and "+str(int(y))+"<="+str(int(maxY)))
                    if line_ends[0][0]==line_ends[1][0] and y>=minY and y<=maxY:
                        # vertical line
                        intersections.append(point);
                    elif line_ends[0][1]==line_ends[1][1] and x>=minX and x<=maxX:
                        # horizontal line
                        intersections.append(point);
                    elif x>=minX and y>=minY and x<=maxX and y<=maxY:
                        # line passed bounds check
                        intersections.append(point);
                    
            if len(intersections)==0:
                intersection = None
            elif len(intersections)==1:
                intersection = intersections[0]
            elif(len(intersections)==2 and math.dist(line_ends[0],intersections[0])<math.dist(line_ends[0],intersections[1])):
                intersection = intersections[0]
            elif len(intersections)==2:
                intersection = intersections[1]
        return(intersection)


def lerp(a,b,c):
    return(a+(b-a)*c)
 
def quad(a,b,c):
    roots=[]
    d=b*b-4*a*c
    if d>0:
        e=d**(1/2)
        if not a==0:
            roots.append((-b+d**(1/2))/(2*a))
            roots.append((-b-d**(1/2))/(2*a))
    elif d==0:
        roots.push(-b/(2*a));
    return roots if not len(roots)==0 else None
 
def init_particles(amount=200):
    global particles
    a=random.random()*2*math.pi
    #print(str(a/math.pi)+"π")
    particles=[]
    for i in range(amount):
        particles.append(Particle(100,100,a+0.00005*i,0))
        particles[len(particles)-1].update()
    

def pause_unpause():
    global flag_paused,pause_var
    if(not len(wall_preview)==0):
        return()
    if flag_paused:
        flag_paused=False
        pause_var.set('⏸')
        # to make sure to rotate it all the way to 0 from either 1 or 2
        if(not flag_add==0):
            toggle_add_wall(True)
        if(not flag_add==0):
            toggle_add_wall(True)
    else:
        flag_paused=True
        pause_var.set('▶')
        
def toggle_add_wall(pause_skip=False):
    global flag_add,add_var
    if(not len(wall_preview)==0):
        return()
    
    if flag_add==0:
        flag_add=1
        add_var.set('L')
        if(not flag_paused and not pause_skip):
            pause_unpause()
    elif flag_add==1:
        flag_add=2
        add_var.set('Ł')
    else:
        flag_add=0
        add_var.set('+/')

def toggle_wall_mode():
    global flag_wall,wall_var
    if flag_wall:
        flag_wall=False
        wall_var.set('/')
    else:
        flag_wall=True
        wall_var.set('⌒')

def loop():
    global ptime, particles, flag_paused
    deltaTime=math.ceil((time.time()-ptime)*1000)
    #print(deltaTime)
    ptime = time.time()
    
    canvas.delete("all")
    
    if not flag_paused:
        for i in range(len(particles)):
            particles[i].update(min(deltaTime,4))
    
    
    for i in range(len(particles)):
        particles[i].show()
    for i in range(len(walls)):
        walls[i].show()
    
    # if user is in "add wall" mode
    if(not flag_add==0):
        # if one point is placed
        if(len(wall_preview)==1):
            canvas.create_line(wall_preview[0][0],wall_preview[0][1],mouse_x,mouse_y,fill=("#999999" if flag_add==1 else "#990000"))
        # else if two points are placed, and the mode is curve
        elif(len(wall_preview)==2 and flag_wall==True):
            canvas.create_line(wall_preview[0][0],wall_preview[0][1],mouse_x,mouse_y,wall_preview[1][0],wall_preview[1][1],fill="#999999",smooth=True)
    
    root.update()
    root.after(10,loop)
    
wall_preview=[]
def place_wall_point(event):
    global wall_preview,walls
    if(flag_add==1):
        wall_preview.append([event.x,event.y])
        if(flag_wall==False and len(wall_preview)==2):
            walls.append(Wall(wall_preview[0][0],wall_preview[0][1],wall_preview[1][0],wall_preview[1][1]))
            wall_preview=[]
        elif(flag_wall==True and len(wall_preview)==3):
            walls.append(Wall(wall_preview[0][0],wall_preview[0][1],wall_preview[2][0],wall_preview[2][1],1,wall_preview[1][0],wall_preview[1][1]))
            wall_preview=[]
    if(flag_add==2):
        wall_preview.append([event.x,event.y])
        if(len(wall_preview)==2):
            toRemove=[]
            for i in range(len(walls)):
                if not walls[i].getIntersection(wall_preview)==None:
                    toRemove.append(walls[i])
            for wall in toRemove:
                walls.remove(wall)
            wall_preview=[]
                
        
def cancel_wall(event):
    global wall_preview
    wall_preview=[]
    
mouse_x=0
mouse_y=0
def mouse_movment(event):
    global mouse_x,mouse_y
    mouse_x=event.x
    mouse_y=event.y
  
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
root.title("Particle Simulation")
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

    #canvas
canvas = tk.Canvas(root,bg="#000000",relief=tk.SUNKEN,width=root.winfo_width()-8,height=root.winfo_height()-19-8,borderwidth=4,confine=True)
canvas.place(x=-2,y=19-2)
canvas.bind("<ButtonPress-1>", place_wall_point)
canvas.bind("<ButtonPress-3>", cancel_wall)
canvas.bind("<Motion>", mouse_movment)

    #drag handle
drag = tk.Label(root,image=pixelImg,bg="#BBBBBB",relief=tk.RAISED,width=root.winfo_width(),height=15)
drag.bind("<ButtonPress-1>", start_move)
drag.bind("<ButtonRelease-1>", stop_move)
drag.bind("<B1-Motion>", do_move)
drag.place(x=0,y=0)

    #close button
xFont = font.Font(size=9)
close_button = tk.Button(root, text='x', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=root.destroy)
close_button.place(x=root.winfo_width()-19,y=0)

    #restart button
new_button = tk.Button(root, text='⟳', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=init_particles)
new_button.place(x=0,y=0)

    #pause button
pause_var = tk.StringVar(root,"⏸︎")
pause_button = tk.Button(root, textvariable=pause_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=pause_unpause)
pause_button.place(x=19,y=0)

    #add walls button
add_var = tk.StringVar(root,"+/")
add_button = tk.Button(root, textvariable=add_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=toggle_add_wall)
add_button.place(x=38,y=0)

    #wall mode button
wall_var = tk.StringVar(root,"/")
wall_button = tk.Button(root, textvariable=wall_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=toggle_wall_mode)
wall_button.place(x=57,y=0)

#spheres_var = tk.StringVar(root,"⚫")
#spheres_button = tk.Button(root,textvariable=spheres_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=toggle_color)
#spheres_button.place(x=38,y=0)

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
flag_add=0
flag_wall=False
ptime=0
particles=[]

walls=[]
offset=(root.winfo_width()-int(canvas["width"]))/2+2
w=int(canvas["width"])-1
h=int(canvas["height"])-1
 # parabolic walls
#walls.append(Wall(w/2+offset,h+offset,w+offset,h+offset,1,w+offset,h/2+offset))
#walls.append(Wall(w/2+offset,0+offset,w+offset,0+offset,1,w+offset,h/2+offset))
#walls.append(Wall(w/2+offset,h+offset,0+offset,h+offset,1,0+offset,h/2+offset))
#walls.append(Wall(w/2+offset,0+offset,0+offset,0+offset,1,0+offset,h/2+offset))
 # square walls
ol=10
#walls.append(Wall(0+offset-ol,0+offset,w+offset+ol,0+offset))
#walls.append(Wall(w+offset,0+offset-ol,w+offset,h+offset+ol))
#walls.append(Wall(0+offset-ol,h+offset,w+offset+ol,h+offset))
#walls.append(Wall(0+offset,0+offset-ol,0+offset,h+offset+ol))
 # hourglass walls
walls.append(Wall(0+offset-ol,0+offset,w+offset+ol,0+offset))
walls.append(Wall(0+offset-ol,h+offset,w+offset+ol,h+offset))
walls.append(Wall(w+offset,0+offset,w/2,h/2,1,w+offset,h+offset))
walls.append(Wall(0+offset,0+offset,w/2,h/2,1,0+offset,h+offset))

init_particles()
root.after(1,loop)
root.mainloop()



#print(sys.version[0])

#if sys.version[0]==str(3):
#   input("Enter to quit")
#elif sys.version[0]==str(2):
#   raw_input("Enter to quit")
