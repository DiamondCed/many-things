#say transport_cavern
execute in cavern:cavern store success score #force_test portal_delay run forceload add ~ ~
execute in cavern:cavern unless entity @e[tag=cavern_portal,distance=..600] align xyz positioned ~0.5 ~ ~0.5 run function cavern:create_portal

#say @e[tag=transported]
tag @e[distance=..0.5,tag=!cavern_portal,tag=!transported,tag=!cavern_portal_deco] add transporting


execute in cavern:cavern as @e[tag=cavern_portal,limit=1,sort=nearest,distance=..600] at @s run tp @e[tag=transporting,tag=!transported] ~ ~ ~
execute in cavern:cavern if score #force_test portal_delay matches 1 run forceload remove ~ ~


tag @e[tag=transporting] add transported
scoreboard players set @e[tag=transporting] portal_delay 20

execute as @a[tag=transporting] at @s run playsound minecraft:block.bell.resonate player @s ~ ~ ~ 2 1
execute as @a[tag=transporting] at @s run playsound minecraft:block.bacon.deactivate player @s ~ ~ ~ 2 1
xp add @a[tag=transporting] 0 levels
tag @e remove transporting
