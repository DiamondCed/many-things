tag @e[tag=captured,limit=1,sort=nearest] add current
execute store result score @e[tag=current,limit=1,sort=nearest] prev_persist run data get entity @e[tag=current,limit=1,sort=nearest] PersistenceRequired
tag @e[tag=current,limit=1,sort=nearest] add InReplicator

tag @e[tag=current,limit=1,sort=nearest] remove captured
execute align xyz positioned ~0.5 ~0.5 ~0.5 run tp @e[tag=current] ^0.5 ^0.5 ^-1.5 ~45 ~
tag @e remove current
tag @s add HasMob
scoreboard players set @s rep_cooldown 200

execute align xyz positioned ~0.5 ~0.5 ~0.5 run playsound minecraft:entity.illusioner.mirror_move block @a ^0.5 ^0.5 ^-1.5 1 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:witch ^0.5 ^1.5 ^-1.5 .5 .5 .5 0.1 100