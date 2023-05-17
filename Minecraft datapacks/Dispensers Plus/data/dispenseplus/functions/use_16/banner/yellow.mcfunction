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

#execute if entity @s[tag=found] run playsound item.book.put block @a ~ ~ ~
#execute if entity @s[tag=found] run stopsound @a block block.dispenser.dispense

execute if entity @s[tag=found,tag=!down] if block ~ ~ ~ #banners run loot spawn ~ ~ ~ mine ~ ~ ~
execute if entity @s[tag=found,tag=!down] if block ~ ~ ~ #banners run data modify entity @e[type=item,nbt={Age:0s},tag=!found,limit=1,sort=nearest] Age set value 2s
execute if entity @s[tag=found,tag=west] run setblock ~ ~ ~ yellow_wall_banner[facing=west]
execute if entity @s[tag=found,tag=east] run setblock ~ ~ ~ yellow_wall_banner[facing=east]
execute if entity @s[tag=found,tag=north] run setblock ~ ~ ~ yellow_wall_banner[facing=north]
execute if entity @s[tag=found,tag=south] run setblock ~ ~ ~ yellow_wall_banner[facing=south]
execute if entity @s[tag=found,tag=up] run setblock ~ ~ ~ yellow_banner[rotation=12]
execute if entity @s[tag=found,tag=down] run tag @s remove found
tag @s remove down
execute if entity @s[tag=found] run data modify block ~ ~ ~ Patterns set from entity @s Item.tag.BlockEntityTag.Patterns

#kill @s[tag=found,tag=inserted]
kill @s[tag=found]

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