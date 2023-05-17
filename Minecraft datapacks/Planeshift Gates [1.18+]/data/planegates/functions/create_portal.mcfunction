fill ~ ~ ~ ~ ~1 ~ end_gateway{Age:600L}
execute align xyz positioned ~0.5 ~ ~0.5 run summon armor_stand ~ ~ ~ {Marker:1b,NoGravity:1b,Invisible:1b,Tags:["current","PlaneEntrancePortal","planeTech"]}
execute if block ~ ~2 ~ oak_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 0
execute if block ~ ~2 ~ birch_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 1
execute if block ~ ~2 ~ spruce_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 2
execute if block ~ ~2 ~ jungle_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 3
execute if block ~ ~2 ~ acacia_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 4
execute if block ~ ~2 ~ dark_oak_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 5
execute if block ~ ~2 ~ warped_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 6
execute if block ~ ~2 ~ crimson_trapdoor run scoreboard players set @e[tag=PlaneEntrancePortal,tag=current,limit=1,sort=nearest] planeCalc 7
tag @e[tag=current,limit=1,sort=nearest] remove current
playsound minecraft:block.end_portal.spawn block @a ~ ~ ~ 0.3 2
kill @s