scoreboard players enable @a coords
scoreboard players enable @a cycle_color
execute as @a[scores={coords=1..}] run function coords:switch_state
execute as @a[scores={cycle_color=1..}] run function coords:switch_color
execute as @a[tag=dispCoords] at @s run function coords:disp_coords
scoreboard players set @a coords 0
scoreboard players set @a cycle_color 0