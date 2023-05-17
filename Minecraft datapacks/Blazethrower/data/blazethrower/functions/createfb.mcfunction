#say createfb

summon armor_stand ~ ~ ~ {Tags:["temp_fb"],Marker:1b,Invisible:1b}
tp @e[tag=temp_fb] ~ ~ ~ ~ ~

playsound minecraft:entity.blaze.shoot player @a ~ ~ ~


#random whether 1 x offset left or right
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~-3 ~
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~6 ~
#random whether another x offset left or right from previous x offset (can return to 0)
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~-1.5 ~
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~-0.75 ~
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~1.5 ~

#random whether 1 y offset up or down
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~ ~-3
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~ ~6
#random whether another y offset up or down from previous y offset (can return to 0)
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~ ~-1.5
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~ ~3
execute as @e[tag=temp_fb] at @s run tp @s ~ ~ ~ ~ ~-0.75
execute as @e[tag=temp_fb] at @s if predicate blazethrower:half run tp @s ~ ~ ~ ~ ~1.5

execute rotated as @e[tag=temp_fb] run summon armor_stand ^ ^ ^1 {Tags:["fbStandIn"],Marker:1b,Invisible:1b}

execute store result score #x1 blaze_cooldown run data get entity @e[tag=fbStandIn,limit=1,sort=nearest] Pos[0] 1000
execute store result score #y1 blaze_cooldown run data get entity @e[tag=fbStandIn,limit=1,sort=nearest] Pos[1] 1000
execute store result score #z1 blaze_cooldown run data get entity @e[tag=fbStandIn,limit=1,sort=nearest] Pos[2] 1000

execute store result score #x2 blaze_cooldown run data get entity @s Pos[0] 1000
execute store result score #y2 blaze_cooldown run data get entity @s Pos[1] 1000
execute store result score #z2 blaze_cooldown run data get entity @s Pos[2] 1000

scoreboard players operation #x1 blaze_cooldown -= #x2 blaze_cooldown
scoreboard players operation #y1 blaze_cooldown -= #y2 blaze_cooldown
scoreboard players operation #z1 blaze_cooldown -= #z2 blaze_cooldown

execute unless score @s flying_fb matches 1.. as @e[tag=fbStandIn] at @s run tp @s ~ ~1.4 ~
execute if score @s flying_fb matches 1.. as @e[tag=fbStandIn] at @s run tp @s ~ ~-0.1 ~
execute as @e[tag=fbStandIn] at @s run summon small_fireball ~ ~ ~ {Tags:["newFb","blazeFb"],direction:[0.0,0.0,0.0]}

execute store result entity @e[tag=newFb,limit=1,sort=nearest] Motion[0] double 0.0015 run scoreboard players get #x1 blaze_cooldown
execute store result entity @e[tag=newFb,limit=1,sort=nearest] Motion[1] double 0.0015 run scoreboard players get #y1 blaze_cooldown
execute store result entity @e[tag=newFb,limit=1,sort=nearest] Motion[2] double 0.0015 run scoreboard players get #z1 blaze_cooldown

execute store result entity @e[tag=newFb,limit=1,sort=nearest] power[0] double 0.00003 run scoreboard players get #x1 blaze_cooldown
execute store result entity @e[tag=newFb,limit=1,sort=nearest] power[1] double 0.00003 run scoreboard players get #y1 blaze_cooldown
execute store result entity @e[tag=newFb,limit=1,sort=nearest] power[2] double 0.00003 run scoreboard players get #z1 blaze_cooldown

data modify entity @e[tag=newFb,limit=1,sort=nearest] Owner set from entity @s UUID

tag @e remove newFb
kill @e[tag=temp_fb]
kill @e[tag=fbStandIn]