scoreboard objectives add diedDeathCoord deathCount "Player Died"
scoreboard objectives add private_coordinates trigger "Show coords only to the player"
scoreboard objectives add private_coords_setting dummy "Should the coords be private"

tellraw @a {"text":"Death Coordinates Pack loaded!","color":"red"}