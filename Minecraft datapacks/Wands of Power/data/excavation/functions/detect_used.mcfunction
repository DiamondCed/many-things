scoreboard players set @s calc 0

# detect pickaxes (2 means able to mine obsidian and debris)
execute if score @s mined_exc_0_0 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_0_1 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_0_2 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_0_3 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_0_4 matches 1.. run scoreboard players set @s calc 2
execute if score @s mined_exc_0_5 matches 1.. run scoreboard players set @s calc 2

# detect shovels
execute if score @s mined_exc_1_0 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_1_1 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_1_2 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_1_3 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_1_4 matches 1.. run scoreboard players set @s calc 1
execute if score @s mined_exc_1_5 matches 1.. run scoreboard players set @s calc 1

# reset pickaxes
scoreboard players set @s mined_exc_0_0 0
scoreboard players set @s mined_exc_0_1 0
scoreboard players set @s mined_exc_0_2 0
scoreboard players set @s mined_exc_0_3 0
scoreboard players set @s mined_exc_0_4 0
scoreboard players set @s mined_exc_0_5 0

# reset shovels
scoreboard players set @s mined_exc_1_0 0
scoreboard players set @s mined_exc_1_1 0
scoreboard players set @s mined_exc_1_2 0
scoreboard players set @s mined_exc_1_3 0
scoreboard players set @s mined_exc_1_4 0
scoreboard players set @s mined_exc_1_5 0