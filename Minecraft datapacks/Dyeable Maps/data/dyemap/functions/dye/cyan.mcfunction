scoreboard players set dyeRed colorCalc 22
scoreboard players set dyeGreen colorCalc 156
scoreboard players set dyeBlue colorCalc 156

#data modify entity @s Item.tag.display.MapColor set value 1481884
kill @e[type=item,nbt={Item:{id:"minecraft:cyan_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply