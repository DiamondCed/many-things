data modify entity @s Pos set from storage rc tpParams.Position
data modify entity @s Rotation set from entity @p[tag=temp_tele] Rotation
execute at @s run tp @s ~ ~ ~ ~ ~

execute store success score @s calc run forceload add ~ ~

# summon another armor stand where the tk mob will teleport (pair with recall_id)
summon armor_stand ~ ~ ~ {Tags:["currRcTk"],Invisible:1b,Marker:1b}
scoreboard players operation @e[tag=currRcTk,limit=1,sort=nearest] recall_id = @s recall_id
 # get original stand position
execute if entity @e[tag=tpCandidate] store result score #x3 calc run data get entity @s Pos[0] 1000
execute if entity @e[tag=tpCandidate] store result score #y3 calc run data get entity @s Pos[1] 1000
execute if entity @e[tag=tpCandidate] store result score #z3 calc run data get entity @s Pos[2] 1000
 # add mob relative position to stand position
execute if entity @e[tag=tpCandidate] run scoreboard players operation #x3 calc += #x1 calc
execute if entity @e[tag=tpCandidate] run scoreboard players operation #y3 calc += #y1 calc
execute if entity @e[tag=tpCandidate] run scoreboard players operation #z3 calc += #z1 calc
 # store position back into new stand
execute if entity @e[tag=tpCandidate] store result entity @e[tag=currRcTk,limit=1,sort=nearest] Pos[0] double 0.001 run scoreboard players get #x3 calc
execute if entity @e[tag=tpCandidate] store result entity @e[tag=currRcTk,limit=1,sort=nearest] Pos[1] double 0.001 run scoreboard players get #y3 calc
execute if entity @e[tag=tpCandidate] store result entity @e[tag=currRcTk,limit=1,sort=nearest] Pos[2] double 0.001 run scoreboard players get #z3 calc
 # do teleport the armor stand
execute if entity @e[tag=tpCandidate] as @e[tag=currRcTk] at @s run tp @s ~ ~ ~ ~ ~

# particles before leaving
#execute at @s run particle minecraft:reverse_portal ~ ~0.95 ~ 0 0.33 0 1 200
execute at @p[tag=Teleporting] run particle minecraft:portal ~ ~0.95 ~ 0 0.33 0 1 200

# tk entity particles before leaving
#execute at @e[tag=tpCandidate,limit=1,sort=nearest] run particle minecraft:reverse_portal ~ ~0.95 ~ 0 0 0 1 100
execute at @e[tag=tpCandidate,limit=1,sort=nearest] run particle minecraft:portal ~ ~0.95 ~ 0 0 0 1 100

# teleport the player -> no longer delayed by 1 tick
tp @p[tag=Teleporting] @s

# teleport the tk mob to the tk stand, then kill the tk stand -> no longer delayed by 1 tick
tp @e[tag=tpCandidate,limit=1,sort=nearest] @e[tag=currRcTk,limit=1,sort=nearest]
kill @e[tag=currRcTk,limit=1,sort=nearest]

# tell the cleanup stand to unforceload the previous chunk, then die -> no longer delayed by 1 tick
execute as @e[tag=rcCleanUp,limit=1,sort=nearest] at @s run function recall:clean_up

# unforceload this chunk, then kill the armor stand -> no longer delayed by 1 tick
execute if score @e[tag=currRc,limit=1,sort=nearest] calc matches 1.. run forceload remove ~ ~
kill @s

# particles
#execute at @s run particle minecraft:portal ~ ~0.95 ~ 0 0.33 0 1 200
execute at @p[tag=Teleporting] run particle minecraft:reverse_portal ~ ~0.95 ~ 0 0.33 0 1 200

# tk entity particles
#execute at @e[tag=tpCandidate,limit=1,sort=nearest] run particle minecraft:portal ~ ~0.95 ~ 0 0 0 1 100
execute at @e[tag=tpCandidate,limit=1,sort=nearest] run particle minecraft:reverse_portal ~ ~0.95 ~ 0 0 0 1 100