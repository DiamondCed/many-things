execute as @e[type=item,nbt={Item:{id:"minecraft:daylight_detector",Count:1b}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},distance=..1] if block ~ ~-1 ~ furnace positioned ~ ~-2 ~ unless entity @e[tag=solarsmelt,distance=..1] run tag @s add createstand

execute as @e[tag=createstand] at @s align xyz positioned ~0.5 ~ ~0.5 run function solarsmelt:create


execute as @e[tag=solarsmelt] at @s unless block ~ ~1 ~ furnace run function solarsmelt:destroy


execute if score #version calc matches 0 run function solarsmelt:update_14
execute if score #version calc matches 1 run function solarsmelt:update_15
execute if score #version calc matches 2 run function solarsmelt:update_17


execute as @a at @s if entity @e[tag=solarsmelt,distance=..7] run clear @s daylight_detector{solarsmelt:1b}

kill @e[type=item,nbt={Item:{tag:{solarsmelt:1b}}}]
