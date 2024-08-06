scoreboard objectives add diedDeathCoord deathCount "Player Died"
scoreboard objectives add private_coordinates trigger "Show coords only to the player"

tellraw @a {"text":"Death Coordinates Pack loaded!","color":"red"}