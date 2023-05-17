summon armor_stand ^ ^ ^1 {Tags:[Stand1,ray],Invisible:1b,Marker:1b}
summon armor_stand ^ ^ ^2 {Tags:[Stand2,ray],Invisible:1b,Marker:1b}
summon armor_stand ^ ^ ^3 {Tags:[Stand3,ray],Invisible:1b,Marker:1b}
summon armor_stand ^ ^ ^4 {Tags:[Stand4,ray],Invisible:1b,Marker:1b}
summon armor_stand ^ ^ ^5 {Tags:[Stand5,ray],Invisible:1b,Marker:1b}
#say @e[tag=ray]
execute as @e[tag=ray] at @s if block ~ ~ ~ air run tag @s add empty
execute as @e[tag=ray] at @s if block ~ ~ ~ water run tag @s add empty
execute as @e[tag=ray] at @s if block ~ ~ ~ lava run tag @s add empty
#execute as @e[tag=ray] at @s if block ~ ~ ~ flowing_water run tag @s add empty
#execute as @e[tag=ray] at @s if block ~ ~ ~ flowing_lava run tag @s add empty

execute if entity @e[tag=Stand1,tag=empty] if entity @e[tag=Stand2,tag=empty] if entity @e[tag=Stand3,tag=empty] if entity @e[tag=Stand4,tag=empty] unless entity @e[tag=Stand5,tag=empty] at @e[tag=Stand4] align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Tags:[BrokenBlock],NoGravity:1b}

execute if entity @e[tag=Stand1,tag=empty] if entity @e[tag=Stand2,tag=empty] if entity @e[tag=Stand3,tag=empty] unless entity @e[tag=Stand4,tag=empty] at @e[tag=Stand3] align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Tags:[BrokenBlock],NoGravity:1b}

execute if entity @e[tag=Stand1,tag=empty] if entity @e[tag=Stand2,tag=empty] unless entity @e[tag=Stand3,tag=empty] at @e[tag=Stand2] align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Tags:[BrokenBlock],NoGravity:1b}

execute if entity @e[tag=Stand1,tag=empty] unless entity @e[tag=Stand2,tag=empty] at @e[tag=Stand1] align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Tags:[BrokenBlock],NoGravity:1b}

execute unless entity @e[tag=Stand1,tag=empty] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Tags:[BrokenBlock],NoGravity:1b}

kill @e[tag=ray]