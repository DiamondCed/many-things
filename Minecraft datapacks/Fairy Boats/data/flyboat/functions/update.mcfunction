execute as @e[type=boat,tag=!flying] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust",Count:1b}},distance=..1] run function flyboat:fly

execute as @e[tag=flying,nbt={OnGround:0b}] at @s run particle minecraft:dust 1 1 0.2 0.5 ~ ~-0.1 ~ 0.3 0 0.3 0 20

execute as @e[tag=flying,nbt={OnGround:0b}] at @s run particle minecraft:falling_dust gold_block ~ ~-0.1 ~ 0.3 0 0.3 0 1