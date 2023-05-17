tag @s remove holding
scoreboard players set @s used_lasso 0

execute at @e[tag=captured,limit=1,sort=nearest,distance=..10] rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 as @e[tag=Replicator,tag=!HasMob,limit=1,sort=nearest,distance=..3] at @s run function mj_diamondced:absorb_mob

tag @e[tag=captured,limit=1,sort=nearest,distance=..10] remove captured

playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 0.5 2

