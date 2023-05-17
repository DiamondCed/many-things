tag @a remove up
tag @a remove down
tag @a remove north
tag @a remove east
tag @a remove west
tag @a remove south

execute as @e[type=item,nbt={Item:{id:"minecraft:wooden_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:stone_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:golden_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:diamond_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute

execute as @a[scores={mined_wooden=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined
execute as @a[scores={mined_stone=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined
execute as @a[scores={mined_gold=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined
execute as @a[scores={mined_iron=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined
execute as @a[scores={mined_diamond=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined

execute if score #version_test calc matches 1 run function 3x3mine:update116

scoreboard players set @a sneaking_tunnel 0
scoreboard players set @a mined_wooden 0
scoreboard players set @a mined_stone 0
scoreboard players set @a mined_gold 0
scoreboard players set @a mined_iron 0
scoreboard players set @a mined_diamond 0