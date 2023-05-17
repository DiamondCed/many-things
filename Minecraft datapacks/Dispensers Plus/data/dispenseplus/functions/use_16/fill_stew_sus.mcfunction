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

execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item.id set value "minecraft:suspicious_stew"

execute if entity @s[tag=found] run playsound minecraft:entity.mooshroom.milk block @a
execute if entity @s[tag=found] run stopsound @a block block.dispenser.dispense

#execute if entity @s[tag=found] run setblock ~ ~ ~ cauldron[level=3]

data modify storage temp Item set value {id:"minecraft:suspicious_stew",Count:1b,tag:{Effects:[{EffectId:-1b,EffectDuration:-1}]}}
execute if entity @s[tag=found] as @e[type=mooshroom,dx=0,dy=0,dz=0] if data entity @s EffectId run tag @s add temp
execute if entity @s[tag=found] as @e[tag=temp,limit=1] run data modify storage temp Item.tag.Effects[0].EffectId set from entity @s EffectId
execute if entity @s[tag=found] as @e[tag=temp,limit=1] run data modify entity @s EffectId set value -1b
tag @e remove temp
execute if data storage temp Item{tag:{Effects:[{EffectId:12b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 80
execute if data storage temp Item{tag:{Effects:[{EffectId:15b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 160
execute if data storage temp Item{tag:{Effects:[{EffectId:23b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 7
execute if data storage temp Item{tag:{Effects:[{EffectId:8b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 120
execute if data storage temp Item{tag:{Effects:[{EffectId:19b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 240
execute if data storage temp Item{tag:{Effects:[{EffectId:10b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 160
execute if data storage temp Item{tag:{Effects:[{EffectId:16b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 100
execute if data storage temp Item{tag:{Effects:[{EffectId:18b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 180
execute if data storage temp Item{tag:{Effects:[{EffectId:20b}]}} run data modify storage temp Item.tag.Effects[0].EffectDuration set value 160

execute if entity @s[tag=slot0] run data modify storage temp Item.Slot set value 0b
execute if entity @s[tag=slot1] run data modify storage temp Item.Slot set value 1b
execute if entity @s[tag=slot2] run data modify storage temp Item.Slot set value 2b
execute if entity @s[tag=slot3] run data modify storage temp Item.Slot set value 3b
execute if entity @s[tag=slot4] run data modify storage temp Item.Slot set value 4b
execute if entity @s[tag=slot5] run data modify storage temp Item.Slot set value 5b
execute if entity @s[tag=slot6] run data modify storage temp Item.Slot set value 6b
execute if entity @s[tag=slot7] run data modify storage temp Item.Slot set value 7b
execute if entity @s[tag=slot8] run data modify storage temp Item.Slot set value 8b

execute if entity @s[tag=inserted] at @e[tag=dispenseplus,limit=1,sort=nearest] run data modify block ~ ~ ~ Items append from storage temp Item
execute if entity @s[tag=found,tag=!inserted] run data modify entity @s Item set from storage temp Item

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