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
    
def board_clicked(event):
    board.clicked(event.x,event.y)

def divide_color(color,divider):
    r=int(color[1:3],16)//divider
    g=int(color[3:5],16)//divider
    b=int(color[5:7],16)//divider
    return("#"+hex(r)[2:].zfill(2)+hex(g)[2:].zfill(2)+hex(b)[2:].zfill(2))
    
def color_from_angle(angle):
    #angle from 0 to 1
    c=colorsys.hsv_to_rgb(angle,1,1)
    return("#"+hex(int(c[0]*255))[2:].zfill(2)+hex(int(c[1]*255))[2:].zfill(2)+hex(int(c[2]*255))[2:].zfill(2))
  
#targets->shape->orientation  
targets = [
            #line: 0
            [
                
                [
                    [1,1,1,1]
                ],
                [
                    [1],
                    [1],
                    [1],
                    [1]
                ],
                [
                    [0,0,0,1],
                    [0,0,1,0],
                    [0,1,0,0],
                    [1,0,0,0]
                ],
                [
                    [1,0,0,0],
                    [0,1,0,0],
                    [0,0,1,0],
                    [0,0,0,1]
                ]
            ],
            #square: 1
            [
                [
                    [1,1],
                    [1,1]
                ],
                [
                    [0,1,0],
                    [1,0,1],
                    [0,1,0]
                ]
            
            ],
            #cross: 2
            [
                [
                    [1,0,1],
                    [0,1,0],
                    [1,0,1]
                ],
                [
                    [0,1,0],
                    [1,1,1],
                    [0,1,0]
                ]
            ],
            #tetris T: 3
            [
                [
                    [1,1,1],
                    [0,1,0]
                ],
                [
                    [1,0],
                    [1,1],
                    [1,0]
                ],
                [
                    [0,1,0],
                    [1,1,1]
                ],
                [
                    [0,1],
                    [1,1],
                    [0,1]
                ]
            ],
            #tetris L/J: 4
            [
                [
                    [0,0,1],
                    [1,1,1]
                ],
                [
                    [1,0],
                    [1,0],
                    [1,1]
                ],
                [
                    [1,1,1],
                    [1,0,0]
                ],
                [
                    [1,1],
                    [0,1],
                    [0,1]
                ],
                [
                    [1,1,1],
                    [0,0,1]
                ],
                [
                    [0,1],
                    [0,1],
                    [1,1]
                ],
                [
                    [1,0,0],
                    [1,1,1]
                ],
                [
                    [1,1],
                    [1,0],
                    [1,0]
                ]
            ],
            #tetris S/Z: 5
            [
                [
                    [0,1,1],
                    [1,1,0]
                ],
                [
                    [1,0],
                    [1,1],
                    [0,1]
                ],
                [
                    [1,1,0],
                    [0,1,1]
                ],
                [
                    [0,1],
                    [1,1],
                    [1,0]
                ]
            ]
            
        ]

canvas_size = 188
xoff = (200-canvas_size)/2
yoff = (200-canvas_size)/2

outline_color = "#999999"
# player 2, neutral, player 1, highlight p2, highlight neutral, highlight p1
colors = ["#FFFF00","#000000","#FF0000","#00FFFF","#000000","#0000FF"]


class Board:
    def __init__(self, canvas, width, height, target):

        self.canvas = canvas
        self.width = width
        self.height = height
        self.target = target
        self.board = []
        self.init_board()
        self.curr_player = 1
        self.win=0
        
        self.current_token = None

    def init_board(self):
        self.board = []
        for i in range(self.width):
            self.board.append([])
            for j in range(self.height):
                self.board[i].append(0)

    def update(self):
        if(not self.current_token==None):
            self.current_token.update()
    
    def show(self):
        orientation = 0 if self.width>self.height else 1 if self.height>self.width else 2

        if orientation == 0:
            tile = canvas_size/self.width
            circle_size = tile*0.9
            # leave a 1-tile space at the bottom, then center on the remaining space
            boardspace = canvas_size-tile
            topheight = (boardspace-tile*self.height)/2
            for i in range(self.width):
                for j in range(self.height):
                    fill_color = colors[1] if not self.current_token==None and (self.current_token.tx == i and self.current_token.ty == j) else colors[self.board[i][j]+1]
                    self.canvas.create_oval(xoff+(i+0.5)*tile-circle_size/2,yoff+boardspace-topheight-((j+0.5)*tile-circle_size/2),xoff+(i+0.5)*tile+circle_size/2,yoff+boardspace-topheight-((j+0.5)*tile+circle_size/2),fill=fill_color,outline=outline_color)
            # draw squares at the bottom to indicate current player
            self.canvas.create_rectangle(xoff+canvas_size/2-tile,yoff+canvas_size-tile,xoff+canvas_size/2,yoff+canvas_size,fill=colors[2] if self.curr_player==1 else divide_color(colors[2],2))
            self.canvas.create_rectangle(xoff+canvas_size/2,yoff+canvas_size-tile,xoff+canvas_size/2+tile,yoff+canvas_size,fill=colors[0] if self.curr_player==-1 else divide_color(colors[0],2))
        
        elif orientation == 1:
            tile = canvas_size/self.height
            circle_size = tile*0.9
            # leave a 1-tile space on the right, then center on the remaining space
            boardspace = canvas_size-tile
            leftwidth = (boardspace-tile*self.width)/2
            for i in range(self.width):
                for j in range(self.height):
                    fill_color = colors[1] if not self.current_token==None and (self.current_token.tx == i and self.current_token.ty == j) else colors[self.board[i][j]+1]
                    self.canvas.create_oval(xoff+leftwidth+(i+0.5)*tile-circle_size/2,yoff+canvas_size-((j+0.5)*tile-circle_size/2),xoff+leftwidth+(i+0.5)*tile+circle_size/2,yoff+canvas_size-((j+0.5)*tile+circle_size/2),fill=fill_color,outline=outline_color)
            # draw squares on the right to indicate current player
            self.canvas.create_rectangle(2*xoff+canvas_size-tile, yoff+canvas_size-2*tile, 2*xoff+canvas_size, yoff+canvas_size-tile,fill=colors[2] if self.curr_player==1 else divide_color(colors[2],2))
            self.canvas.create_rectangle(2*xoff+canvas_size-tile, yoff+canvas_size-tile, 2*xoff+canvas_size, yoff+canvas_size,fill=colors[0] if self.curr_player==-1 else divide_color(colors[0],2))
           
        elif orientation == 2: 
            tile = canvas_size/(self.height+1)
            circle_size = tile*0.9
            # leave a 1-tile space on the bottom, then center _horizontally_ on the remaining space
            leftwidth = tile/2
            for i in range(self.width):
                for j in range(self.height):
                    fill_color = colors[1] if not self.current_token==None and (self.current_token.tx == i and self.current_token.ty == j) else colors[self.board[i][j]+1]
                    self.canvas.create_oval(xoff+leftwidth+(i+0.5)*tile-circle_size/2,yoff+canvas_size-tile-((j+0.5)*tile-circle_size/2),xoff+leftwidth+(i+0.5)*tile+circle_size/2,yoff+canvas_size-tile-((j+0.5)*tile+circle_size/2),fill=fill_color,outline=outline_color)
            # draw squares at the bottom to indicate current player
            self.canvas.create_rectangle(xoff+canvas_size/2-tile,yoff+canvas_size-tile,xoff+canvas_size/2,yoff+canvas_size,fill=colors[2] if self.curr_player==1 else divide_color(colors[2],2))
            self.canvas.create_rectangle(xoff+canvas_size/2,yoff+canvas_size-tile,xoff+canvas_size/2+tile,yoff+canvas_size,fill=colors[0] if self.curr_player==-1 else divide_color(colors[0],2))
            
        if(not self.current_token==None):
            self.current_token.show()

    def clicked(self, x, y):
        tile=canvas_size/(self.height)
        leftwidth = (canvas_size-tile-tile*self.width)/2 if self.height>self.width else tile/2 if self.height==self.width else 0
        boardwidth = (canvas_size-2*leftwidth-tile) if self.height>self.width else canvas_size-tile if self.height==self.width else canvas_size
    
        tx = math.floor((x-xoff-leftwidth)/boardwidth*self.width)
        ty = math.floor((y-yoff)/canvas_size*self.height) # unused
        
        if(tx<0 or tx>self.width-1 or self.curr_player==0):
            return()
        for i in range(len(self.board[tx])):
            if(self.board[tx][i]==0):
                self.board[tx][i] = self.curr_player
                self.create_token(tx,i,self.curr_player)
                self.win = self.test_win()
                self.curr_player = -self.curr_player if self.win==0 else 0
                break

    def create_token(self,tx,ty,player):
        tile = canvas_size/max(self.width,self.height)
        topheight = (canvas_size-tile-tile*self.height)/2 if self.width>self.height else 0
        
        target = canvas_size - yoff - tile - topheight - tile/2 - ty*tile
        
        self.current_token = Token(self,tx,-tile/2,target,ty,player)

    def test_win(self):
        shapes = targets[self.target]
        any_success = 0
        for shape in shapes:
            for i in range(len(self.board)-len(shape)+1):
                for j in range(len(self.board[i])-len(shape[0])+1):
                    success=1
                    for k in range(len(shape)):
                        for l in range(len(shape[k])):
                            if(shape[k][l]==1 and not self.board[i+k][j+l]==self.curr_player):
                                success=0
                    if(success==1):
                        for k in range(len(shape)):
                            for l in range(len(shape[k])):
                                if(shape[k][l]==1):
                                    self.board[i+k][j+l]+=3
                        any_success=1
        return(self.curr_player*any_success)

class Token:
    def __init__(self,parent,tx,y,target_y,ty,player):
        self.parent = parent
        self.tx = tx
        self.y = y
        self.target_y = target_y
        self.ty = ty
        self.player = player
        
        self.speed = 0
        self.acc = 0.1

    def update(self):
        self.speed+=self.acc
        
        for i in range(int(self.speed*10)):
            if(self.y<self.target_y):
                self.y = self.y+0.1
        
        if(self.y>=self.target_y):
            self.parent.current_token=None
 
    def show(self):
        tile = canvas_size/max(self.parent.width,self.parent.height) if not self.parent.width==self.parent.height else canvas_size/(self.parent.width+1)
        circle_size = tile*0.9
        xoff2 = (canvas_size-tile-tile*self.parent.width)/2 if self.parent.height>self.parent.width else tile/2 if self.parent.height==self.parent.width else 0
        
        self.parent.canvas.create_oval(xoff+(self.tx+0.5)*tile+xoff2-circle_size/2,yoff+self.y-circle_size/2,xoff+(self.tx+0.5)*tile+xoff2+circle_size/2,yoff+self.y+circle_size/2,fill=colors[self.player+1],outline=outline_color)


 
def init_board():
    global board
    #color=colorsys.hsv_to_rgb(i/amount,1,1)
    #target=random.random()*len(targets)
    board=Board(canvas,flag_width,flag_height,flag_shape)
    board.update()
    
def randomize_colors():
    global colors
    #[p2,n,p1,p2H,n,p1H]
    c1 = random.random()*0.25+1-0.125
    c2 = c1+random.random()*0.25+0.5+1-0.125
    c3 = c1+0.25
    c4 = c2+0.25
    colors[2]=color_from_angle(c1)
    colors[0]=color_from_angle(c2)
    colors[5]=color_from_angle(c3)
    colors[3]=color_from_angle(c4)

def cycle_shape():
    global flag_shape,shape_var,smallFont
    icons = ["━","⬛","✖","┣","┗","▟▘"]
    sizes = [ 9,  9,  10,  9,  10,  7]
    flag_shape+=1
    if(flag_shape>len(targets)-1):
        flag_shape=0
    shape_var.set(icons[flag_shape])
    smallFont.config(size=sizes[flag_shape])
    init_board()
    
def cycle_width():
    global flag_width,width_var
    minval=4
    maxval=9
    flag_width+=1
    if(flag_width>maxval):
        flag_width=minval
    width_var.set(str(flag_width))
    init_board()

def cycle_height():
    global flag_height,height_var
    minval=4
    maxval=9
    flag_height+=1
    if(flag_height>maxval):
        flag_height=minval
    height_var.set(str(flag_height))
    init_board()



"""def toggle_color():
    global flag_spheres,sphere_var
    if flag_spheres:
        flag_spheres=False
        spheres_var.set('⚪')
    else:
        flag_spheres=True
        spheres_var.set('⚫')"""
    

def loop():
    global ptime, board, flag_paused, flag_spheres
    delta_time=math.ceil((time.time()-ptime)*1000)
    #print(delta_time)
    ptime = time.time()
    board.update()#min(delta_time,20)
    
    canvas.delete("all")
    
    board.show()
    
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
root.title("Connect 4")
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
canvas.bind("<ButtonPress-1>", board_clicked)

drag = tk.Label(root,image=pixelImg,bg="#BBBBBB",relief=tk.RAISED,width=root.winfo_width(),height=15)
drag.bind("<ButtonPress-1>", start_move)
drag.bind("<ButtonRelease-1>", stop_move)
drag.bind("<B1-Motion>", do_move)
drag.place(x=0,y=0)

xFont = font.Font(size=9)
smallFont = font.Font(size=0)
close_button = tk.Button(root, text='x', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=root.destroy)
close_button.place(x=root.winfo_width()-19,y=0)

new_button = tk.Button(root, text='⟳', font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=init_board)
new_button.place(x=0,y=0)

shape_var = tk.StringVar(root,"━")
shape_button = tk.Button(root, textvariable=shape_var, font=smallFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=cycle_shape)
shape_button.place(x=19,y=0)

width_var = tk.StringVar(root,"7")
width_button = tk.Button(root, textvariable=width_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=cycle_width)
width_button.place(x=38,y=0)

height_var = tk.StringVar(root,"6")
height_button = tk.Button(root, textvariable=height_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=cycle_height)
height_button.place(x=57,y=0)

color_var = tk.StringVar(root,"🌢")
color_button = tk.Button(root, textvariable=color_var, font=xFont, relief=tk.RAISED,bg="#BBBBBB", image=pixelImg, width=11, height=11, compound="c", command=randomize_colors)
color_button.place(x=76,y=0)

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

flag_shape=0
flag_width=7
flag_height=6
ptime=0
init_board()
randomize_colors()
root.after(1,loop)
root.mainloop()



#print(sys.version[0])

#if sys.version[0]==str(3):
#   input("Enter to quit")
#elif sys.version[0]==str(2):
#   raw_input("Enter to quit")
