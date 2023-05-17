# teleport the armor stand forwards a bit
tp ^ ^ ^0.1

# check if the block is a valid target (see block tag I guess)
execute store success score @s calc at @s unless block ~ ~ ~ #destruction:nonsolid

# decrement the max distance
scoreboard players remove #distance calc 1

# continue the loop if not past max distance and not found a block yet
execute if score #distance calc matches 1.. if score @s calc matches 0 at @s run function destruction:raycast_loop