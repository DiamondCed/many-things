from PIL import Image
import os

os.chdir(__file__.rsplit("\\",1)[0] if len(__file__.rsplit("\\",1))>1 else os.getcwd())
cwd=os.getcwd()


try:
    ref = Image.open(os.path.join(cwd,"reference.png"))
except:
    try:
        ref = Image.open(os.path.join(cwd,"reference.jpg"))
    except:
        input("Cannot find or read reference image. Please name your reference \"reference.png/jpg\" and place it next to this script.")
        exit()
    
if(not "Input" in os.listdir()):
    input("Cannot find Input folder. Please create a folder named \"Input\" and place it next to this script.")
    exit()

try:
    os.mkdir("Output")
except:
    if(not os.path.isdir("Output")): # is fine if it's already a folder
        input("Something went wrong trying to make the Output folder. Please make sure there is no conficting file")
        exit()

images = os.listdir("Input")
for i in range(len(images)):
    img=None
    try:
        img = Image.open(os.path.join(cwd,"Input",images[i]))
    except: # if I can't read it I just skip it
        continue
    img=img.resize((ref.width,ref.height))
    img.save(os.path.join(cwd,"Output",images[i]))

input("Resizing complete! Find them in the \"Output\" folder.")