scoreboard players set dyeRed colorCalc 71
scoreboard players set dyeGreen colorCalc 79
scoreboard players set dyeBlue colorCalc 82

#data modify entity @s Item.tag.display.MapColor set value 4673362
kill @e[type=item,nbt={Item:{id:"minecraft:gray_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply