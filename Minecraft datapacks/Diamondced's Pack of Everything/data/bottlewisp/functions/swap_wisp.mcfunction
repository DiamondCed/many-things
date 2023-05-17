execute if entity @s[tag=hasWisp] run tag @a add removeWisp
execute if entity @s[tag=!hasWisp] run tag @a add hasWisp
execute if entity @s[tag=removeWisp] run tag @s remove hasWisp
tag @s remove removeWisp
#execute at @s run playsound minecraft:entity.ender_dragon.shoot player @s ~ ~ ~ 0.75 0.6
#execute at @s run playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 2 1
execute at @s run playsound minecraft:wisp_in_a_bottle player @s ~ ~ ~ 1 1