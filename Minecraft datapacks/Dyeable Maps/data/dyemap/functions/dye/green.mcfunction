scoreboard players set dyeRed colorCalc 94
scoreboard players set dyeGreen colorCalc 124
scoreboard players set dyeBlue colorCalc 22

#data modify entity @s Item.tag.display.MapColor set value 6192150
kill @e[type=item,nbt={Item:{id:"minecraft:green_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply