scoreboard players set dyeRed colorCalc 176
scoreboard players set dyeGreen colorCalc 46
scoreboard players set dyeBlue colorCalc 38

#data modify entity @s Item.tag.display.MapColor set value 11546150
kill @e[type=item,nbt={Item:{id:"minecraft:red_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply