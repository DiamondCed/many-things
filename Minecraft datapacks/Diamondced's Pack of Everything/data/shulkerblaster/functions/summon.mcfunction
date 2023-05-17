execute at @p run playsound entity.shulker.shoot player @p ~ ~ ~ 1 1.5
#stopsound @s player entity.arrow.shoot

summon shulker_bullet ~ ~ ~ {NoGravity:1b,Steps:0,Target:[],Tags:["actualShBullet","currentSh"],Motion:[0.0,0.0,0.0]}
data modify entity @e[tag=currentSh,limit=1,sort=nearest] Owner set from entity @s Owner
scoreboard players set @e[tag=currentSh] life 0 

execute as @e[tag=currentSh] at @p positioned ~ ~1.8 ~ positioned ^ ^ ^1.5 run tp ~ ~ ~

execute store result score #x1 calc run data get entity @e[tag=currentSh,limit=1,sort=nearest] Pos[0] 100
execute store result score #y1 calc run data get entity @e[tag=currentSh,limit=1,sort=nearest] Pos[1] 100
execute store result score #z1 calc run data get entity @e[tag=currentSh,limit=1,sort=nearest] Pos[2] 100

execute store result score #x2 calc run data get entity @p Pos[0] 100
execute store result score #y2 calc run data get entity @p Pos[1] 100
scoreboard players add #y2 calc 180
execute store result score #z2 calc run data get entity @p Pos[2] 100

scoreboard players operation #x1 calc -= #x2 calc
scoreboard players operation #y1 calc -= #y2 calc
scoreboard players operation #z1 calc -= #z2 calc

execute store result entity @e[tag=currentSh,limit=1,sort=nearest] Motion[0] double .01 run scoreboard players get #x1 calc
execute store result entity @e[tag=currentSh,limit=1,sort=nearest] Motion[1] double .01 run scoreboard players get #y1 calc
execute store result entity @e[tag=currentSh,limit=1,sort=nearest] Motion[2] double .01 run scoreboard players get #z1 calc

tag @e remove currentSh