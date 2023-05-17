#effect give @a[tag=hasBoots] speed 1 0 true
execute as @a[tag=!hasBoots] run attribute @s minecraft:generic.movement_speed modifier remove B0015-0-0-0-1
execute as @a[tag=hasBoots] run attribute @s minecraft:generic.movement_speed modifier add B0015-0-0-0-1 boots_def 0.2 multiply_base

#effect give @a[tag=hasBoots,scores={sprinted=700..}] speed 1 1 true
execute as @a unless entity @s[tag=hasBoots,scores={sprinted=700..}] run attribute @s minecraft:generic.movement_speed modifier remove B0015-0-0-0-2
execute as @a[tag=hasBoots,scores={sprinted=700..}] run attribute @s minecraft:generic.movement_speed modifier add B0015-0-0-0-2 boots_fast 0.3 multiply_base