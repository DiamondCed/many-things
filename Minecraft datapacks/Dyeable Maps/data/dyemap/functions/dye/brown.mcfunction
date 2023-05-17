scoreboard players set dyeRed colorCalc 131
scoreboard players set dyeGreen colorCalc 84
scoreboard players set dyeBlue colorCalc 50

#data modify entity @s Item.tag.display.MapColor set value 8606770
kill @e[type=item,nbt={Item:{id:"minecraft:brown_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply