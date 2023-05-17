forceload add ~ ~
tag @s add targetplayer
execute as @e[tag=returntp] if score @s boxid = @a[tag=targetplayer,limit=1] boxpid run kill @s
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,NoGravity:1b,Tags:["returntp"]}
scoreboard players operation @e[tag=returntp,limit=1,sort=nearest] boxid = @s boxpid
execute as @e[tag=boxtp] at @s if score @a[tag=targetplayer,limit=1] boxpid = @s boxid run tp @e[tag=targetplayer] ~7 ~2 ~7
tag @s remove targetplayer