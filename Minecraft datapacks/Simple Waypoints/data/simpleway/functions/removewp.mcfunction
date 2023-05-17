execute as @e[tag=waypoint] if score @s wpid = @a[scores={removewp=1..},limit=1] removewp run forceload remove ~ ~
execute as @e[tag=waypoint] if score @s wpid = @a[scores={removewp=1..},limit=1] removewp run kill @s
scoreboard players set @s removewp 0