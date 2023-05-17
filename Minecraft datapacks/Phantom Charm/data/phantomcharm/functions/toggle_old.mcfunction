scoreboard players set @s pcactive 20
execute store result score active pcactive run gamerule doInsomnia
execute if score active pcactive matches 1 run gamerule doInsomnia false
execute if score active pcactive matches 0 run gamerule doInsomnia true

execute if score active pcactive matches 0 run tellraw @a {"text":"The terrors of the dark shall return to the midnight skies.","color":"light_purple"}
execute if score active pcactive matches 1 run tellraw @a {"text":"The night skies shall remain safe ground as of now.","color":"green"}

particle minecraft:smoke ~ ~0.5 ~ 0.2 0.5 0.2 0 50 force
execute if score active pcactive matches 0 run particle minecraft:witch ~ ~0.75 ~ 0.4 0.5 0.4 0 20 force
execute if score active pcactive matches 1 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 20 force

execute if score active pcactive matches 0 run playsound minecraft:entity.evoker.prepare_attack player @s ~ ~ ~ 2 1
execute if score active pcactive matches 1 run playsound minecraft:entity.evoker.prepare_summon player @s ~ ~ ~ 2 1


