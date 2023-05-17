execute as @e[scores={portal_delay=1..}] at @s unless entity @e[tag=cavern_portal,distance=..0.55] unless entity @e[tag=cavern_portal2,distance=..0.55] run scoreboard players remove @s portal_delay 1
tag @e[tag=transported,scores={portal_delay=0}] remove transported


#cavern portal
execute as @e[type=item,nbt={Item:{id:"minecraft:emerald",Count:1b}}] at @s if predicate cavern:is_portal_dim run function cavern:test_location

execute as @e[tag=cavern_portal] at @s if entity @e[distance=..0.5,tag=!transported,tag=!cavern_portal,tag=!cavern_portal_deco] if predicate cavern:is_overworld run function cavern:transport_cavern

execute as @e[tag=cavern_portal,tag=!cavern_portal_deco] at @s if entity @e[distance=..0.5,tag=!transported,tag=!cavern_portal] if predicate cavern:is_cavern run function cavern:transport_overworld

execute as @e[tag=cavern_portal_deco] at @s positioned ~ ~1.5 ~ unless entity @e[tag=cavern_portal,distance=..2] run kill @s

execute as @e[tag=cavern_portal] at @s run function cavern:test_destruction

execute as @e[tag=cavern_portal] unless entity @s[tag=passed_cavern] run kill @s
tag @e remove passed_cavern

execute as @e[tag=cavern_portal] at @s run particle minecraft:rain ~ ~1 ~ .35 .6 .35 0 2 force


#large cavern portal
execute as @e[type=item,nbt={Item:{id:"minecraft:emerald",Count:1b}}] at @s if predicate cavern:is_portal_dim2 run function cavern:test_location2

execute as @e[tag=cavern_portal2] at @s if entity @e[distance=..0.5,tag=!transported,tag=!cavern_portal2,tag=!cavern_portal_deco2] if predicate cavern:is_overworld run function cavern:transport_cavern2

execute as @e[tag=cavern_portal2,tag=!cavern_portal_deco2] at @s if entity @e[distance=..0.5,tag=!transported,tag=!cavern_portal2] if predicate cavern:is_cavern2 run function cavern:transport_overworld2

execute as @e[tag=cavern_portal_deco2] at @s positioned ~ ~1.5 ~ unless entity @e[tag=cavern_portal2,distance=..2] run kill @s

execute as @e[tag=cavern_portal2] at @s run function cavern:test_destruction2

execute as @e[tag=cavern_portal2] unless entity @s[tag=passed_cavern2] run kill @s
tag @e remove passed_cavern2

execute as @e[tag=cavern_portal2] at @s run particle minecraft:rain ~ ~1 ~ .35 .6 .35 0 2 force

