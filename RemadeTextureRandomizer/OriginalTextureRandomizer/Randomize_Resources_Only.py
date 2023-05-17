import random
import colorsys
from PIL import Image, ImageDraw
import os
import subprocess
from shutil import copyfile
import shutil
import sys

dirname = os.path.dirname("main.py")
dn=os.getcwd()
#print(os.path.join(dirname,"outputs/pack/assets/minecraft/textures/items"))
interpath=os.path.join(dirname,"outputs/pack/assets/minecraft")
outputpath=os.path.join(interpath, "textures")

packname="randomized_pack"

to_init=[]

to_init.append(os.path.join(packname,"assets/minecraft/textures/item/"))
to_init.append(os.path.join(packname,"assets/minecraft/textures/block/"))
to_init.append(os.path.join(packname,"assets/minecraft/textures/models/armor/"))
to_init.append(os.path.join(packname,"assets/minecraft/textures/entity/horse/armor/"))
to_init.append(os.path.join(packname,"assets/minecraft/lang/"))
to_init.append(os.path.join(packname,"assets/minecraft/textures/entity/villager/profession_level/"))

itemout=os.path.join(dn,to_init[0])
blocksout=os.path.join(dn,to_init[1])
armorout=os.path.join(dn,to_init[2])
horsearmorout=os.path.join(dn,to_init[3])
langout=os.path.join(dn,to_init[4])
villagerout=os.path.join(dn,to_init[5])



finalname=["",""]
cons=["b","c","d","f","g","h","j","l","m","n","p","q","r","s","t","v","w","x","z","th","qu"]
vowels=["a","e","i","o","u","y"]
endings=["ite","ine","ate","ane","ide","ium","on"]
#,"er","ar"

properties=[0,0,0,0,0,0,0]

#gems
rawgems=os.listdir(os.path.join(dn,"color_textures/gems"))
gems=[]
for i in range(0,len(rawgems)):
	if rawgems[i].endswith(".png"):
		gems.append(rawgems[i])
for i in range(0,len(gems)):
	gems[i]=os.path.join(os.path.join(dn,"color_textures/gems"),gems[i])

#blocks
rawblocks=os.listdir(os.path.join(dn,"color_textures/blocks"))
blocks=[]
for i in range(0,len(rawblocks)):
	if rawblocks[i].endswith(".png"):
		blocks.append(rawblocks[i])
for i in range(0,len(blocks)):
	blocks[i]=os.path.join(os.path.join(dn,"color_textures/blocks"),blocks[i])

#ores
rawores=os.listdir(os.path.join(dn,"color_textures/ores"))
raworebases=os.listdir(os.path.join(dn,"base_textures/ores"))
ores=[]
orebases=[]
#color
for i in range(0,len(rawores)):
	if rawores[i].endswith(".png"):
		ores.append(rawores[i])
for i in range(0,len(ores)):
	ores[i]=os.path.join(os.path.join(dn,"color_textures/ores"),ores[i])
#base
for i in range(0,len(raworebases)):
	if raworebases[i].endswith(".png"):
		orebases.append(raworebases[i])
for i in range(0,len(orebases)):
	orebases[i]=os.path.join(os.path.join(dn,"base_textures/ores"),orebases[i])


armordiamond=["color_textures/armors/diamond/diamond_helmet.png","color_textures/armors/diamond/diamond_chestplate.png","color_textures/armors/diamond/diamond_leggings.png","color_textures/armors/diamond/diamond_boots.png"]
armornether=["color_textures/armors/netherite/netherite_helmet.png","color_textures/armors/netherite/netherite_chestplate.png","color_textures/armors/netherite/netherite_leggings.png","color_textures/armors/netherite/netherite_boots.png"]
armoritemnames=["diamond_helmet.png","diamond_chestplate.png","diamond_leggings.png","diamond_boots.png"]

armorlayerdiamond=["color_textures/armors/diamond/diamond_layer_1.png","color_textures/armors/diamond/diamond_layer_2.png","color_textures/armors/diamond/diamond_piglin_helmet.png"]
armorlayernether=["color_textures/armors/netherite/netherite_layer_1.png","color_textures/armors/netherite/netherite_layer_2.png","color_textures/armors/netherite/netherite_piglin_helmet.png"]
armorlayernames=["diamond_layer_1.png","diamond_layer_2.png","diamond_piglin_helmet.png"]

