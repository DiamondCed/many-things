scoreboard players set dyeRed colorCalc 249
scoreboard players set dyeGreen colorCalc 128
scoreboard players set dyeBlue colorCalc 29

#data modify entity @s Item.tag.display.MapColor set value 16351261
kill @e[type=item,nbt={Item:{id:"minecraft:orange_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply