import random
import colorsys
from PIL import Image, ImageDraw
import os
import subprocess
from shutil import copyfile
import shutil
import sys

"""
itemout=os.path.join(cwd,to_init[0])
blocksout=os.path.join(cwd,to_init[1])
armorout=os.path.join(cwd,to_init[2])
horsearmorout=os.path.join(cwd,to_init[3])
langout=os.path.join(cwd,to_init[4])
villagerout=os.path.join(cwd,to_init[5])
"""

"""
#gems
rawgems=os.listdir(os.path.join(cwd,"color_textures/gems"))
gems=[]
for i in range(0,len(rawgems)):
	if rawgems[i].endswith(".png"):
		gems.append(rawgems[i])
for i in range(0,len(gems)):
	gems[i]=os.path.join(os.path.join(cwd,"color_textures/gems"),gems[i])

#blocks
rawblocks=os.listdir(os.path.join(cwd,"color_textures/blocks"))
blocks=[]
for i in range(0,len(rawblocks)):
	if rawblocks[i].endswith(".png"):
		blocks.append(rawblocks[i])
for i in range(0,len(blocks)):
	blocks[i]=os.path.join(os.path.join(cwd,"color_textures/blocks"),blocks[i])

#ores
rawores=os.listdir(os.path.join(cwd,"color_textures/ores"))
raworebases=os.listdir(os.path.join(cwd,"base_textures/ores"))
ores=[]
orebases=[]
#color
for i in range(0,len(rawores)):
	if rawores[i].endswith(".png"):
		ores.append(rawores[i])
for i in range(0,len(ores)):
	ores[i]=os.path.join(os.path.join(cwd,"color_textures/ores"),ores[i])
#base
for i in range(0,len(raworebases)):
	if raworebases[i].endswith(".png"):
		orebases.append(raworebases[i])
for i in range(0,len(orebases)):
	orebases[i]=os.path.join(os.path.join(cwd,"base_textures/ores"),orebases[i])


armordiamond=["color_textures/armors/diamond/diamond_helmet.png","color_textures/armors/diamond/diamond_chestplate.png","color_textures/armors/diamond/diamond_leggings.png","color_textures/armors/diamond/diamond_boots.png"]
armornether=["color_textures/armors/netherite/netherite_helmet.png","color_textures/armors/netherite/netherite_chestplate.png","color_textures/armors/netherite/netherite_leggings.png","color_textures/armors/netherite/netherite_boots.png"]
armoritemnames=["diamond_helmet.png","diamond_chestplate.png","diamond_leggings.png","diamond_boots.png"]

armorlayerdiamond=["color_textures/armors/diamond/diamond_layer_1.png","color_textures/armors/diamond/diamond_layer_2.png","color_textures/armors/diamond/diamond_piglin_helmet.png"]
armorlayernether=["color_textures/armors/netherite/netherite_layer_1.png","color_textures/armors/netherite/netherite_layer_2.png","color_textures/armors/netherite/netherite_piglin_helmet.png"]
armorlayernames=["diamond_layer_1.png","diamond_layer_2.png","diamond_piglin_helmet.png"]

horsearmor=["color_textures/horse_armor_diamond_color.png","horse_armor_diamond.png","base_textures/horse_armor_diamond_base.png"]

enchant=["color_textures/enchanting_table_side_color.png","color_textures/enchanting_table_top_color.png"]
enchantbase=["base_textures/enchanting_table_side_base.png","base_textures/enchanting_table_top_base.png"]
#enchantname=["enchanting_table_side.png","enchanting_table_top.png"]

toolscolor=["color_textures/sword_color.png","color_textures/pickaxe_color.png","color_textures/axe_color.png","color_textures/shovel_color.png","color_textures/hoe_color.png","color_textures/horse_armor_color.png"]
toolsbase= ["base_textures/sword_base.png","base_textures/pickaxe_base.png","base_textures/axe_base.png","base_textures/shovel_base.png","base_textures/hoe_base.png","base_textures/horse_armor_base.png"]
toolsnames=["diamond_sword.png","diamond_pickaxe.png","diamond_axe.png","diamond_shovel.png","diamond_hoe.png","diamond_horse_armor.png"]
villager=["color_textures/villager_diamond.png","diamond.png"]

"""

def makepaths(pathslist):
    for path in pathslist:
        if not os.path.exists(path):
            os.makedirs(path)

def create_properties():
  ## sets values to either the input arg (from terminal), or random value otherwise
  #hsv
  properties[0]=int(sys.argv[1])+60 if (len(sys.argv)>1 and int(sys.argv[1])!=-1) else int(random.random()*255)+60
  properties[1]=int(sys.argv[2])+60 if (len(sys.argv)>2 and int(sys.argv[2])!=-1) else int(random.random()*255)+60
  properties[2]=int(sys.argv[3])+60 if (len(sys.argv)>3 and int(sys.argv[3])!=-1) else int(random.random()*255)+60
  #Gem Type (Gem,Lapis,Emerald,Ingot,Quartz,Ruby,..)
  #If ingot (3), also indicates mining ore drops itself
  properties[3]=int(sys.argv[4]) if len(sys.argv)>4 and int(sys.argv[4])!=-1 else int(random.random()*len(resources[0]))
  #Ore Type (Regular,Emerald,Lapis,Dimensional,..)
  properties[4]=int(sys.argv[5]) if len(sys.argv)>5 and int(sys.argv[5])!=-1 else int(random.random()*len(resources[1]))
  #Block Type (Iron,Gold,Diamond,Emerald,Lapis,Redstone,Quartz,RSLamp,..)
  properties[5]=int(sys.argv[6]) if len(sys.argv)>6 and int(sys.argv[6])!=-1 else int(random.random()*len(resources[2]))
  #Armor Model (Diamond,Netherite,..)
  properties[6]=int(sys.argv[7]) if len(sys.argv)>7 and int(sys.argv[7])!=-1 else int(random.random()*len(resources[3]))
  #Tool Models (Diamond,..)
  properties[7]=int(sys.argv[8]) if len(sys.argv)>8 and int(sys.argv[8])!=-1 else int(random.random()*len(resources[4]))
  print(properties)

def create_name():
  ## creates a name with random length and characters
  cons=["b","c","d","f","g","h","j","l","m","n","p","q","r","s","t","v","w","x","z","th","qu"]
  vowels=["a","e","i","o","u","y"]
  endings=["ite","ine","ate","ane","ide","ium","on"] #,"er","ar","um"
  name=""
  for i in range(int(random.random()*2)+1):
    name=name+cons[random.randint(0,len(cons)-1)]
    name=name+vowels[random.randint(0,len(vowels)-1)]
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+endings[random.randint(0,len(endings)-1)]
  if len(sys.argv)>9:
    name=sys.argv[9]
  finalname[0]=name
  finalname[1]=name.capitalize()
  print(finalname[1])
  
def add_color(inpath,outpath):
  img = Image.open(inpath)
  img = img.convert("RGBA")
  w,h=img.size
  r=min(properties[0],255)
  g=min(properties[1],255)
  b=min(properties[2],255)
  color=[r,g,b]
  datas = img.getdata()
  newData = []
  for pixel in datas:
    newData.append((int(r*pixel[0]/255),int(g*pixel[1]/255),int(b*pixel[2]/255),pixel[3]))
  img.putdata(newData)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")

def fuse_base_color(incolor,inbase,outpath):
  add_color(incolor,"temp.png")
  overlay=Image.open("temp.png")
  background=Image.open(inbase)
  
  datasOver = overlay.getdata()
  datasBg = background.getdata()
  datasOut = []
  
  for i in range(len(datasOver)):
    if datasOver[i][3]==0:
      datasOut.append(datasBg[i])
    else:
      datasOut.append(datasOver[i])

  overlay.putdata(datasOut)
  if os.path.exists(outpath):
    os.remove(outpath)
  overlay.save(outpath, "PNG")
  
def create_generics():
  #make block, item and ore textures
  add_color(os.path.join(cwd,"Resources/assets/gems",resources[0][properties[3]]),os.path.join(output_directories[0],"diamond.png"))
  fuse_base_color(os.path.join(cwd,"Resources/assets/ores/color",resources[1][properties[4]]),os.path.join(cwd,"Resources/assets/ores/base/stone.png"),os.path.join(output_directories[1],"diamond_ore.png"))
  fuse_base_color(os.path.join(cwd,"Resources/assets/ores/color",resources[1][properties[4]]),os.path.join(cwd,"Resources/assets/ores/base/deepslate.png"),os.path.join(output_directories[1],"deepslate_diamond_ore.png"))
  add_color(os.path.join(cwd,"Resources/assets/blocks",resources[2][properties[5]]),os.path.join(output_directories[1],"diamond_block.png"))
  
  #make enchanting table
  fuse_base_color(os.path.join(cwd,"Resources/assets/enchanting_table/enchanting_table_side_color.png"),os.path.join(cwd,"Resources/assets/enchanting_table/enchanting_table_side_base.png"),os.path.join(output_directories[1],"enchanting_table_side.png"))
  fuse_base_color(os.path.join(cwd,"Resources/assets/enchanting_table/enchanting_table_top_color.png"),os.path.join(cwd,"Resources/assets/enchanting_table/enchanting_table_top_base.png"),os.path.join(output_directories[1],"enchanting_table_top.png"))
  
  #make horse armor
  fuse_base_color(os.path.join(cwd,"Resources/assets/entities/horse_armor/color/horse_armor_color.png"),os.path.join(cwd,"Resources/assets/entities/horse_armor/base/horse_armor_base.png"),os.path.join(output_directories[0],"diamond_horse_armor.png"))
  fuse_base_color(os.path.join(cwd,"Resources/assets/entities/horse_armor/color/horse_armor_diamond_color.png"),os.path.join(cwd,"Resources/assets/entities/horse_armor/base/horse_armor_diamond_base.png"),os.path.join(output_directories[3],"horse_armor_diamond.png"))
  
  #make villager badge
  add_color(os.path.join(cwd,"Resources/assets/entities/villager_diamond.png"),os.path.join(output_directories[5],"diamond.png"))
  
  #copy appropriate files to preview and pack.png
  copyfile(os.path.join(output_directories[0],"diamond.png"),os.path.join(cwd,"preview.png"))
  copyfile(os.path.join(output_directories[1],"diamond_ore.png"),os.path.join(cwd,packname,"pack.png"))
  
def create_armor():
  #helmet
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"helmet.png"),os.path.join(output_directories[0],"diamond_helmet.png"))
  #chestplate
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"chestplate.png"),os.path.join(output_directories[0],"diamond_chestplate.png"))
  #leggings
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"leggings.png"),os.path.join(output_directories[0],"diamond_leggings.png"))
  #boots
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"boots.png"),os.path.join(output_directories[0],"diamond_boots.png"))
  #models
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"layer_1.png"),os.path.join(output_directories[2],"diamond_layer_1.png"))
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"layer_2.png"),os.path.join(output_directories[2],"diamond_layer_2.png"))
  add_color(os.path.join(cwd,"Resources/assets/armors",resources[3][properties[6]],"piglin_helmet.png"),os.path.join(output_directories[2],"diamond_piglin_helmet.png"))
  
def create_tools():
  #axe
  fuse_base_color(os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"color/axe.png"),os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"base/axe.png"),os.path.join(output_directories[0],"diamond_axe.png"))
  #hoe
  fuse_base_color(os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"color/hoe.png"),os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"base/hoe.png"),os.path.join(output_directories[0],"diamond_hoe.png"))
  #pickaxe
  fuse_base_color(os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"color/pickaxe.png"),os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"base/pickaxe.png"),os.path.join(output_directories[0],"diamond_pickaxe.png"))
  #shovel
  fuse_base_color(os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"color/shovel.png"),os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"base/shovel.png"),os.path.join(output_directories[0],"diamond_shovel.png"))
  #sword
  fuse_base_color(os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"color/sword.png"),os.path.join(cwd,"Resources/assets/tools",resources[4][properties[7]],"base/sword.png"),os.path.join(output_directories[0],"diamond_sword.png"))
  
def change_lang(inpath,string1,string2,outpath):
  textfile=open(inpath,"r").read()
  newtext=textfile.replace("#cap",string2)
  newtext=newtext.replace("#uncap",string1)
  newtext=newtext.replace("#itemname",string2)

  if os.path.exists(outpath):
    os.remove(outpath)
  fil = open(outpath, "w") 
  fil.write(newtext) 
  fil.close()