horsearmor=["color_textures/horse_armor_diamond_color.png","horse_armor_diamond.png","base_textures/horse_armor_diamond_base.png"]

enchant=["color_textures/enchanting_table_side_color.png","color_textures/enchanting_table_top_color.png"]
enchantbase=["base_textures/enchanting_table_side_base.png","base_textures/enchanting_table_top_base.png"]
enchantname=["enchanting_table_side.png","enchanting_table_top.png"]

toolscolor=["color_textures/sword_color.png","color_textures/pickaxe_color.png","color_textures/axe_color.png","color_textures/shovel_color.png","color_textures/hoe_color.png","color_textures/horse_armor_color.png"]
toolsbase= ["base_textures/sword_base.png","base_textures/pickaxe_base.png","base_textures/axe_base.png","base_textures/shovel_base.png","base_textures/hoe_base.png","base_textures/horse_armor_base.png"]
toolsnames=["diamond_sword.png","diamond_pickaxe.png","diamond_axe.png","diamond_shovel.png","diamond_hoe.png","diamond_horse_armor.png"]
villager=["color_textures/villager_diamond.png","diamond.png"]

def init():
  #a=open(os.path.join(itemout,"keepthis.txt"),"r")
  #print(a)
  for path in to_init:
    parts=str(path).split("/")
    currentdir=os.getcwd()
    parts.pop()
    for part in parts:
      if not os.path.exists(part):
        os.makedirs(part)
      currentdir=os.path.join(currentdir,part)
      #print(currentdir)
      os.chdir(currentdir)
    #a=open(os.path.join(currentdir,"keepthis.txt"),"w")
    #a.write("wasd")
    #a.close()
    os.chdir(dn)
    #print(a.name)
  os.chdir(dn)
  copyfile("pack.mcmeta",os.path.join(packname,"pack.mcmeta"))


def create_properties():
  #hsv
  properties[0]=random.randint(0,315)
  properties[1]=random.randint(0,315)
  properties[2]=random.randint(0,315)
  #Gem Type (Gem,Lapis,Emerald,Ingot,Quartz,Ruby,..)
  #If ingot (3), also indicates mining ore drops itself
  properties[3]=random.randint(0,len(gems)-1)
  #Ore Type (Regular,Emerald,Lapis,Dimensional)
  properties[4]=random.randint(0,len(ores)-1)
  #Block Type (Iron,Gold,Diamond,Emerald,Lapis,Redstone,Quartz,RSLamp,..)
  properties[5]=random.randint(0,len(blocks)-1)
  #Armor Model (Diamond/Netherite)
  properties[6]=random.randint(0,1)
  
  
  
  if len(sys.argv)>1:
    if not int(sys.argv[1])==-1:
      properties[0]=int(sys.argv[1])+60
  if len(sys.argv)>2:
    if not int(sys.argv[2])==-1:
      properties[1]=int(sys.argv[2])+60
  if len(sys.argv)>3:
    if not int(sys.argv[3])==-1:
      properties[2]=int(sys.argv[3])+60
  if len(sys.argv)>4:
    if not int(sys.argv[4])==-1:
      properties[3]=int(sys.argv[4])
  if len(sys.argv)>5:
    if not int(sys.argv[5])==-1:
      properties[4]=int(sys.argv[5])
  if len(sys.argv)>6:
    if not int(sys.argv[6])==-1:
      properties[5]=int(sys.argv[6])
  if len(sys.argv)>7:
    if not int(sys.argv[7])==-1:
      properties[6]=int(sys.argv[7])
  print(properties)

def add_color(base,outpath):
  base = os.path.join(dirname, base)
  img = Image.open(base)
  img2 = Image.open(base)
  w,h=img.size
  #print(properties[0]/100)
  #r,g,b=colorsys.hsv_to_rgb(properties[0],1,1)
  #print(str(r),", ",str(g),", ",str(b))
  #r=(int(r*255))
  #g=(int(g*255))
  #b=(int(b*255))
  r=max(properties[0]-60,0)
  g=max(properties[1]-60,0)
  b=max(properties[2]-60,0)
  color=(r,g,b,80)
  #print(str(r),", ",str(g),", ",str(b))
  #print(color)
  #print(img.size)
  imDraw=ImageDraw.Draw(img2)
  imDraw.rectangle([0,0,img.size[0],img.size[1]],color)
  #img2.paste(color, [0,0,img.size[0],img.size[1]])

  background = img
  overlay = img2

  background = background.convert("RGBA")
  overlay = overlay.convert("RGBA")

  new_img = Image.blend(background, overlay, 0.50)
  if os.path.exists("temp.png"):
    os.remove("temp.png")
  new_img.save("temp.png","PNG")
  remove_semitrans("temp.png",outpath)

