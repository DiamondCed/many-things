#say transport_cavern2
execute in cavern:large_cavern store success score #force_test portal_delay run forceload add ~ ~
execute in cavern:large_cavern unless entity @e[tag=cavern_portal2,distance=..600] align xyz positioned ~0.5 ~ ~0.5 run function cavern:create_portal2

#say @e[tag=transported]
tag @e[distance=..0.5,tag=!cavern_portal2,tag=!transported,tag=!cavern_portal_deco2] add transporting


execute in cavern:large_cavern as @e[tag=cavern_portal2,limit=1,sort=nearest,distance=..600] at @s run tp @e[tag=transporting,tag=!transported] ~ ~ ~
execute in cavern:large_cavern if score #force_test portal_delay matches 1 run forceload remove ~ ~

#this is fine V
tag @e[tag=transporting] add transported
scoreboard players set @e[tag=transporting] portal_delay 20

execute as @a[tag=transporting] at @s run playsound minecraft:block.bell.resonate player @s ~ ~ ~ 2 1
execute as @a[tag=transporting] at @s run playsound minecraft:block.bacon.deactivate player @s ~ ~ ~ 2 1
xp add @a[tag=transporting] 0 levels
tag @e remove transporting
