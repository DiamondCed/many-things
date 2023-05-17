from pystray import MenuItem as item
from pystray import Menu
import pystray
from PIL import Image
import tkinter as tk
import os

from pynput.mouse import Button, Controller



def quit_window(icon, item):
    global window
    icon.stop()
    window.destroy()
    window=None

def show_window(icon, item):
    icon.stop()
    window.deiconify()

def withdraw_window(window):    
    window.withdraw()
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    image = Image.open("favicon.ico")
    menu = pystray.Menu(item('Quit', quit_window), item('Show', show_window))
    icon = pystray.Icon("name", image, "title", menu)
    icon.run()

mouse=Controller()
def loop(a=1):
    current_mouse_position = mouse.position
    print(current_mouse_position)
    window.after(1,loop)


window = tk.Tk();
window.title("Welcome")
window.protocol('WM_DELETE_WINDOW', lambda: withdraw_window(window))
#window.attributes('-fullscreen', True)
def main():
    print("hi")
    window.after(1,loop)
    window.mainloop()

while(window!=None):
    main()