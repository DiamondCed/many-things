data modify entity @s NoGravity set value 1b
tag @s add flying
kill @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust",Count:1b}},limit=1,sort=nearest]