def remove_semitrans(image,outpath):
  image = os.path.join(dirname, image)
  img = Image.open(image)
  img = img.convert("RGBA")
  datas = img.getdata()

  newData = []
  for item in datas:
    if item[3] == 40:
        newData.append((0, 0, 0, 0))
    else:
        newData.append((item[0],item[1],item[2],255))

  img.putdata(newData)
  #print(newData)
  #outpath = os.path.join(dirname, outpath)
  #print(outpath)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")
  if outpath == os.path.join(itemout,"diamond.png"): 
    if os.path.exists("preview.png"):
      os.remove("preview.png")
    img.save("preview.png", "PNG")
  #os.remove("temp.png")

def alt_add_color(base,outpath):
  base = os.path.join(dirname, base)
  img = Image.open(base)
  img = img.convert("RGBA")
  w,h=img.size
  r=min(properties[0],255)
  g=min(properties[1],255)
  b=min(properties[2],255)
  color=[r,g,b]
  datas = img.getdata()
  newData = []
  for item in datas:
    newData.append((int(r*item[0]/255),int(g*item[1]/255),int(b*item[2]/255),item[3]))
  img.putdata(newData)
  if os.path.exists(outpath):
    os.remove(outpath)
  img.save(outpath, "PNG")
  if outpath == os.path.join(itemout,"diamond.png"): 
    if os.path.exists("preview.png"):
      os.remove("preview.png")
    img.save("preview.png", "PNG")

def fuse_base_color(image1,image2,outpath):
  image1 = os.path.join(dirname, image1)
  image2 = os.path.join(dirname, image2)
  background=Image.open(image2)
  overlay=Image.open(image1)
  datasOver = overlay.getdata()
  datasBg = background.getdata()
  datasOut = []
  for i in range(len(datasOver)):
    if datasOver[i][3]==0:
      datasOut.append(datasBg[i])
    else:
      datasOut.append(datasOver[i])


  overlay.putdata(datasOut)
  #outpath = os.path.join(dirname, outpath)
  if os.path.exists(outpath):
    os.remove(outpath)
  overlay.save(outpath, "PNG")
  if outpath == os.path.join(blocksout,"diamond_ore.png"): 
    if os.path.exists("randomized_pack/pack.png"):
      os.remove("randomized_pack/pack.png")
    overlay.save("randomized_pack/pack.png", "PNG")

def find_name():
  name=""
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+vowels[random.randint(0,len(vowels)-1)]
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+vowels[random.randint(0,len(vowels)-1)]
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+endings[random.randint(0,len(endings)-1)]
  if len(sys.argv)>8:
    name=sys.argv[8]
  finalname[0]=name
  finalname[1]=name.capitalize()
  print(name.capitalize())

def change_lang(text,string1,string2):
  textfile=open(text,"r").read()
  #print(finalname)
  newtext=textfile.replace("#cap",string2)
  newtext=newtext.replace("#uncap",string1)
  if properties[3]==3:
    newtext=newtext.replace("#itemname",string2+" Ingot")
  else:
    newtext=newtext.replace("#itemname",string2)


  outputfile=os.path.join(langout,"en_sadcan.json")


  #filename = "temp.txt"
  #os.path.join(dirname, os.path.join(langout,"en_ca.lang.txt"))
  #print(filename)
  if os.path.exists(outputfile):
    os.remove(outputfile)
  fil = open(outputfile, "w") 
  fil.write(newtext) 
  fil.close()
  #print(outputfile.replace(".lang.txt",".lang"))
  #os.rename(outputfile,outputfile.replace(".lang.txt",".lang"))


