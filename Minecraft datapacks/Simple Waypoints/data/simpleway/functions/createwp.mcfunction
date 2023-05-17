summon minecraft:area_effect_cloud ~ ~ ~ {Duration:9999,Tags:["waypoint"]}
scoreboard players operation @e[tag=waypoint,distance=..1] wpid = @s savewp
forceload add ~ ~
scoreboard players set @s savewp 0