scoreboard players add @s soundtimer 1

effect give @s levitation 1 5 true
particle minecraft:dust 1 1 1 0.75 ^-0.15 ^ ^ 0 0 0 0 5 force
particle minecraft:dust 1 1 1 0.75 ^0.15 ^ ^ 0 0 0 0 5 force
#particle minecraft:flame ^-0.15 ^ ^ 0 0 0 0 5 force
#particle minecraft:flame ^0.15 ^ ^ 0 0 0 0 5 force

gamerule fallDamage false
schedule function rocketboots:enablefall 1.2s replace

scoreboard players operation #temp soundtimer = @s soundtimer
scoreboard players operation #temp soundtimer %= $loop3 soundtimer
#tellraw @s {"score":{"name":"@s","objective":"soundtimer"}}
execute if score #temp soundtimer matches 1 run playsound minecraft:spectre_boots player @s ~ ~ ~ 1 1