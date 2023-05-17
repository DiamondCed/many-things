scoreboard players set dyeRed colorCalc 60
scoreboard players set dyeGreen colorCalc 68
scoreboard players set dyeBlue colorCalc 170

#data modify entity @s Item.tag.display.MapColor set value 3949738
kill @e[type=item,nbt={Item:{id:"minecraft:blue_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply