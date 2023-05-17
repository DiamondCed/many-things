#scoreboard players add @s subage 1
scoreboard players add @s age 1


#function ghastplant:rng
#scoreboard players operation @s delay = $RNG RNG_ghast
#execute store result score #temp delay run gamerule randomTickSpeed
#scoreboard players set #temp2 delay 3
#scoreboard players operation @s delay *= #avg delay
#scoreboard players operation @s delay *= #2 RNG_ghast
#scoreboard players operation @s delay /= #10000 RNG_ghast
#scoreboard players operation @s delay *= #temp2 delay
##scoreboard players operation @s delay /= #temp delay


execute if entity @s[scores={age=1}] run data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:201}}
execute if entity @s[scores={age=2}] run data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:202}}
execute if entity @s[scores={age=3}] run data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:203}}
execute if entity @s[scores={age=4}] run data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:204}}

#execute if score $RNG RNG_ghast matches ..7500 run scoreboard players add @s subage 0
#execute if score $RNG RNG_ghast matches 7500..8000 run scoreboard players add @s subage 1
#execute if score $RNG RNG_ghast matches 8000..9500 run scoreboard players add @s subage 4
#execute if score $RNG RNG_ghast matches 9500.. run scoreboard players add @s subage 8