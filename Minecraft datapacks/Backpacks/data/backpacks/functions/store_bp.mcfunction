# before anything, check if the player swapped backpacks
execute store result score #temp prevbpID run data get entity @s Inventory[{Slot:-106b}].tag.UUID
execute unless score @s prevbpID = #temp prevbpID run function backpacks:restore_bp


execute run data modify storage backpacks temp set from entity @s Inventory[{Slot:-106b}]
execute run data remove storage backpacks temp.tag.BagItems
execute run data modify storage backpacks temp.tag.BagItems set value []

execute unless entity @s[nbt={Inventory:[{Slot:15b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:15b}]
execute unless entity @s[nbt={Inventory:[{Slot:16b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:16b}]
execute unless entity @s[nbt={Inventory:[{Slot:17b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:17b}]
execute unless entity @s[nbt={Inventory:[{Slot:24b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:24b}]
execute unless entity @s[nbt={Inventory:[{Slot:25b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:25b}]
execute unless entity @s[nbt={Inventory:[{Slot:26b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:26b}]
execute unless entity @s[nbt={Inventory:[{Slot:33b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:33b}]
execute unless entity @s[nbt={Inventory:[{Slot:34b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:34b}]
execute unless entity @s[nbt={Inventory:[{Slot:35b,tag:{isBackpack:1b}}]}] run data modify storage backpacks temp.tag.BagItems append from entity @s Inventory[{Slot:35b}]

summon armor_stand ~ ~ ~ {Tags:["current"],Invisible:1b,Marker:1b}
execute run data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp
item replace entity @s weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

kill @e[tag=current,limit=1,sort=nearest]