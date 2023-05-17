# store position
execute store result score #x calc run data get entity @s Pos[0] 1000
execute store result score #y calc run data get entity @s Pos[1] 1000
execute store result score #z calc run data get entity @s Pos[2] 1000

# add height offset to y position
#scoreboard players operation #y calc += #stand_offset calc

# update positions to round down to the nearest half-block (2x), including rounding properly from 0.5->1 instead of truncating
scoreboard players operation #x calc /= #50 calc
scoreboard players operation #y calc /= #50 calc
scoreboard players operation #z calc /= #50 calc
scoreboard players operation #temp calc = #x calc
scoreboard players operation #temp calc %= #10 calc
execute if score #temp calc matches 5.. run scoreboard players add #x calc 10
#scoreboard players operation #temp calc = #y calc
#scoreboard players operation #temp calc %= #10 calc
#execute if score #temp calc matches 5.. run scoreboard players add #y calc 10
scoreboard players operation #temp calc = #y calc
scoreboard players operation #temp calc %= #10 calc
execute if score #temp calc matches 5.. run scoreboard players add #y calc 10
scoreboard players operation #x calc /= #10 calc
scoreboard players operation #y calc /= #10 calc
scoreboard players operation #z calc /= #10 calc

# scale the y position back up to 1000x, to add the precise y offset from armor stand passengership
# but do it backwards because otherwise it gets even deeper
#scoreboard players operation #y calc *= #500 calc
#scoreboard players operation #y calc -= #stand_offset calc
#scoreboard players operation #y calc += #strange_offset calc

# store position back into stand
execute store result entity @s Pos[0] double 0.5 run scoreboard players get #x calc
execute store result entity @s Pos[1] double 0.5 run scoreboard players get #y calc
execute store result entity @s Pos[2] double 0.5 run scoreboard players get #z calc

# tp stand to force position update
execute as @s at @s run tp @s ~ ~ ~ ~ ~

# test if inside ground and die if so
execute at @s if block ~0.45 ~0.05 ~0.45 #conjuration:cubic if block ~0.45 ~0.05 ~-0.45 #conjuration:cubic if block ~-0.45 ~0.05 ~0.45 #conjuration:cubic if block ~-0.45 ~0.05 ~-0.45 #conjuration:cubic if block ~0.45 ~0.95 ~0.45 #conjuration:cubic if block ~0.45 ~0.95 ~-0.45 #conjuration:cubic if block ~-0.45 ~0.95 ~0.45 #conjuration:cubic if block ~-0.45 ~0.95 ~-0.45 #conjuration:cubic run function conjuration:destroy

# test if clipped inside other conjured block and die if so
tag @s add curr
execute at @s if entity @e[tag=conjured_block,tag=!curr,distance=..0.125] run function conjuration:destroy
tag @s remove curr

#-1.98125001788139 to align block to grid using armor stand