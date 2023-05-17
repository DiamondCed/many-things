#say box1
execute in the_nether run forceload add 0 0
execute in the_nether run summon armor_stand 0 192 0 {Marker:1b,NoGravity:1b,Invisible:1b,Tags:["boxmarker"]}
execute in the_nether run summon armor_stand 0 192 0 {Marker:1b,NoGravity:1b,Invisible:1b,Tags:["boxtp"]}
execute as @e[tag=boxtp] unless entity @s[scores={boxid=1..}] run tag @s add setid
execute as @e[tag=setid] run scoreboard players operation @s boxid = #nextid boxid
scoreboard players operation @s boxpid = #nextid boxid
execute as @e[tag=setid] run scoreboard players add #nextid boxid 1
tag @e remove setid

execute as @e[tag=boxmarker] at @s in the_nether run fill ~ 192 ~ ~15 192 ~15 jigsaw[facing=down]
execute as @e[tag=boxmarker] at @s in the_nether run fill ~ 207 ~ ~15 207 ~15 jigsaw[facing=up]
execute as @e[tag=boxmarker] at @s in the_nether run fill ~ 192 ~ ~ 207 ~15 jigsaw[facing=west]
execute as @e[tag=boxmarker] at @s in the_nether run fill ~15 192 ~ ~15 207 ~15 jigsaw[facing=east]
execute as @e[tag=boxmarker] at @s in the_nether run fill ~ 192 ~ ~15 207 ~ jigsaw[facing=north]
execute as @e[tag=boxmarker] at @s in the_nether run fill ~ 192 ~15 ~15 207 ~15 jigsaw[facing=south]


