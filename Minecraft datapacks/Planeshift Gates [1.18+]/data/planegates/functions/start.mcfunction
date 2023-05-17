tellraw @a {"text":"Planeshift Gates Pack Loaded!","color":"aqua"}
scoreboard objectives add planeCalc dummy
scoreboard objectives add planeX dummy
scoreboard objectives add planeY dummy
scoreboard objectives add planeZ dummy
scoreboard objectives add planeCool dummy
scoreboard players set $10 planeCalc 10
scoreboard players set $1 planeCalc 1
execute unless entity @e[tag=planeGateMarker] in planegates:pocket positioned -16 64 -16 run function planegates:setup_dim