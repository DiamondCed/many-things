#say teleport

tag @s add temp_tele
tag @s add delayed_tp
# select all mobs that are telekinesized (due to having a recall id despite not being a player) closeish to the player (so limited to the same dimension) and find the one with the same id as the player
tag @e[type=!player,tag=!recallWandBeacon,scores={recall_id=1..},distance=..100] add tpCandidate
execute as @e[tag=tpCandidate] unless score @s recall_id = @a[tag=temp_tele,limit=1,sort=nearest] recall_id run tag @s remove tpCandidate

# get mob position
execute if entity @e[tag=tpCandidate] store result score #x1 calc run data get entity @e[tag=tpCandidate,limit=1,sort=nearest] Pos[0] 1000
execute if entity @e[tag=tpCandidate] store result score #y1 calc run data get entity @e[tag=tpCandidate,limit=1,sort=nearest] Pos[1] 1000
execute if entity @e[tag=tpCandidate] store result score #z1 calc run data get entity @e[tag=tpCandidate,limit=1,sort=nearest] Pos[2] 1000

# get player position
execute if entity @e[tag=tpCandidate] store result score #x2 calc run data get entity @s Pos[0] 1000
execute if entity @e[tag=tpCandidate] store result score #y2 calc run data get entity @s Pos[1] 1000
execute if entity @e[tag=tpCandidate] store result score #z2 calc run data get entity @s Pos[2] 1000

# subtract them
execute if entity @e[tag=tpCandidate] run scoreboard players operation #x1 calc -= #x2 calc
execute if entity @e[tag=tpCandidate] run scoreboard players operation #y1 calc -= #y2 calc
execute if entity @e[tag=tpCandidate] run scoreboard players operation #z1 calc -= #z2 calc

# attempt to forceload the chunk we're leaving, and spawn an armor stand to remember if that worked (pair them with the recall id)
summon armor_stand ~ ~ ~ {Tags:["rcCleanUp"],Invisible:1b,Marker:1b}
scoreboard players operation @e[tag=rcCleanUp,limit=1,sort=nearest] recall_id = @s recall_id
execute store success score @e[tag=rcCleanUp,limit=1,sort=nearest] calc run forceload add ~ ~

# store the parameters of the position we're going to in storage for better access -> they are now in rc.tpParams
data modify storage rc temp set from entity @s[tag=hasRcOffhand] Inventory[{Slot:-106b}].tag.RecallPositions
data modify storage rc temp set from entity @s[tag=hasRcMainhand] SelectedItem.tag.RecallPositions
data modify storage rc tempDim set from entity @s Dimension
data modify storage rc tpParams set value {}
function recall:retrieve_position

tag @s add Teleporting

# summon an armor stand in the place we're teleporting to and tell it to forceload the chunk there, and remember if that worked (pair them with the recall id) -> then they do all the teleporting
summon armor_stand ~ ~ ~ {Tags:["currRc"],Invisible:1b,Marker:1b}
execute as @e[tag=currRc,limit=1,sort=nearest] at @s run function recall:teleport_to_destination

tag @s remove Teleporting

# sounds?

# set a cooldown on the next teleport
scoreboard players operation @s cooldown_rc = #cooldown cooldown_rc

# clean up tags and scores
kill @e[tag=currRc]
kill @e[tag=currRcTk]

tag @s remove temp_tele
scoreboard players reset @e[tag=tpCandidate] recall_id
tag @e[tag=tpCandidate] remove tpCandidate