tag @s add current
execute as @e[tag=storagebp] if score @s playeridbp = @e[tag=current,limit=1] playeridbp run tag @s add receiver

data modify storage backpacks temp set value []

data modify storage backpacks temp append from entity @s Inventory[{Slot:15b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:16b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:17b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:24b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:25b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:26b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:33b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:34b}]
data modify storage backpacks temp append from entity @s Inventory[{Slot:35b}]

data modify entity @e[tag=receiver,limit=1] HandItems[0].tag.BlockEntityData.Items set from storage backpacks temp

tag @e remove receiver
tag @s remove current