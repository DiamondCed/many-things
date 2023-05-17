scoreboard players set dyeRed colorCalc 254
scoreboard players set dyeGreen colorCalc 216
scoreboard players set dyeBlue colorCalc 61

#data modify entity @s Item.tag.display.MapColor set value 16701501
kill @e[type=item,nbt={Item:{id:"minecraft:yellow_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply