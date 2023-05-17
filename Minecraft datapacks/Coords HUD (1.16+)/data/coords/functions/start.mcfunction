scoreboard objectives add cx dummy "X Coord"
scoreboard objectives add cy dummy "Y Coord"
scoreboard objectives add cz dummy "Z Coord"

scoreboard objectives add px dummy "Point X Coord"
scoreboard objectives add py dummy "Point Y Coord"
scoreboard objectives add pz dummy "Point Z Coord"

scoreboard objectives add coords trigger "Toggle Coordinates"
scoreboard objectives add distance trigger "Toggle Distance Tracker"
scoreboard objectives add distance_center trigger "Set Distance Center to Position"
scoreboard objectives add cycle_color trigger "Cycle Display Color"

scoreboard objectives add calc dummy
scoreboard players set $i calc 1

tellraw @a {"text":"Coordinates HUD Pack loaded!","color":"aqua"}