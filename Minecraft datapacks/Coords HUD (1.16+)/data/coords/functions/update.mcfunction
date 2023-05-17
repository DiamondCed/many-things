#manage coords hud
scoreboard players enable @a coords
scoreboard players enable @a cycle_color
execute as @a[scores={coords=1..}] run function coords:switch_state
execute as @a[scores={cycle_color=1..}] run function coords:switch_color
execute as @a[tag=dispCoords] at @s run function coords:disp_coords
scoreboard players set @a coords 0
scoreboard players set @a cycle_color 0


#manage distance hud
scoreboard players enable @a distance
scoreboard players enable @a distance_center
execute as @a[scores={distance=1..}] run function coords:switch_state_distance
execute as @a[scores={distance_center=1..}] run function coords:set_distance_center


execute as @a[tag=dispDist] at @s run function coords:disp_distance
scoreboard players set @a distance 0
scoreboard players set @a distance_center 0