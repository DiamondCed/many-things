#store stack size target and update visuals to indicate so
execute if entity @s[tag=init_stack] store result score @s stack_target run data get block ~ ~ ~ Items[0].Count
execute if entity @s[tag=init_stack] run data modify entity @s Item.tag.CustomModelData set value 2
execute if entity @s[tag=init_stack] run playsound minecraft:block.beacon.power_select block @p ~ ~ ~ 1 1.5
tag @s remove init_stack

#check against target stack size
execute store result score #temp stack_target run data get block ~ ~ ~ Items[0].Count
execute if score #temp stack_target >= @s stack_target run tag @s add transfer

#move item from input slot to first slot of deep storage, remove slot number
execute if entity @s[tag=transfer] run data modify entity @s Item.tag.DeepItems prepend from block ~ ~ ~ Items[0]
execute if entity @s[tag=transfer] run data remove entity @s Item.tag.DeepItems[0].Slot
execute if entity @s[tag=transfer] run data remove block ~ ~ ~ Items[0]

tag @s remove transfer