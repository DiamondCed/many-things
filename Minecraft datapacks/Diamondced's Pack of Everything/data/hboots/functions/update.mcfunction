scoreboard players add #timer globaltimer 1
scoreboard players operation #mod_timer globaltimer = #timer globaltimer
scoreboard players operation #mod_timer globaltimer %= $loop globaltimer

tag @a remove hasBoots
execute as @a run function hboots:detect_items

execute as @a[nbt={OnGround:1b}] if score @s lastsprinted = @s sprinted run scoreboard players add @s difference 1

execute as @a unless score @s lastsprinted = @s sprinted run scoreboard players set @s difference 0

execute as @a[tag=!hasBoots] run scoreboard players set @s sprinted 0

execute as @a[scores={difference=5..}] run scoreboard players set @s sprinted 0
execute as @a[scores={difference=5..}] run scoreboard players set @s difference 5

execute if score #version_check sprinted matches 0 run function hboots:update_15
execute if score #version_check sprinted matches 1 run function hboots:update_16

execute as @a[tag=hasBoots,scores={sprinted=700..},nbt={OnGround:1b}] at @s if score #mod_timer globaltimer matches 0 run playsound minecraft:hermes_boots player @a ~ ~ ~ 1 1
execute as @a[tag=hasBoots,scores={sprinted=700..},nbt={OnGround:1b}] at @s run particle minecraft:dust 1 1 1 1 ~ ~0.1 ~ 0.1 0 0.1 0 10 force
#particle cloud ~ ~ ~ 0 0 0 0 0 force


execute as @a run scoreboard players operation @s lastsprinted = @s sprinted