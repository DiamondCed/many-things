tag @s add toTp
execute as @e[tag=waypoint] at @s if score @s wpid = @a[tag=toTp,limit=1] tpwp run tp @a[tag=toTp,limit=1] @s
tag @s remove toTp
scoreboard players set @s tpwp 0