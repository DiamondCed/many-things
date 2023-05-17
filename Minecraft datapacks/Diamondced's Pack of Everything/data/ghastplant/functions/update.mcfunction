execute as @e[tag=ghastPlant,tag=!init] at @s if block ~ ~ ~ soul_sand run function ghastplant:plant
execute as @e[tag=ghastPlant] at @s unless block ~ ~1 ~ structure_void run function ghastplant:uproot
execute as @e[tag=ghastPlant] at @s unless block ~ ~ ~ soul_sand run function ghastplant:uproot

# old rng method
#execute as @e[tag=ghastPlant,scores={delay=0}] run function ghastplant:age
#execute store result score #temp delay run gamerule randomTickSpeed
##execute unless score #temp delay matches 0 run scoreboard players remove @e[tag=ghastPlant,scores={delay=1..}] delay 1
#execute as @e[tag=ghastPlant,scores={delay=1..}] at @s if entity @a[distance=..128] run scoreboard players operation @s delay -= #temp delay
#scoreboard players set @e[scores={delay=..0}] delay 0 

# new rng method
execute as @e[tag=ghastPlant] store result score @s calc run gamerule randomTickSpeed
execute as @e[tag=ghastPlant] at @s unless score @s calc matches ..0 if entity @a[distance=..128] run function ghastplant:testgrow

#execute as @e[tag=ghastPlant] run scoreboard players operation @s age = @s subage
#execute as @e[tag=ghastPlant] run scoreboard players operation @s age /= $inc age
scoreboard players set @e[tag=ghastPlant,scores={age=5..}] age 4