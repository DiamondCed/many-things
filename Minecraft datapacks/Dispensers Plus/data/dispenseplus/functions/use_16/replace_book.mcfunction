function dispenseplus:find_dispenser

function dispenseplus:find_slot

execute if entity @s[tag=slot0] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.0 structure_void
execute if entity @s[tag=slot1] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.1 structure_void
execute if entity @s[tag=slot2] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.2 structure_void
execute if entity @s[tag=slot3] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.3 structure_void
execute if entity @s[tag=slot4] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.4 structure_void
execute if entity @s[tag=slot5] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.5 structure_void
execute if entity @s[tag=slot6] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.6 structure_void
execute if entity @s[tag=slot7] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.7 structure_void
execute if entity @s[tag=slot8] at @e[tag=dispenseplus,limit=1,sort=nearest] run replaceitem block ~ ~ ~ container.8 structure_void

#execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.id set value "minecraft:structure_void"

execute if entity @s[tag=found] run playsound item.book.put block @a ~ ~ ~
execute if entity @s[tag=found] run stopsound @a block block.dispenser.dispense

execute if entity @s[tag=found] run data modify storage temp Book set from block ~ ~ ~ Book
execute if entity @s[tag=found] run data modify block ~ ~ ~ Book set from entity @s Item
execute if entity @s[tag=found] run data modify entity @s Item set from storage temp Book

execute if entity @s[tag=slot0] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 0b
execute if entity @s[tag=slot1] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 1b
execute if entity @s[tag=slot2] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 2b
execute if entity @s[tag=slot3] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 3b
execute if entity @s[tag=slot4] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 4b
execute if entity @s[tag=slot5] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 5b
execute if entity @s[tag=slot6] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 6b
execute if entity @s[tag=slot7] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 7b
execute if entity @s[tag=slot8] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify storage temp Book.Slot set value 8b
execute if entity @s[tag=inserted] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify block ~ ~ ~ Items append from storage temp Book
execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item set from storage temp Book


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