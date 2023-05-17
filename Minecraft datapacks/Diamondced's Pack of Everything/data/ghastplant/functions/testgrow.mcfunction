execute store success score #temp calc if predicate ghastplant:grow_chance
execute if score #temp calc matches 1 run function ghastplant:age
scoreboard players remove @s calc 1
execute if score @s calc matches 1.. if score #temp calc matches 0 run function ghastplant:testgrow