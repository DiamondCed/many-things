scoreboard players operation @s planeX = @e[tag=currentTarget,limit=1,sort=nearest] planeX
scoreboard players operation @s planeY = @e[tag=currentTarget,limit=1,sort=nearest] planeY
scoreboard players operation @s planeZ = @e[tag=currentTarget,limit=1,sort=nearest] planeZ

scoreboard players operation @s planeX *= $10 planeCalc
scoreboard players operation @s planeZ *= $10 planeCalc

scoreboard players add @s planeX 5
scoreboard players add @s planeZ 5

execute store result entity @s Pos[0] double 0.1 run scoreboard players get @s planeX
execute store result entity @s Pos[1] double 1 run scoreboard players get @s planeY
execute store result entity @s Pos[2] double 0.1 run scoreboard players get @s planeZ

execute in overworld store success score @s planeCalc run forceload add ~ ~

execute at @s in overworld run tp @e[tag=currentTarget] ~ ~ ~

execute in overworld if score @s planeCalc matches 1 run forceload remove ~ ~
kill @s