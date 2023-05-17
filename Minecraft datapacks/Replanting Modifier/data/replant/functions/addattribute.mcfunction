execute unless entity @s[nbt={Item:{tag:{replant:1}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Replanting","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{replant:1}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{replant:1}}}] run data modify entity @s Item.tag.replant set value 1

