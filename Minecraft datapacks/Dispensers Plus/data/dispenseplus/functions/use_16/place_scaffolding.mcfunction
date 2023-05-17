function dispenseplus:find_dispenser_facing

#function dispenseplus:find_slot

#execute if entity @s[tag=slot0] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.0 bucket
#execute if entity @s[tag=slot1] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.1 bucket
#execute if entity @s[tag=slot2] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.2 bucket
#execute if entity @s[tag=slot3] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.3 bucket
#execute if entity @s[tag=slot4] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.4 bucket
#execute if entity @s[tag=slot5] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.5 bucket
#execute if entity @s[tag=slot6] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.6 bucket
#execute if entity @s[tag=slot7] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.7 bucket
#execute if entity @s[tag=slot8] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.8 bucket

#execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.id set value "minecraft:bucket"

tag @s[tag=up] add vertical
tag @s[tag=down] add vertical

tag @s[tag=north] add horizontal
tag @s[tag=south] add horizontal
tag @s[tag=east] add horizontal
tag @s[tag=west] add horizontal

tag @s remove up
tag @s remove down
tag @s remove north
tag @s remove south
tag @s remove east
tag @s remove west

summon armor_stand ~ ~ ~ {Tags:["temp"],Marker:1b,Invisible:1b}
scoreboard players set #count calc 0
execute if entity @s[tag=found,tag=vertical,tag=!followed] if block ~ ~ ~ scaffolding if block ~ ~ ~-1 #dispenseplus:scaffolding_follow run function dispenseplus:use/scaffolding/north
scoreboard players set #count calc 0
execute if entity @s[tag=found,tag=vertical,tag=!followed] if block ~ ~ ~ scaffolding if block ~-1 ~ ~ #dispenseplus:scaffolding_follow run function dispenseplus:use/scaffolding/west
scoreboard players set #count calc 0
execute if entity @s[tag=found,tag=vertical,tag=!followed] if block ~ ~ ~ scaffolding if block ~ ~ ~1 #dispenseplus:scaffolding_follow run function dispenseplus:use/scaffolding/south
scoreboard players set #count calc 0
execute if entity @s[tag=found,tag=vertical,tag=!followed] if block ~ ~ ~ scaffolding if block ~1 ~ ~ #dispenseplus:scaffolding_follow run function dispenseplus:use/scaffolding/east
execute if entity @s[tag=found,tag=horizontal] if block ~ ~ ~ scaffolding if block ~ ~1 ~ #dispenseplus:scaffolding_follow run function dispenseplus:use/scaffolding/up

execute at @s unless block ~ ~ ~ air run tag @s add blocked
tag @s[y=256,dy=100] add blocked
execute at @s if entity @s[tag=found] if block ~ ~ ~ air run setblock ~ ~ ~ scaffolding

execute if entity @s[tag=found,tag=!blocked] run playsound block.scaffolding.place block @a ~ ~ ~
execute if entity @s[tag=found,tag=!blocked] at @s run playsound block.scaffolding.place block @a ~ ~ ~
execute if entity @s[tag=found,tag=!blocked] run stopsound @a block block.dispenser.dispense


#kill @s[tag=found,tag=inserted]
tp @s[tag=blocked] @e[tag=temp,limit=1,sort=nearest]
kill @e[tag=temp,limit=1,sort=nearest]
kill @s[tag=found,tag=!blocked]

kill @e[tag=dispenseplus,limit=1,sort=nearest]

tag @s remove found
tag @s remove slot0
tag @s remove slot1
tag @s remove slot2
tag @s remove slot3
tag @s remove slot4
tag @s remove slot5
tag @s remove slot6
tag @s remove slot7
tag @s remove slot8

tag @s add processed