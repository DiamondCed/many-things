import random
import colorsys
from PIL import Image, ImageDraw
import os
import subprocess
from shutil import copyfile
import shutil

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
cons=["b","c","d","f","g","h","j","l","m","n","p","q","r","s","t","v","w","x","z"]
vowels=["a","e","i","o","u","y"]
endings=["ite","ine","ate","ane","ide","ium","on"]
#,"er","ar"

properties=[0,0,0,0,0,0,0,0,0,0,0,0]

gems=["color_textures/gem_0.png","color_textures/gem_1.png","color_textures/gem_2.png","color_textures/gem_3.png","color_textures/gem_4.png","color_textures/gem_5.png","color_textures/gem_6.png"]

rawblocks=os.listdir(os.path.join(dn,"color_textures/blocks"))
blocks=[]
for i in range(0,len(rawblocks)-1):
	if not rawblocks[i]==".DS_STORE":
		blocks.append(rawblocks[i])
for i in range(0,len(blocks)-1):
	blocks[i]=os.path.join(os.path.join(dn,"color_textures/blocks"),blocks[i])
print(blocks)
blocks=["color_textures/block_0.png","color_textures/block_1.png","color_textures/block_2.png","color_textures/block_3.png","color_textures/block_4.png","color_textures/block_5.png","color_textures/block_6.png","color_textures/block_7.png"]

ores=["color_textures/ore_0_color.png","color_textures/ore_1_color.png","color_textures/ore_2_color.png"]
orebases=["base_textures/ore_0_base.png","base_textures/ore_1_base.png","base_textures/ore_2_base.png"]

onlycolor=["color_textures/diamond_helmet.png","color_textures/diamond_chestplate.png","color_textures/diamond_leggings.png","color_textures/diamond_boots.png"]
onlycolornames=["diamond_helmet.png","diamond_chestplate.png","diamond_leggings.png","diamond_boots.png"]

