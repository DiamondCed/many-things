# set up the positioning aka tp to bottom left front corner
tp @s ~-2 ~-2 ~-2

# set the first loop index to 5
scoreboard players set #loop1 calc 5

# start the first loop
execute at @s run function destruction:destroy_loop_0

# hey, we're done :D