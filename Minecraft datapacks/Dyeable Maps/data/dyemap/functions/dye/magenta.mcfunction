scoreboard players set dyeRed colorCalc 199
scoreboard players set dyeGreen colorCalc 78
scoreboard players set dyeBlue colorCalc 189

#data modify entity @s Item.tag.display.MapColor set value 13061821
kill @e[type=item,nbt={Item:{id:"minecraft:magenta_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply