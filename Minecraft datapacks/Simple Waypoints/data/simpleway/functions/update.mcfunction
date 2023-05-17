scoreboard players enable @a savewp
scoreboard players enable @a tpwp
scoreboard players enable @a removewp
scoreboard players enable @a listwp
execute as @e[tag=waypoint] run data modify entity @s Duration set value 9999
execute as @e[tag=waypoint] run data modify entity @s Age set value 1
execute as @a[scores={savewp=1..}] at @s run function simpleway:createwp
execute as @a[scores={tpwp=1..}] at @s run function simpleway:teleportwp
execute as @a[scores={removewp=1..}] at @s run function simpleway:removewp
execute as @a[scores={listwp=1..}] at @s run function simpleway:listwp