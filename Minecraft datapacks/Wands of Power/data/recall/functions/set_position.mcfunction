# store the recall position and dimension in the wand
data modify storage rc temp set from entity @s[tag=hasRcOffhand] Inventory[{Slot:-106b}]
data modify storage rc temp set from entity @s[tag=hasRcMainhand] SelectedItem

 # loop through all options to remove any with the same dimension as we are in currently
data modify storage rc deDuplicateL1 set from storage rc temp.tag.RecallPositions
data modify storage rc deDuplicateL2 set value []
data modify storage rc deDuplicateCompare set from entity @s Dimension
function recall:deduplicate
data modify storage rc temp.tag.RecallPositions set from storage rc deDuplicateL2

 # add a new data point, now that any in the current dimension are gone
data modify storage rc temp.tag.RecallPositions append value {}
data modify storage rc temp.tag.RecallPositions[-1].Position set from entity @s Pos
data modify storage rc temp.tag.RecallPositions[-1].Rotation set from entity @s Rotation
data modify storage rc temp.tag.RecallPositions[-1].Dimension set from entity @s Dimension

 # copy the wand back over to the player
summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage rc temp
item replace entity @s[tag=hasRcMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasRcOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

kill @e[tag=current]

# spawn particles
particle minecraft:portal ~ ~0.95 ~ 0 0.33 0 1 200

# play noise?


# spawn actionbar message
execute store result score #dispX calc run data get entity @s Pos[0]
execute store result score #dispY calc run data get entity @s Pos[1]
execute store result score #dispZ calc run data get entity @s Pos[2]
title @s actionbar [{"text":"Set recall point to ","color":"#7777ff"},{"score":{"objective":"calc","name":"#dispX"},"color":"#ffffff"},{"text":" "},{"score":{"objective":"calc","name":"#dispY"},"color":"#ffffff"},{"text":" "},{"score":{"objective":"calc","name":"#dispZ"},"color":"#ffffff"},{"text":" in "},{"nbt":"Dimension","entity":"@s","color":"#ffffff"}]
