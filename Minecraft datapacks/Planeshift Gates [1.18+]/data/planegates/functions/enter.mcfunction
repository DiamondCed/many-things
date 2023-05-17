
execute store result score @s planeX run data get entity @s Pos[0]
execute store result score @s planeY run data get entity @s Pos[1]
execute store result score @s planeZ run data get entity @s Pos[2]

scoreboard players operation @s planeCalc = @e[tag=PlaneEntrancePortal,limit=1,sort=nearest] planeCalc

tag @s add planeTarget

execute as @e[tag=planeGateMarker] at @s if score @s planeCalc = @e[tag=planeTarget,limit=1] planeCalc run tp @e[tag=planeTarget,limit=1] @s

tag @e remove planeTarget

scoreboard players set @s planeCool 20

tag @s add getSound

xp add @s 0 levels
schedule function planegates:play_sound 1t