tag @s add init
data modify entity @s Marker set value 1b
execute if block ~ ~1 ~ air run setblock ~ ~1 ~ structure_void
execute if block ~ ~1 ~ cave_air run setblock ~ ~1 ~ structure_void
scoreboard players set @s age -1
scoreboard players set @s delay 0
data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:200}}
tag @s add temp
execute if entity @e[tag=ghastPlant,tag=!temp,distance=..0.5] run function ghastplant:uproot
tag @s remove temp
execute if entity @s run playsound item.crop.plant block @a