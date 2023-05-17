effect give @s levitation 1 110 true
#particle minecraft:cloud ~ ~ ~ .5 0 .5 0 50 force
scoreboard players set @s sandstormEffect 10

gamerule fallDamage false
schedule function doublejump:enablefall 1.7s replace
tag @s add usedSandstorm

#say sandstorm
#global
tag @s add remjump
playsound minecraft:double_jump player @s ~ ~ ~ 1 1