def create_infofile():
  currsettings=open(os.path.join(cwd,packname,"info.txt"),"w")
  currsettings.write("Color: ["+str(properties[0]-60)+","+str(properties[1]-60)+","+str(properties[2]-60)+"]"+"\n")
  currsettings.write("Gem type: "+resources[0][properties[3]]+" ("+str(properties[3])+")\n")
  currsettings.write("Ore type: "+resources[1][properties[4]]+" ("+str(properties[4])+")\n")
  currsettings.write("Block type: "+resources[2][properties[5]]+" ("+str(properties[5])+")\n")
  currsettings.write("Armor type: "+resources[3][properties[6]]+" ("+str(properties[6])+")\n")
  currsettings.write("Tool type: "+resources[4][properties[7]]+" ("+str(properties[7])+")\n")
  currsettings.write("Name: "+finalname[1]+"\n")
  currsettings.write("Arguments: {"+str(properties[0]-60)+" "+str(properties[1]-60)+" "+str(properties[2]-60)+" "+str(properties[3])+" "+str(properties[4])+" "+str(properties[5])+" "+str(properties[6])+" "+str(properties[7])+" "+str(finalname[1])+"}"+"\n")
  currsettings.close()

def recurseAllOptions(dir,prefix=""):
    options=[prefix + ("/" if not prefix=="" else "") + x for x in os.listdir(dir) if x!=".DS_Store"]
    toReplace=[]
    for i in range(len(options)):
        if(os.path.isdir(os.path.join(dir,options[i]))):
            toReplace.append(options[i])
    for i in range(len(toReplace)):
        index = options.index(toReplace[i])
        newOptions=recurseAllOptions(os.path.join(dir,toReplace[i]),prefix+("/" if not prefix=="" else "")+toReplace[i])
        options.remove(toReplace[i])
        for j in range(len(newOptions)):
            options.insert(index+j,newOptions[j])
    return options

## actual code

#set cwd to the folder where this file is
os.chdir(__file__.rsplit("\\",1)[0] if len(__file__.rsplit("\\",1))>1 else os.getcwd())
cwd=os.getcwd()

#names to reference in pack creation
packname="randomized_pack"
output_directories=[
  os.path.join(cwd,packname,"assets/minecraft/textures/item/"),
  os.path.join(cwd,packname,"assets/minecraft/textures/block/"),
  os.path.join(cwd,packname,"assets/minecraft/textures/models/armor/"),
  os.path.join(cwd,packname,"assets/minecraft/textures/entity/horse/armor/"),
  os.path.join(cwd,packname,"assets/minecraft/lang/"),
  os.path.join(cwd,packname,"assets/minecraft/textures/entity/villager/profession_level/")
]

#initialize the directories and copy in the pack.mcmeta
makepaths(output_directories)
copyfile(os.path.join(cwd,"Resources/pack.mcmeta"),os.path.join(cwd,packname,"pack.mcmeta"))

#(recursively) get all options for the various textures
#order: gems, ores, ore bases, blocks, armors, toolsets
resources=[
    recurseAllOptions(os.path.join(cwd,"Resources/assets/gems")),
    recurseAllOptions(os.path.join(cwd,"Resources/assets/ores/color")),
    recurseAllOptions(os.path.join(cwd,"Resources/assets/blocks")),
    [x for x in os.listdir(os.path.join(cwd,"Resources/assets/armors")) if x!=".DS_Store"],
    [x for x in os.listdir(os.path.join(cwd,"Resources/assets/tools")) if x!=".DS_Store"]
]


#create material properties & name
properties=[0,0,0,0,0,0,0,0]
finalname=["",""]
create_properties()
create_name()
change_lang(os.path.join(cwd,"Resources/en_ca_mod.lang.txt"),finalname[0],finalname[1],os.path.join(cwd,output_directories[4],"en_sadcan.json"))

#create the actual textures
create_generics()
create_armor()
create_tools()

#make info.txt and zip the pack
create_infofile()
shutil.make_archive("resources","zip",packname)




#initdata()

#makefnsdata()

#change_ore_data()