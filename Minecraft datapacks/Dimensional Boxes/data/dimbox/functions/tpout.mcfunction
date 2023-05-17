tag @s add targetplayer
execute as @e[tag=returntp] if score @s boxid = @a[tag=targetplayer,limit=1] boxpid run tp @a[tag=targetplayer] @s
execute as @e[tag=returntp] if score @s boxid = @a[tag=targetplayer,limit=1] boxpid run kill @s
forceload remove ~ ~
tag @s remove targetplayer