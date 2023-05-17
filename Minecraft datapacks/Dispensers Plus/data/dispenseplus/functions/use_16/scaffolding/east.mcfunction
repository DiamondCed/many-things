tp @s ~1 ~ ~
scoreboard players add #count calc 1
execute at @s unless block ~ ~ ~ scaffolding run tag @s add followed
execute if score #count calc matches 7 run tag @s add followed
execute at @s if block ~ ~ ~ scaffolding unless score #count calc matches 7 run function dispenseplus:use/scaffolding/east