#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^1 0 0 0 0 0 force
#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^2 0 0 0 0 0 force
#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^3 0 0 0 0 0 force
#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^4 0 0 0 0 0 force
#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^5 0 0 0 0 0 force
#execute as @a at @s positioned ~ ~1.75 ~ run particle flame ^ ^ ^6 0 0 0 0 0 force


execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^1 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^2 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^3 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^4 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^6 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create

execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^0.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^1.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^2.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^3.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^4.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create
execute as @a[scores={hold_semisolid=1}] at @s positioned ~ ~1.75 ~ positioned ^ ^ ^5.5 if block ~ ~ ~ structure_void unless entity @e[tag=semisolid,distance=..0.9] run function semisolid:create

execute as @e[tag=semisolid] at @s unless block ~ ~ ~ glass unless block ~ ~ ~ structure_void run function semisolid:destroy

execute as @e[tag=semisolid] at @s unless entity @p[scores={sneakdetect=1..},distance=..20] run setblock ~ ~ ~ glass
execute as @e[tag=semisolid] at @s if entity @p[scores={sneakdetect=1..},distance=..20] run setblock ~ ~ ~ structure_void
execute as @e[tag=semisolid] at @s run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 .2 1 force

scoreboard players set @a sneakdetect 0
scoreboard players reset @a hold_semisolid
scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:structure_void"}}] hold_semisolid 1
