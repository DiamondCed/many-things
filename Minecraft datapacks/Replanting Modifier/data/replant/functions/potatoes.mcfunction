execute if block ~ ~ ~ air if entity @s[nbt={Item:{Count:1b}}] run tag @s add destroy
execute if block ~ ~ ~ air unless entity @s[nbt={Item:{Count:1b}}] store result score @s cropamt run data get entity @s Item.Count
execute if block ~ ~ ~ air unless entity @s[nbt={Item:{Count:1b}}] store result entity @s Item.Count byte 1 run scoreboard players remove @s cropamt 1
execute if block ~ ~ ~ air run setblock ~ ~ ~ potatoes

execute run kill @s[tag=destroy]


