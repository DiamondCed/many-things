scoreboard players set dyeRed colorCalc 29
scoreboard players set dyeGreen colorCalc 29
scoreboard players set dyeBlue colorCalc 33

#data modify entity @s Item.tag.display.MapColor set value 1908001
kill @e[type=item,nbt={Item:{id:"minecraft:black_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply