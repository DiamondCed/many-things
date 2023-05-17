scoreboard players add $i calc 1

execute if score $i calc matches 0 run scoreboard players operation #T calc = #A calc
execute if score $i calc matches 0 run scoreboard players operation #S calc = #A calc

scoreboard players operation #A calc = #T calc
scoreboard players operation #B calc = #S calc

scoreboard players operation #A calc /= #B calc

scoreboard players operation #A calc += #S calc

scoreboard players set #2 calc 2
scoreboard players operation #A calc /= #2 calc

scoreboard players operation #S calc = #A calc

execute if score $i calc matches 12.. run scoreboard players set $i calc -1
execute unless score $i calc matches -1 run function coords:sqrt