#tellraw @a {"text":"Enderchest Minecart Pack loaded!","color":"dark_aqua"}
forceload add 0 0
scoreboard objectives add usedsummon minecraft.used:minecraft.carrot_on_a_stick 
scoreboard objectives add playerid dummy "PlayerID"
scoreboard objectives add callCart trigger "Call Storage Cart"
scoreboard objectives add previd dummy "Previous used ID"
execute as @a unless entity @s[scores={playerid=0..}] run scoreboard players set @s playerid 0
execute unless score #prevID previd matches 0.. run scoreboard players set #prevID previd 0