armorlayer=["color_textures/diamond_layer_1.png","color_textures/diamond_layer_2.png"]
armorlayernames=["diamond_layer_1.png","diamond_layer_2.png"]

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
  #Gem Type (Gem,Lapis,Emerald,Ingot,Quartz,Ruby)
  #If ingot (3), also indicates mining ore drops itself
  properties[3]=random.randint(0,6)
  #Ore Type (Regular,Emerald,Lapis)
  properties[4]=random.randint(0,2)
  #Block Type (Iron,Gold,Diamond,Emerald,Lapis,Redstone,Quartz)
  properties[5]=random.randint(0,7)
  #Armor Modifiers (-2,+3)
  temp=random.randint(-2,3)
  properties[6]=[temp//3+3,temp+8,(2*temp)//3+6,temp//3+3]
  #Damage Modifiers (-2,+3) (Sword,Pick,Shovel,Axe)
  temp=random.randint(-2,3)
  properties[7]=[temp+7,temp//2+5,temp//2+5.5,temp+9]
  #Atk Speed Modifiers (-0.5,+0.5) (Sword,Pick,Shovel,Axe)
  temp=random.randint(-5,5)
  temp=temp
  properties[8]=[temp+16,temp+12,temp+10,temp+10]
  #Default pick enchants (fortune 5%,efficiency 10%)
  properties[9]=[random.randint(0,20)//20,random.randint(0,10)//10]
  #Default general enchants (unbreaking 10%,mending 1%)
  properties[10]=[random.randint(0,10)//10,random.randint(0,100)//100]
  #Armor Attributes (kb resist 10%,spd 10%, luck 10%, atk speed 10%)
  properties[11]=[random.randint(0,10)//10,random.randint(0,10)//10,random.randint(0,10)//10,random.randint(0,10)//10]
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
  #os.remove("temp.png")

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

def find_name():
  name=""
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+vowels[random.randint(0,len(vowels)-1)]
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+vowels[random.randint(0,len(vowels)-1)]
  name=name+cons[random.randint(0,len(cons)-1)]
  name=name+endings[random.randint(0,len(endings)-1)]
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


  #filename = "temp.txt"#os.path.join(dirname, os.path.join(langout,"en_ca.lang.txt"))
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
  #helmet
  for i in range(len(onlycolor)):
    add_color(onlycolor[i],os.path.join(itemout,onlycolornames[i]))
  for i in range(2):
    add_color(armorlayer[i],os.path.join(armorout,armorlayernames[i]))
  add_color(horsearmor[0],"temp.png")
  fuse_base_color("temp.png",horsearmor[2],os.path.join(horsearmorout,horsearmor[1]))
  for i in range(2):
    add_color(enchant[i],"temp.png")
    fuse_base_color("temp.png",enchantbase[i],os.path.join(blocksout,enchantname[i]))
  for i in range(len(toolscolor)):
    add_color(toolscolor[i],"temp.png")
    fuse_base_color("temp.png",toolsbase[i],os.path.join(itemout,toolsnames[i]))
  add_color(villager[0],os.path.join(villagerout,villager[1]))

dataout="randomized_datapack"
def initdata():
  if os.path.exists(dataout):
    shutil.rmtree(dataout)
  shutil.copytree("basedata",dataout)
  


def makefnsdata():
  dataout="randomized_datapack/data"
  for i in range(len(properties[8])):
    temp=str(properties[8][i]).split()
    temp=[int(d) for d in temp[0]]
    if len(temp)==1:
      temp.insert(0,"0")
    properties[8][i]=str(temp[0])+"."+str(temp[1])
    
  #hand items
  base_summon='summon item ~ ~ ~ {Tags:["change"],Item:{id:"minecraft:egg",Count:1b}}'
  base_clone="data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item set from entity @s SelectedItem"
  base_tag="data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.tags append value {modified:1}"
  base_enchant=["data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.Enchantments append value {lvl:1s,","}"]
  ench_names=['"minecraft:unbreaking"','"minecraft:mending"','"minecraft:efficiency"','"minecraft:fortune"']
  base_attr=["data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.AttributeModifiers append value {UUIDLeast:1,Operation:0,","}"]
  attr_argnames=["Slot","AttributeName","Amount"]
  attr_slots=["mainhand","head","chest","legs","feet"]
  #attr_amounts=properties[varies]
  attr_names=["generic.attackDamage","generic.knockbackResistance","generic.movementSpeed","generic.armor","generic.attackSpeed","generic.luck"]
  base_clearitem="replaceitem entity @s weapon.mainhand air"

  sword=open(os.path.join(dataout,"random/functions/changesword.mcfunction"),"w")
  sword.write(base_summon+"\n")
  sword.write(base_clone+"\n")
  sword.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    sword.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    sword.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][0])+base_attr[1]
  sword.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][0])+base_attr[1]
  sword.write(line+"\n")
  sword.write(base_clearitem+"\n")
  sword.close()

  pick=open(os.path.join(dataout,"random/functions/changepick.mcfunction"),"w")
  pick.write(base_summon+"\n")
  pick.write(base_clone+"\n")
  pick.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    pick.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    pick.write(line+"\n")
  if properties[9][0]==1:
    line=base_enchant[0]+"id:"+ench_names[2]+base_enchant[1]
    pick.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    pick.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][1])+base_attr[1]
  pick.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][1])+base_attr[1]
  pick.write(line+"\n")
  pick.write(base_clearitem+"\n")
  pick.close()

  shovel=open(os.path.join(dataout,"random/functions/changeshovel.mcfunction"),"w")
  shovel.write(base_summon+"\n")
  shovel.write(base_clone+"\n")
  shovel.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    shovel.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    shovel.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    shovel.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][2])+base_attr[1]
  shovel.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][2])+base_attr[1]
  shovel.write(line+"\n")
  shovel.write(base_clearitem+"\n")
  shovel.close()

  axe=open(os.path.join(dataout,"random/functions/changeaxe.mcfunction"),"w")
  axe.write(base_summon+"\n")
  axe.write(base_clone+"\n")
  axe.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    axe.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    axe.write(line+"\n")
  if properties[9][0]==1:
    line=base_enchant[0]+"id:"+ench_names[2]+base_enchant[1]
    axe.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    axe.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][3])+base_attr[1]
  axe.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][3])+base_attr[1]
  axe.write(line+"\n")
  axe.write(base_clearitem+"\n")
  axe.close()

  hoe=open(os.path.join(dataout,"random/functions/changehoe.mcfunction"),"w")
  hoe.write(base_summon+"\n")
  hoe.write(base_clone+"\n")
  hoe.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    hoe.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    hoe.write(line+"\n")
  hoe.write(base_clearitem+"\n")
  hoe.close()

  hat=open(os.path.join(dataout,"random/functions/changehelmet.mcfunction"),"w")
  hat.write(base_summon+"\n")
  hat.write(base_clone+"\n")
  hat.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    hat.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    hat.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    hat.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][0])+base_attr[1]
  hat.write(line+"\n")
  hat.write(base_clearitem+"\n")
  hat.close()

  chest=open(os.path.join(dataout,"random/functions/changechestplate.mcfunction"),"w")
  chest.write(base_summon+"\n")
  chest.write(base_clone+"\n")
  chest.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    chest.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    chest.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    chest.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][1])+base_attr[1]
  chest.write(line+"\n")
  chest.write(base_clearitem+"\n")
  chest.close()

  legs=open(os.path.join(dataout,"random/functions/changeleggings.mcfunction"),"w")
  legs.write(base_summon+"\n")
  legs.write(base_clone+"\n")
  legs.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    legs.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    legs.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    legs.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][2])+base_attr[1]
  legs.write(line+"\n")
  legs.write(base_clearitem+"\n")
  legs.close()

  boots=open(os.path.join(dataout,"random/functions/changeboots.mcfunction"),"w")
  boots.write(base_summon+"\n")
  boots.write(base_clone+"\n")
  boots.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    boots.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    boots.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    boots.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][3])+base_attr[1]
  boots.write(line+"\n")
  boots.write(base_clearitem+"\n")
  boots.close()

  #floor items
  base_tag="data modify entity @s Item.tag.tags append value {modified:1}"
  base_enchant=["data modify entity @s Item.tag.Enchantments append value {lvl:1s,","}"]
  ench_names=['"minecraft:unbreaking"','"minecraft:mending"','"minecraft:efficiency"','"minecraft:fortune"']
  base_attr=["data modify entity @s Item.tag.AttributeModifiers append value {UUIDLeast:1,Operation:0,","}"]
  attr_argnames=["Slot","AttributeName","Amount"]
  attr_slots=["mainhand","head","chest","legs","feet"]
  #attr_amounts=properties[varies]
  attr_names=["generic.attackDamage","generic.knockbackResistance","generic.movementSpeed","generic.armor","generic.attackSpeed","generic.luck"]

  sword=open(os.path.join(dataout,"random/functions/itemsword.mcfunction"),"w")
  sword.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    sword.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    sword.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][0])+base_attr[1]
  sword.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][0])+base_attr[1]
  sword.write(line+"\n")
  sword.close()

  pick=open(os.path.join(dataout,"random/functions/itempick.mcfunction"),"w")
  pick.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    pick.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    pick.write(line+"\n")
  if properties[9][0]==1:
    line=base_enchant[0]+"id:"+ench_names[2]+base_enchant[1]
    pick.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    pick.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][1])+base_attr[1]
  pick.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][1])+base_attr[1]
  pick.write(line+"\n")
  pick.close()

  shovel=open(os.path.join(dataout,"random/functions/itemshovel.mcfunction"),"w")
  shovel.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    shovel.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    shovel.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    shovel.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][2])+base_attr[1]
  shovel.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][2])+base_attr[1]
  shovel.write(line+"\n")
  shovel.close()

  axe=open(os.path.join(dataout,"random/functions/itemaxe.mcfunction"),"w")
  axe.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    axe.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    axe.write(line+"\n")
  if properties[9][0]==1:
    line=base_enchant[0]+"id:"+ench_names[2]+base_enchant[1]
    axe.write(line+"\n")
  if properties[9][1]==1:
    line=base_enchant[0]+"id:"+ench_names[3]+base_enchant[1]
    axe.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[0]+","+attr_argnames[2]+":"+str(properties[7][3])+base_attr[1]
  axe.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[0]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(properties[8][3])+base_attr[1]
  axe.write(line+"\n")
  axe.close()

  hoe=open(os.path.join(dataout,"random/functions/itemhoe.mcfunction"),"w")
  hoe.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    hoe.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    hoe.write(line+"\n")
  hoe.close()

  hat=open(os.path.join(dataout,"random/functions/itemhelmet.mcfunction"),"w")
  hat.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    hat.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    hat.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    hat.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    hat.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[1]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][0])+base_attr[1]
  hat.write(line+"\n")
  hat.close()

  chest=open(os.path.join(dataout,"random/functions/itemchestplate.mcfunction"),"w")
  chest.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    chest.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    chest.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    chest.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    chest.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[2]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][1])+base_attr[1]
  chest.write(line+"\n")
  chest.close()

  legs=open(os.path.join(dataout,"random/functions/itemleggings.mcfunction"),"w")
  legs.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    legs.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    legs.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    legs.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    legs.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[3]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][2])+base_attr[1]
  legs.write(line+"\n")
  legs.close()

  boots=open(os.path.join(dataout,"random/functions/itemboots.mcfunction"),"w")
  boots.write(base_tag+"\n")
  if properties[10][0]==1:
    line=base_enchant[0]+"id:"+ench_names[0]+base_enchant[1]
    boots.write(line+"\n")
  if properties[10][1]==1:
    line=base_enchant[0]+"id:"+ench_names[1]+base_enchant[1]
    boots.write(line+"\n")
  if properties[11][0]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[1]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][1]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[2]+","+attr_argnames[2]+":"+str(0.005)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][2]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[5]+","+attr_argnames[2]+":"+str(1)+base_attr[1]
    boots.write(line+"\n")
  if properties[11][3]==1:
    line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[4]+","+attr_argnames[2]+":"+str(0.125)+base_attr[1]
    boots.write(line+"\n")
  line=base_attr[0]+"UUIDMost:"+str(random.randint(0,100000))+","+attr_argnames[0]+":"+attr_slots[4]+","+attr_argnames[1]+":"+attr_names[3]+","+attr_argnames[2]+":"+str(properties[6][3])+base_attr[1]
  boots.write(line+"\n")
  boots.close()


def change_ore_data():
  dataout=os.path.join("randomized_datapack","data")
  if properties[3]==3:
    copyfile("ore_tables/drop_ore.json",os.path.join(dataout,"minecraft/loot_tables/blocks/diamond_ore.json"))
  else:
    copyfile("ore_tables/drop_gem.json",os.path.join(dataout,"minecraft/loot_tables/blocks/diamond_ore.json"))


init()

create_properties()

find_name()

color_items()

change_lang("en_ca_mod.lang.txt",finalname[0],finalname[1])

shutil.make_archive("resources","zip",packname)

initdata()

makefnsdata()

change_ore_data()