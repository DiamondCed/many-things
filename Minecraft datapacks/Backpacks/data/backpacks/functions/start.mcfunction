tellraw @a {"text":"Backpacks Pack loaded!","color":"aqua"}
forceload add 0 0
scoreboard objectives add playeridbp dummy "PlayerID"
scoreboard objectives add previdbp dummy "Previous used ID"
scoreboard objectives add diedbp deathCount "Player Died"
scoreboard objectives add prevbpID dummy "Previous Backpack ID"
execute unless score #prevID previdbp matches 0.. run scoreboard players set #prevID previdbp 0
