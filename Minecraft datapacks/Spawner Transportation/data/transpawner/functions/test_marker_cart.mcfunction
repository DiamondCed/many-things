tag @s add current
scoreboard players set #temp calc 0
execute as @e[type=spawner_minecart] run function transpawner:tmc_individual
execute unless entity @s[tag=exists] run function transpawner:from_marker
tag @s remove exists
tag @s remove current