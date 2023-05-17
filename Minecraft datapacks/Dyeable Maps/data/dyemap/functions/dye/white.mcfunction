scoreboard players set dyeRed colorCalc 249
scoreboard players set dyeGreen colorCalc 255
scoreboard players set dyeBlue colorCalc 254

#data modify entity @s Item.tag.display.MapColor set value 16383998
kill @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply