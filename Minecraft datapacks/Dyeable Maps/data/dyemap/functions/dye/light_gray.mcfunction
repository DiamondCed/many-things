scoreboard players set dyeRed colorCalc 157
scoreboard players set dyeGreen colorCalc 157
scoreboard players set dyeBlue colorCalc 151

#data modify entity @s Item.tag.display.MapColor set value 10329495
kill @e[type=item,nbt={Item:{id:"minecraft:light_gray_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply