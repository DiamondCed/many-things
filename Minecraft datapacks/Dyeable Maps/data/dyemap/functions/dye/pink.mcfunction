scoreboard players set dyeRed colorCalc 243
scoreboard players set dyeGreen colorCalc 139
scoreboard players set dyeBlue colorCalc 170

#data modify entity @s Item.tag.display.MapColor set value 15961002
kill @e[type=item,nbt={Item:{id:"minecraft:pink_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply