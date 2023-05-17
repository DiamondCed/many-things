import Tkinter as tk

# add instance
win = tk.Tk()

# change title
win.title("Hi")

# make non resizable and of a minimal size
win.resizable(0,0)
win.minsize(200,200)

# widget format: tk.Name(window,properties)

# text widgets
tk.Label(win,text="This text is keeping the box to its current size.").pack()
lbl2 = tk.Label(win,text="Text but w/ a variable")
lbl2.pack()
# -------------

# button, checkbox and checkbox variable
var=tk.IntVar()

def hello():
	print(var.get())

button = tk.Button(win,text="That is a button",command=hello)
button.pack()
check = tk.Checkbutton(win,text="a",variable=var)
check.pack()
# --------------

listvar=tk.StringVar(win)
options={"a","b","c","d"}
listvar.set("a")
list=tk.OptionMenu(win,listvar,*options)
list.pack()


# start loop
win.mainloop()


