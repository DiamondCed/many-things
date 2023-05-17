execute as @e[tag=checknext,nbt={Age:3}] at @s run function noblueskulls:check

scoreboard players add @e[type=wither_skull,scores={skullage=..4}] skullage 1
execute as @e[type=wither_skull] unless entity @s[scores={skullage=0..}] run scoreboard players set @s skullage 0

tag @e[tag=tocheck,scores={skullage=3..}] add checked
tag @e remove tocheck
tag @e[type=wither_skull,tag=!checked] add tocheck


execute as @e[tag=tocheck,scores={skullage=0}] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["checknext"],Duration:4}
