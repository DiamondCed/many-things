execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye"}}] at @s if predicate planegates:is_overworld if block ~ ~ ~ soul_fire if block ~ ~2 ~ #wooden_trapdoors[half=bottom] if block ~-1 ~ ~ #wooden_trapdoors[facing=west] if block ~-1 ~1 ~ #wooden_trapdoors[facing=west] if block ~1 ~ ~ #wooden_trapdoors[facing=east] if block ~1 ~1 ~ #wooden_trapdoors[facing=east] run function planegates:create_portal
execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye"}}] at @s if predicate planegates:is_overworld if block ~ ~ ~ soul_fire if block ~ ~2 ~ #wooden_trapdoors[half=bottom] if block ~ ~ ~-1 #wooden_trapdoors[facing=north] if block ~ ~1 ~-1 #wooden_trapdoors[facing=north] if block ~ ~ ~1 #wooden_trapdoors[facing=south] if block ~ ~1 ~1 #wooden_trapdoors[facing=south] run function planegates:create_portal
execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye"}}] at @s if predicate planegates:is_overworld if block ~ ~-1 ~ soul_fire if block ~ ~1 ~ #wooden_trapdoors[half=bottom] if block ~-1 ~ ~ #wooden_trapdoors[facing=west] if block ~-1 ~-1 ~ #wooden_trapdoors[facing=west] if block ~1 ~ ~ #wooden_trapdoors[facing=east] if block ~1 ~-1 ~ #wooden_trapdoors[facing=east] positioned ~ ~-1 ~ run function planegates:create_portal
execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye"}}] at @s if predicate planegates:is_overworld if block ~ ~-1 ~ soul_fire if block ~ ~1 ~ #wooden_trapdoors[half=bottom] if block ~ ~ ~-1 #wooden_trapdoors[facing=north] if block ~ ~-1 ~-1 #wooden_trapdoors[facing=north] if block ~ ~ ~1 #wooden_trapdoors[facing=south] if block ~ ~-1 ~1 #wooden_trapdoors[facing=south] positioned ~ ~-1 ~ run function planegates:create_portal

tag @e[tag=PlaneEntrancePortal] remove safe
execute as @e[tag=PlaneEntrancePortal] at @s if block ~ ~2 ~ #wooden_trapdoors if block ~-1 ~ ~ #wooden_trapdoors[facing=west] if block ~-1 ~1 ~ #wooden_trapdoors[facing=west] if block ~1 ~ ~ #wooden_trapdoors[facing=east] if block ~1 ~1 ~ #wooden_trapdoors[facing=east] if block ~ ~ ~ end_gateway if block ~ ~1 ~ end_gateway run tag @s add safe
execute as @e[tag=PlaneEntrancePortal] at @s if block ~ ~2 ~ #wooden_trapdoors if block ~ ~ ~-1 #wooden_trapdoors[facing=north] if block ~ ~1 ~-1 #wooden_trapdoors[facing=north] if block ~ ~ ~1 #wooden_trapdoors[facing=south] if block ~ ~1 ~1 #wooden_trapdoors[facing=south] if block ~ ~ ~ end_gateway if block ~ ~1 ~ end_gateway run tag @s add safe
execute as @e[tag=!safe,tag=PlaneEntrancePortal] at @s run function planegates:remove_portal

execute as @e[tag=!planeTech] at @s unless entity @s[scores={planeCool=1..}] if entity @e[tag=PlaneEntrancePortal,distance=..1] if predicate planegates:is_overworld if block ~ ~ ~ end_gateway run function planegates:enter

execute as @e[tag=!planeTech] at @s if predicate planegates:is_pocket if block ~ ~ ~ end_gateway run function planegates:exit

execute as @e[scores={planeCool=1..}] at @s unless block ~ ~ ~ end_gateway run scoreboard players remove @s planeCool 1

#execute as @e[tag=tester] at @s if entity @a[nbt={SelectedItem:{id:"minecraft:stick"}}] run tellraw @a {"score":{"objective":"planeX","name":"@s"}}