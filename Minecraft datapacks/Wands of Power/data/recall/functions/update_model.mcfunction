data modify storage rc temp set from entity @s[tag=hasRcOffhand] Inventory[{Slot:-106b}]
data modify storage rc temp set from entity @s[tag=hasRcMainhand] SelectedItem

# store the old and new custommodeldata values, to see if it changed in the first place
execute store result score #oldVal calc run data get storage rc temp.tag.CustomModelData

execute if entity @s[scores={buildup_rc=1..}] run data modify storage rc temp.tag.CustomModelData set value 67
execute if entity @s[scores={buildup_rc=0}] run data modify storage rc temp.tag.CustomModelData set value 66

execute store result score #newVal calc run data get storage rc temp.tag.CustomModelData

#execute unless score #oldVal calc = #newVal calc run tellraw @s [{"text":"old: "},{"score":{"objective":"calc","name":"#oldVal"}},{"text":", new:"},{"score":{"objective":"calc","name":"#newVal"}}]

# if the model data didn't change, then don't bother copying it over, to prevent the item constantly bobbing up and down
summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage rc temp
execute unless score #oldVal calc = #newVal calc run item replace entity @s[tag=hasRcMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
execute unless score #oldVal calc = #newVal calc run item replace entity @s[tag=hasRcOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

kill @e[tag=current]