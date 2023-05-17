# get point one block away from entity away from player
execute at @e[tag=user] positioned ~ ~1 ~ facing entity @s feet positioned as @s run summon armor_stand ^ ^ ^1 {Marker:1b,Invisible:1b,Tags:["current"]}
execute as @e[tag=current,limit=1,sort=nearest] at @s run particle minecraft:cloud ~ ~ ~ 0 0 0 0 0 
execute store result score #x1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[0] 1000
execute store result score #y1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[1] 1000
execute store result score #z1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[2] 1000

# get position and motion of entity
execute store result score #x2 calc run data get entity @s Pos[0] 1000
execute store result score #y2 calc run data get entity @s Pos[1] 1000
execute store result score #z2 calc run data get entity @s Pos[2] 1000
execute store result score #dx calc run data get entity @s Motion[0] 1000
execute store result score #dy calc run data get entity @s Motion[1] 1000
execute store result score #dz calc run data get entity @s Motion[2] 1000

# get difference of the sets of coordinates
scoreboard players operation #x1 calc -= #x2 calc
scoreboard players operation #y1 calc -= #y2 calc
scoreboard players operation #z1 calc -= #z2 calc

# scale down the "force" applied (down from 20 m/s^2 which is a bit intense)
scoreboard players operation #x1 calc /= #scaleDef calc
scoreboard players operation #y1 calc /= #scaleDef calc
scoreboard players operation #z1 calc /= #scaleDef calc

# add existing motion
scoreboard players operation #x1 calc += #dx calc
scoreboard players operation #y1 calc += #dy calc
scoreboard players operation #z1 calc += #dz calc

# store result as the motion of the affected entity
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #x1 calc
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #y1 calc
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #z1 calc

kill @e[tag=current]