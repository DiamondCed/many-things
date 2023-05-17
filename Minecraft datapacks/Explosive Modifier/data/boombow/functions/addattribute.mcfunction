execute unless entity @s[nbt={Item:{tag:{boom:1}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Explosive","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{boom:1}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:tnt",Count:8b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{boom:1}}}] run data modify entity @s Item.tag.boom set value 1

