function dispenseplus:find_dispenser_facing

#function dispenseplus:find_slot

#execute if entity @s[tag=slot0] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.0 bucket
#execute if entity @s[tag=slot1] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.1 bucket
#execute if entity @s[tag=slot2] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.2 bucket
#execute if entity @s[tag=slot3] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.3 bucket
#execute if entity @s[tag=slot4] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.4 bucket
#execute if entity @s[tag=slot5] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.5 bucket
#execute if entity @s[tag=slot6] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.6 bucket
#execute if entity @s[tag=slot7] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.7 bucket
#execute if entity @s[tag=slot8] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.8 bucket

#execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.id set value "minecraft:bucket"

execute as @s[tag=up] if block ~ ~1 ~ air run setblock ~ ~1 ~ fire
execute as @s[tag=down] if block ~ ~-1 ~ air run setblock ~ ~-1 ~ fire
execute as @s[tag=north] if block ~ ~ ~-1 air run setblock ~ ~ ~-1 fire
execute as @s[tag=south] if block ~ ~ ~1 air run setblock ~ ~ ~1 fire
execute as @s[tag=west] if block ~-1 ~ ~ air run setblock ~-1 ~ ~ fire
execute as @s[tag=east] if block ~1 ~ ~ air run setblock ~1 ~ ~ fire

kill @e[tag=dispenseplus,limit=1,sort=nearest]

tag @s remove found
tag @s remove slot0
tag @s remove slot1
tag @s remove slot2
tag @s remove slot3
tag @s remove slot4
tag @s remove slot5
tag @s remove slot6
tag @s remove slot7
tag @s remove slot8

tag @s add processed