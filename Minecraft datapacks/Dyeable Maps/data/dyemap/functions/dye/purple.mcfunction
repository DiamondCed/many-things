scoreboard players set dyeRed colorCalc 137
scoreboard players set dyeGreen colorCalc 50
scoreboard players set dyeBlue colorCalc 184

#data modify entity @s Item.tag.display.MapColor set value 8991416
kill @e[type=item,nbt={Item:{id:"minecraft:purple_dye",Count:1b}},limit=1,sort=nearest]

function dyemap:dye/apply