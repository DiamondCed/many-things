tag @s add attacker
summon area_effect_cloud ^ ^ ^1 {Tags:[Stand1,ray]}
summon area_effect_cloud ^ ^ ^2 {Tags:[Stand2,ray]}
summon area_effect_cloud ^ ^ ^3 {Tags:[Stand3,ray]}
summon area_effect_cloud ^ ^ ^4 {Tags:[Stand4,ray]}
summon area_effect_cloud ^ ^ ^5 {Tags:[Stand5,ray]}

execute as @e[tag=Stand1] at @s as @e[distance=..2,tag=!attacker] unless entity @s[nbt={HurtTime:0s}] run tag @s add foundTarget

execute as @e[tag=Stand2] unless entity @e[tag=foundTarget] at @s as @e[distance=..2,tag=!attacker] unless entity @s[nbt={HurtTime:0s}] run tag @s add foundTarget

execute as @e[tag=Stand3] unless entity @e[tag=foundTarget] at @s as @e[distance=..2,tag=!attacker] unless entity @s[nbt={HurtTime:0s}] run tag @s add foundTarget

execute as @e[tag=Stand4] unless entity @e[tag=foundTarget] at @s as @e[distance=..2,tag=!attacker] unless entity @s[nbt={HurtTime:0s}] run tag @s add foundTarget

execute as @e[tag=Stand5] unless entity @e[tag=foundTarget] at @s as @e[distance=..2,tag=!attacker] unless entity @s[nbt={HurtTime:0s}] run tag @s add foundTarget

effect give @e[tag=foundTarget] poison 7 0

tag @e remove foundTarget

#execute as @e[tag=ray] at @s run particle barrier ~ ~ ~ 0 0 0 0 0 force
kill @e[tag=ray]
tag @s remove attacker