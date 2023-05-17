#say tpstand
#tellraw @a {"nbt":"Tags","entity":"@s"}
execute store result entity @s Pos[0] double 1 run scoreboard players get #posx tempmirror
execute store result entity @s Pos[1] double 1 run scoreboard players get #posy tempmirror
execute store result entity @s Pos[2] double 1 run scoreboard players get #posz tempmirror
execute if score #existstest tempmirror matches 1 as @s at @s in overworld run tp ~0.5 ~1 ~0.5
execute unless entity @s[tag=spawntp2] run execute store result score #forceloadCheck tempmirror at @s in overworld run forceload query ~ ~ 
#tellraw @a {"score":{"objective":"tempmirror","name":"#forceloadCheck"}}
execute unless entity @s[tag=spawntp2] run execute as @e[tag=spawntp] at @s run forceload add ~ ~
execute unless entity @s[tag=spawntp2] run execute at @s in overworld run summon armor_stand ~ ~ ~ {Tags:["spawntp2"],Invisible:1b,Marker:1b}
execute unless entity @s[tag=spawntp2] run execute at @s in overworld run data modify entity @e[limit=1,tag=spawntp2] Rotation set from entity @s Rotation
#execute at @s in overworld run tellraw @a {"nbt":"Tags","entity":"@e[type=armor_stand,distance=..10]"} 
execute unless entity @s[tag=spawntp2] run schedule function magmir:postschedule 1t
#execute unless entity @s[tag=spawntp2] run execute as @e[tag=spawntp2] run function magmir:tpplayer
#tellraw @a {"nbt":"Tags","entity":"@s"}
execute if entity @s[tag=spawntp2] run execute if score #existstest tempmirror matches 1 at @s in overworld run tp @a[tag=targetplayer] @s
execute if entity @s[tag=spawntp2] run execute as @a[tag=targetplayer] at @s run function magmir:particles
execute if entity @s[tag=spawntp2] run effect give @a[tag=targetplayer] slow_falling 1 0 true
execute if entity @s[tag=spawntp2] run tag @a remove targetplayer
execute if entity @s[tag=spawntp2] run execute if score #forceloadCheck tempmirror matches 0 run forceload remove ~ ~
kill @s