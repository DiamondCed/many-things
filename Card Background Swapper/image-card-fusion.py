from PIL import Image, ImageDraw
import os
import shutil
import math

# set cwd to the folder where this file is # plus now cwd is a shorthand for os.getcwd() I guess idk
os.chdir(__file__.rsplit("\\",1)[0] if len(__file__.rsplit("\\",1))>1 else os.getcwd())
cwd=os.getcwd()

# ensure both required folders exist before starting
if(not "Cards" in os.listdir(cwd) or not "Images" in os.listdir(cwd)):
    print("Please place this in a folder containing a \"Cards\" folder and an \"Images\" folder, then try again.")
    input("(Press enter to exit)")
    exit()

# ensure the templates are there in the parent folder before starting
if(not "template1.png" in os.listdir("..") or not "template2.png" in os.listdir("..")):
    print("Please ensure the template files \"template1.png\" and \"template2.png\" are present in the Parent Directory to this one, then try again.")
    input("(Press enter to exit)")
    exit()

# ensure the cards and images are matched in pairs
if(len(os.listdir("Cards"))!=len(os.listdir("Images"))):
    print("Please ensure the cards and images are properly paired up, then try again.")
    input("(Press enter to exit)")
    exit()

# create output directory # TODO: maybe make it empty the output directory, or at least ask the user to do so
if(not "Output" in os.listdir(cwd)):
    os.mkdir("Output")

# the main course aka card fusion
def fuse(card,image,template):
    # open the images
    image1 = Image.open(image)
    cardImg = Image.open(card) # cardImg and templateImg are trusted to be the same size which is probably a bad idea
    templateImg = Image.open(template)
    
    # scale image1 to be the same width as cardImg
    newW = cardImg.width
    newH = int(cardImg.width * image1.height/image1.width)
    image1 = image1.resize((newW,newH)) # the second parenthesies are for the coordinate tuple (x,y)
    
    # make image1 the same size as cardImg
    temp = Image.new("RGBA",(cardImg.width,cardImg.height),(0,0,0,0)) # make transparent image
    temp.paste(image1)
    image1=temp
    
    # make a copy of image1 that's higher up, then invert it and fuse both together
    temp = Image.new("RGBA",(image1.width,image1.height),(0,0,0,0)) # make transparent image
    temp.paste(image1,(0,image1.height-2*newH))
    temp = temp.transpose(1) # 1 being the code for flipping vertically
    image1.alpha_composite(temp)
    
    # composite together with the card
    final = Image.composite(image1,cardImg,templateImg)
    
    return final # kinda inconsistent but we're gonna have to live with it for now

inp = input("Include glows instead of just boxes? (Y/n)\n(The glows are just a bit jank due to transparency, I just leave the option for either): ")

print("Creating cards, please wait...")

template = ["template1.png","template2.png"][inp in ["N","n"]] # 1 has the glows, 2 has no glows
templatePath = os.path.join(cwd,"..",template)

cards = os.listdir("Cards")
images = os.listdir("Images")
for i in range(len(cards)):
    result = fuse(os.path.join(cwd,"Cards",cards[i]),os.path.join(cwd,"Images",images[i]),templatePath)
    result.save("Output\\"+cards[i])

input("Complete! Press enter to exit")