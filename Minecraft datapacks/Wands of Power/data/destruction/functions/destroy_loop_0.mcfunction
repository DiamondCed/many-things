# set the second loop index to 5
scoreboard players set #loop2 calc 5

# start the second loop
execute at @s run function destruction:destroy_loop_1

# offset by 1 on the x axis
tp ~1 ~ ~

# decrement loop index 1 by 1
scoreboard players remove #loop1 calc 1

# keep going if loop index 1 is not 0
execute at @s if score #loop1 calc matches 1.. run function destruction:destroy_loop_0