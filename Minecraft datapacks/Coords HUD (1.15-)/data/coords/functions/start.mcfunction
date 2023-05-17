scoreboard objectives add cx dummy "X Coord"
scoreboard objectives add cy dummy "Y Coord"
scoreboard objectives add cz dummy "Z Coord"
scoreboard objectives add coords trigger "Toggle Coordinates"
scoreboard objectives add cycle_color trigger "Cycle Display Color"
tellraw @a {"text":"Coordinates HUD Pack loaded!","color":"aqua"}