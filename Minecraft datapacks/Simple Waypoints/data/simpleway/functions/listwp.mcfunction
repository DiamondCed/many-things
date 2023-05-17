tag @s add toDisp
tellraw @a[tag=toDisp] {"text":"Available Teleports:","color":"green"}
execute as @e[tag=waypoint] run tellraw @a[tag=toDisp] {"score":{"name":"@s","objective":"wpid"}}
tag @s remove toDisp
scoreboard players set @s listwp 0