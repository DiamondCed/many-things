tag @s add spawner
summon boat ~ ~ ~ {Tags:["hasChest"],Passengers:[{id:"minecraft:chest_minecart",Tags:["inBoat"],CustomName:'{"text":"Boat with Chest"}'}]}
execute as @s[tag=base] run tag @e[tag=hasChest,limit=1,sort=nearest] add base
execute as @s[tag=back] run tag @e[tag=hasChest,limit=1,sort=nearest] add back
execute as @s[tag=left] run tag @e[tag=hasChest,limit=1,sort=nearest] add left
execute as @s[tag=right] run tag @e[tag=hasChest,limit=1,sort=nearest] add right
data modify entity @e[tag=hasChest,limit=1,sort=nearest] Type set from entity @s Type
kill @e[type=chest_minecart,distance=..2,tag=!inBoat]
kill @s