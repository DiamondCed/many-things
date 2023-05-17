execute unless entity @s[nbt={Item:{tag:{landok:1b}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Safe Landing","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{landok:1b}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{landok:1b}}}] run data modify entity @s Item.tag.landok set value 1b

