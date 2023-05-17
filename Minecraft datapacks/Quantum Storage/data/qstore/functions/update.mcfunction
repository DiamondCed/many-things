#initialize qstorage units
execute as @e[tag=qstore,tag=init] at @s run function qstore:init

#attempt to show an item stack if the barrel isn't full
execute as @e[tag=qstore] at @s unless data block ~ ~ ~ Items[26] run function qstore:attempt_show

#attempt to store an item stack if the stack size matches, or sets the target stack size if missing
execute as @e[tag=qstore] at @s if block ~ ~ ~ barrel{Items:[{Slot:0b}]} run function qstore:attempt_store

#destroy qstorage unit when barrel is removed
execute as @e[tag=qstore] at @s unless block ~ ~ ~ barrel run function qstore:destroy

#quantum storage ambient
execute as @e[tag=qstore,tag=!init_stack] at @s if predicate qstore:random_particle run particle minecraft:dust_color_transition 0 1 1 1 1 1 1 ~ ~1 ~ 0.09 0.02 0.09 0 1 normal @a

#crafting qstorage item
execute as @e[type=item,nbt={Item:{id:"minecraft:beacon",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:iron_block",Count:4b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",Count:2b}},distance=..1] run function qstore:craft