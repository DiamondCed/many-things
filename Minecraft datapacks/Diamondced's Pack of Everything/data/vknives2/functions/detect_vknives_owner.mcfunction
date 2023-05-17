data modify storage vknives2 temp set from storage vknives2 compare
execute store success score #temp knifelife run data modify storage vknives2 compare set from entity @s Owner
execute unless score #temp knifelife matches 1 run tag @s add vknife2

execute as @s[type=arrow,tag=vknife2] run data modify entity @s damage set value 0.4d
execute as @s[type=arrow,tag=vknife2] run data modify entity @s SoundEvent set value "minecraft:entity.cod.ambient"
execute as @s[type=arrow,tag=vknife2] run data modify entity @s pickup set value 0