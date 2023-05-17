#say transport_overworld
execute in minecraft:overworld run forceload add ~ ~
execute in minecraft:overworld unless entity @e[tag=cavern_portal,distance=..600] align xyz positioned ~0.5 ~ ~0.5 run function cavern:create_portal

tag @e[distance=..0.5,tag=!cavern_portal,tag=!transported,tag=!cavern_portal_deco] add transporting

execute in minecraft:overworld as @e[tag=cavern_portal,limit=1,sort=nearest,distance=..600] at @s run tp @e[tag=transporting,tag=!transported] ~ ~ ~
execute in minecraft:overworld run forceload remove ~ ~

tag @e[tag=transporting] add transported
scoreboard players set @e[tag=transporting] portal_delay 300

execute as @a[tag=transporting] at @s run playsound minecraft:block.bell.resonate player @s ~ ~ ~ 2 1
execute as @a[tag=transporting] at @s run playsound minecraft:block.bacon.deactivate player @s ~ ~ ~ 2 1
tag @e remove transporting 