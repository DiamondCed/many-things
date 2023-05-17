effect give @s levitation 1 95 true
#particle minecraft:cloud ~ ~ ~ .5 0 .5 0 50 force
scoreboard players set @s blizzardEffect 8

gamerule fallDamage false
schedule function doublejump:enablefall 1.6s replace
tag @s add usedBlizzard

#say blizzard
#global
tag @s add remjump
playsound minecraft:double_jump player @s ~ ~ ~ 1 1