execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 at @e[tag=Replicator,limit=1,sort=nearest,distance=..0.75] align xyz positioned ~0.5 ~0.5 ~0.5 positioned ^0.5 ^0.5 ^-1.5 run tp @s ~ ~ ~ ~45 ~

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 unless entity @e[tag=Replicator,distance=..0.75] run data modify entity @s Invulnerable set value 0b
execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 if entity @e[tag=Replicator,distance=..0.75] run data modify entity @s Invulnerable set value 1b

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 unless entity @e[tag=Replicator,distance=..0.75] run data modify entity @s NoAI set value 0b
execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 if entity @e[tag=Replicator,distance=..0.75] run data modify entity @s NoAI set value 1b

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 unless entity @e[tag=Replicator,distance=..0.75] run data modify entity @s Silent set value 0b
execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 if entity @e[tag=Replicator,distance=..0.75] run data modify entity @s Silent set value 1b

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 unless entity @e[tag=Replicator,distance=..0.75] unless score @s prev_persist matches 1 run data modify entity @s PersistenceRequired set value 0b
execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 if entity @e[tag=Replicator,distance=..0.75] run data modify entity @s PersistenceRequired set value 1b

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 if entity @e[tag=Replicator,distance=..0.75] run data modify entity @s Air set value 300

execute rotated as @e[tag=Replicator,limit=1,sort=nearest] positioned ^-0.5 ^-0.5 ^1.5 positioned ^ ^ ^-0.5 unless entity @e[tag=Replicator,distance=..0.75] run tag @s remove InReplicator