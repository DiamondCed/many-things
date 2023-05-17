scoreboard players set dyeRed colorCalc 58
scoreboard players set dyeGreen colorCalc 179
scoreboard players set dyeBlue colorCalc 218

#data modify entity @s Item.tag.display.MapColor set value 3847130
kill @e[type=item,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply