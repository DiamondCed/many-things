execute as @e[type=item,nbt={Item:{id:"minecraft:slime_ball"},OnGround:1b}] at @s if entity @a[distance=..8,gamemode=!spectator] run data modify entity @s Motion[1] set value 0.33d