def color_items():
  #gem
  add_color(gems[properties[3]],os.path.join(itemout,"diamond.png"))
  #block
  add_color(blocks[properties[5]],os.path.join(blocksout,"diamond_block.png"))
  #ore
  add_color(ores[properties[4]],"temp.png")
  fuse_base_color("temp.png",orebases[properties[4]],os.path.join(blocksout,"diamond_ore.png"))
  #armor
  for i in range(len(armordiamond)):
    if properties[6]==0:
      add_color(armordiamond[i],os.path.join(itemout,armoritemnames[i]))
    if properties[6]==1:
      add_color(armornether[i],os.path.join(itemout,armoritemnames[i]))
  for i in range(len(armorlayerdiamond)):
    if properties[6]==0:
      add_color(armorlayerdiamond[i],os.path.join(armorout,armorlayernames[i]))
    if properties[6]==1:
      add_color(armorlayernether[i],os.path.join(armorout,armorlayernames[i]))
  add_color(horsearmor[0],"temp.png")
  fuse_base_color("temp.png",horsearmor[2],os.path.join(horsearmorout,horsearmor[1]))
  for i in range(2):
    add_color(enchant[i],"temp.png")
    fuse_base_color("temp.png",enchantbase[i],os.path.join(blocksout,enchantname[i]))
  for i in range(len(toolscolor)):
    add_color(toolscolor[i],"temp.png")
    fuse_base_color("temp.png",toolsbase[i],os.path.join(itemout,toolsnames[i]))
  add_color(villager[0],os.path.join(villagerout,villager[1]))

def alt_color_items():
  #gem
  alt_add_color(gems[properties[3]],os.path.join(itemout,"diamond.png"))
  #block
  alt_add_color(blocks[properties[5]],os.path.join(blocksout,"diamond_block.png"))
  #ore
  alt_add_color(ores[properties[4]],"temp.png")
  fuse_base_color("temp.png",orebases[properties[4]],os.path.join(blocksout,"diamond_ore.png"))
  #armor
  for i in range(len(armordiamond)):
    if properties[6]==0:
      alt_add_color(armordiamond[i],os.path.join(itemout,armoritemnames[i]))
    if properties[6]==1:
      alt_add_color(armornether[i],os.path.join(itemout,armoritemnames[i]))
  for i in range(len(armorlayerdiamond)):
    if properties[6]==0:
      alt_add_color(armorlayerdiamond[i],os.path.join(armorout,armorlayernames[i]))
    if properties[6]==1:
      alt_add_color(armorlayernether[i],os.path.join(armorout,armorlayernames[i]))
  alt_add_color(horsearmor[0],"temp.png")
  fuse_base_color("temp.png",horsearmor[2],os.path.join(horsearmorout,horsearmor[1]))
  for i in range(2):
    alt_add_color(enchant[i],"temp.png")
    fuse_base_color("temp.png",enchantbase[i],os.path.join(blocksout,enchantname[i]))
  for i in range(len(toolscolor)):
    alt_add_color(toolscolor[i],"temp.png")
    fuse_base_color("temp.png",toolsbase[i],os.path.join(itemout,toolsnames[i]))
  alt_add_color(villager[0],os.path.join(villagerout,villager[1]))

  

#dataout="randomized_datapack"
#def initdata():
  #if os.path.exists(dataout):
    #shutil.rmtree(dataout)
  #shutil.copytree("basedata",dataout)
  

init()

create_properties()

find_name()

alt_color_items()

change_lang("en_ca_mod.lang.txt",finalname[0],finalname[1])

currsettings=open(os.path.join(packname,"info.txt"),"w")
currsettings.write("Color: ["+str(properties[0]-60)+","+str(properties[1]-60)+","+str(properties[2]-60)+"]"+"\n")
currsettings.write("Gem type: "+os.path.split(gems[int(properties[3])])[-1]+" ("+str(properties[3])+")\n")
currsettings.write("Ore type: "+os.path.split(ores[int(properties[4])])[-1]+" ("+str(properties[4])+")\n")
currsettings.write("Block type: "+os.path.split(blocks[int(properties[5])])[-1]+" ("+str(properties[5])+")\n")
if properties[6]==0:
  currsettings.write("Armor type: Diamond (0)\n")
if properties[6]==1:
  currsettings.write("Armor type: Netherite (1)\n")
currsettings.write("Name: "+finalname[1]+"\n")
currsettings.write("Arguments: {"+str(properties[0]-60)+" "+str(properties[1]-60)+" "+str(properties[2]-60)+" "+str(properties[3])+" "+str(properties[4])+" "+str(properties[5])+" "+str(properties[6])+" "+str(finalname[1])+"}"+"\n")
currsettings.close()

shutil.make_archive("resources","zip",packname)


#initdata()

#makefnsdata()

#change_ore_data()