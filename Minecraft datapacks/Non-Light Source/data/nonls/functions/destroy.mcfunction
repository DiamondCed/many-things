tag @e[type=item,nbt={Item:{id:"minecraft:blue_stained_glass"}},limit=1,sort=nearest,distance=..2] add silktouched

data modify entity @e[type=item,nbt={Item:{id:"minecraft:blue_stained_glass"}},limit=1,sort=nearest,distance=..2] Item.id set value "minecraft:glowstone"

execute unless entity @e[tag=silktouched,distance=..2] run loot spawn ~ ~2 ~ loot minecraft:blocks/glowstone

summon item ~ ~2 ~ {Item:{id:"minecraft:lapis_lazuli",Count:1b}}

tag @e remove silktouched

kill @s