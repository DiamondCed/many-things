scoreboard players set dyeRed colorCalc 128
scoreboard players set dyeGreen colorCalc 199
scoreboard players set dyeBlue colorCalc 31

#data modify entity @s Item.tag.display.MapColor set value 8439583
kill @e[type=item,nbt={Item:{id:"minecraft:lime_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply