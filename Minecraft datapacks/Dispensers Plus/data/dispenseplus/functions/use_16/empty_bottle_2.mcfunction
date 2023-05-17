function dispenseplus:find_dispenser

function dispenseplus:find_slot

execute if entity @s[tag=slot0] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.0 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot1] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.1 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot2] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.2 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot3] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.3 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot4] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.4 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot5] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.5 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot6] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.6 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot7] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.7 potion{Potion:"minecraft:water"}
execute if entity @s[tag=slot8] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.8 potion{Potion:"minecraft:water"}

execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.id set value "minecraft:potion"
execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.tag set value {Potion:"minecraft:water"}

execute if entity @s[tag=found] run playsound item.bottle.fill block @a
execute if entity @s[tag=found] run stopsound @a block block.dispenser.dispense

execute if entity @s[tag=found] run setblock ~ ~ ~ cauldron[level=2]

kill @s[tag=found,tag=inserted]

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