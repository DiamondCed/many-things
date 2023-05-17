execute unless entity @s[nbt={Item:{tag:{unvoid:1}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Un-voidable","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{unvoid:1}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{unvoid:1}}}] run data modify entity @s Item.tag.unvoid set value 1

