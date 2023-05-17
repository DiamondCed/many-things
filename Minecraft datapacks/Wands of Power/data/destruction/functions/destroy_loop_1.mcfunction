# set the third loop index to 5
scoreboard players set #loop3 calc 5

# start the third loop
execute at @s run function destruction:destroy_loop_2

# offset by 1 on the y axis
tp ~ ~1 ~

# decrement loop index 2 by 1
scoreboard players remove #loop2 calc 1

# keep going if loop index 2 is not 0
execute at @s if score #loop2 calc matches 1.. run function destruction:destroy_loop_1