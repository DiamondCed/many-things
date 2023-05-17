kill @e[nbt={Item:{id:"minecraft:glass"}},distance=..0.5]
execute at @s unless entity @p[gamemode=creative] run summon item ~ ~ ~ {Item:{id:"minecraft:structure_void",Count:1}}
kill @s