execute as @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli"}}] at @s align xyz if block ~ ~-1 ~ glowstone run function nonls:create

execute as @e[tag=nonlightstand] at @s unless block ~ ~2 ~ blue_stained_glass run function nonls:destroy

execute as @e[tag=nonlightstand] at @s run tp @s ~ ~ ~ ~2 ~