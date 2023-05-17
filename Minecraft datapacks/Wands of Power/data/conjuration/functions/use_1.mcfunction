# find the nearest conjured block in front of the player to destroy it
execute unless entity @e[tag=destroyed_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^1 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add destroyed_conjured
execute unless entity @e[tag=destroyed_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^2 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add destroyed_conjured
execute unless entity @e[tag=destroyed_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^3 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add destroyed_conjured
execute unless entity @e[tag=destroyed_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^4 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add destroyed_conjured
execute unless entity @e[tag=destroyed_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add destroyed_conjured

execute at @e[tag=destroyed_conjured] run particle minecraft:dust_color_transition 1 0.25 0.85 1 1 1 0 ~ ~0.5 ~ 0.35 0.35 0.35 0.05 100
execute as @e[tag=destroyed_conjured] at @s run function conjuration:destroy