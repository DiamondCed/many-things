tag @e[type=#telekinesis:tk_affected,distance=..4] add tkAffectedCandidat
execute at @s positioned ~ ~-0.5 ~ run tag @e[type=pig,distance=..0.25,nbt={Saddle:1b}] remove tkAffectedCandidat
execute at @s positioned ~ ~-0.75 ~ run tag @e[type=horse,distance=..0.25] remove tkAffectedCandidat
tag @e[nbt={Marker:1b}] remove tkAffectedCandidat
tag @e[nbt={NoAI:1b}] remove tkAffectedCandidat
tag @e[tag=tkAffectedCandidat,limit=1,sort=nearest] add tkAffected
tag @e remove tkAffectedCandidat

execute if entity @e[tag=tkAffected] positioned ~ ~0.75 ~ positioned ~ ~-0.5 ~ run particle minecraft:dust 1 0.25 0.85 1 ~ ~ ~ 0.35 0.35 0.35 0.0125 1
execute if entity @e[tag=tkAffected] run tag @s add spawnedParticles

# get coordinates of the point 5 blocks in front of player
summon armor_stand ~ ~-0.5 ~ {Marker:1b,Invisible:1b,Tags:["current"]}
execute store result score #x1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[0] 1000
execute store result score #y1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[1] 1000
execute store result score #z1 calc run data get entity @e[tag=current,limit=1,sort=nearest] Pos[2] 1000

# get coordinates of affected entity, as well as current motion
execute store result score #x2 calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Pos[0] 1000
execute store result score #y2 calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Pos[1] 1000
execute store result score #z2 calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Pos[2] 1000
execute store result score #dx calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[0] 1000
execute store result score #dy calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[1] 1000
execute store result score #dz calc run data get entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[2] 1000

# get difference of the sets of coordinates

scoreboard players operation #x1 calc -= #x2 calc
scoreboard players operation #y1 calc -= #y2 calc
scoreboard players operation #z1 calc -= #z2 calc

# scale down the "force" applied
scoreboard players operation #x1 calc /= #scale calc
scoreboard players operation #y1 calc /= #scale calc
scoreboard players operation #z1 calc /= #scale calc


# store difference as the motion of the affected entity
execute store result entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[0] double 0.001 run scoreboard players get #x1 calc
execute store result entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[1] double 0.001 run scoreboard players get #y1 calc
execute store result entity @e[tag=tkAffected,limit=1,sort=nearest] Motion[2] double 0.001 run scoreboard players get #z1 calc

data modify entity @e[tag=tkAffected,limit=1,sort=nearest] FallDistance set value 0.0f

kill @e[tag=current]

# add wand of recall compatibility
execute if entity @s[tag=hasRc] run scoreboard players operation @e[tag=tkAffected,limit=1,sort=nearest] recall_id = @s recall_id

tag @e remove tkAffected