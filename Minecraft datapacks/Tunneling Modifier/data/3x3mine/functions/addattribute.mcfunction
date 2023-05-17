execute unless entity @s[nbt={Item:{tag:{multiBreak:1}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Tunneling","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{multiBreak:1}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{multiBreak:1}}}] run data modify entity @s Item.tag.multiBreak set value 1

