#say hi
tag @s add targetplayer
scoreboard players set #existstest tempmirror -1
scoreboard players set #posx tempmirror 0
scoreboard players set #posy tempmirror 0
scoreboard players set #posz tempmirror 0
execute store success score #existstest tempmirror run data get entity @s SpawnX
execute if score #existstest tempmirror matches 1 store result score #posx tempmirror run data get entity @s SpawnX
execute if score #existstest tempmirror matches 1 store result score #posy tempmirror run data get entity @s SpawnY
execute if score #existstest tempmirror matches 1 store result score #posz tempmirror run data get entity @s SpawnZ
summon armor_stand ~ ~ ~ {Tags:["spawntp"],Invisible:1b,Marker:1b}
data modify entity @e[limit=1,tag=spawntp] Rotation set from entity @s Rotation
execute as @e[tag=spawntp] at @s run function magmir:tpplayer
#execute at @s in overworld run tp ~ ~ ~

