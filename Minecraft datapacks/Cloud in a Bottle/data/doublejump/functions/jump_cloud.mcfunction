effect give @s levitation 1 80 true
particle minecraft:cloud ~ ~ ~ .5 0 .5 0 50 force

gamerule fallDamage false
schedule function doublejump:enablefall 1.5s replace
tag @s add usedCloud

#say cloud
#global
tag @s add remjump
playsound minecraft:double_jump player @s ~ ~ ~ 1 1