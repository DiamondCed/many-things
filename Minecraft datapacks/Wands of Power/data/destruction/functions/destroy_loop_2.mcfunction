# destroy the block if it isn't indestructible
execute unless block ~ ~ ~ #destruction:unbreakable run setblock ~ ~ ~ air destroy

# offset by 1 on the z axis
tp ~ ~ ~1

# decrement loop index 3 by 1
scoreboard players remove #loop3 calc 1

# keep going if loop index 3 is not 0
execute at @s if score #loop3 calc matches 1.. run function destruction:destroy_loop_2