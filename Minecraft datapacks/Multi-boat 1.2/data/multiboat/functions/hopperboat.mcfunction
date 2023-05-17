tag @s add spawner
summon boat ~ ~ ~ {Tags:["hasHopper"],Passengers:[{id:"minecraft:hopper_minecart",Tags:["inBoat"],CustomName:'{"text":"Boat with Hopper"}'}]}
execute as @s[tag=base] run tag @e[tag=hasHopper,limit=1,sort=nearest] add base
execute as @s[tag=back] run tag @e[tag=hasHopper,limit=1,sort=nearest] add back
execute as @s[tag=left] run tag @e[tag=hasHopper,limit=1,sort=nearest] add left
execute as @s[tag=right] run tag @e[tag=hasHopper,limit=1,sort=nearest] add right
data modify entity @e[tag=hasHopper,limit=1,sort=nearest] Type set from entity @s Type
kill @e[type=hopper_minecart,distance=..2,tag=!inBoat]
kill @s