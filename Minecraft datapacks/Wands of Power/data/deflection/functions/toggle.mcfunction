tag @s[tag=hasInactiveDefOffhand] add hasDefOffhand
tag @s[tag=hasActiveDefOffhand] add hasDefOffhand
tag @s[tag=hasInactiveDefMainhand] add hasDefMainhand
tag @s[tag=hasActiveDefMainhand] add hasDefMainhand

tag @s[tag=hasInactiveDefOffhand] add hasInactiveDef
tag @s[tag=hasActiveDefOffhand] add hasActiveDef
tag @s[tag=hasInactiveDefMainhand] add hasInactiveDef
tag @s[tag=hasActiveDefMainhand] add hasActiveDef

data modify storage def temp set from entity @s[tag=hasDefOffhand] Inventory[{Slot:-106b}]
data modify storage def temp set from entity @s[tag=hasDefMainhand] SelectedItem

execute if entity @s[tag=hasInactiveDef] run data modify storage def temp.tag.Active set value 1b
execute if entity @s[tag=hasActiveDef] run data modify storage def temp.tag.Active set value 0b
execute if entity @s[tag=hasInactiveDef] run data modify storage def temp.tag.CustomModelData set value 61
execute if entity @s[tag=hasActiveDef] run data modify storage def temp.tag.CustomModelData set value 60

summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage def temp
item replace entity @s[tag=hasDefMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasDefOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

tag @s[tag=hasDefMainhand,tag=hasActiveDef] remove hasActiveDefMainhand
tag @s[tag=hasDefMainhand,tag=hasActiveDef] add hasInactiveDefMainhand
tag @s[tag=hasDefMainhand,tag=hasInactiveDef] remove hasInactiveDefMainhand
tag @s[tag=hasDefMainhand,tag=hasInactiveDef] add hasActiveDefMainhand
tag @s[tag=hasDefOffhand,tag=hasActiveDef] remove hasActiveDefOffhand
tag @s[tag=hasDefOffhand,tag=hasActiveDef] add hasInactiveDefOffhand
tag @s[tag=hasDefOffhand,tag=hasInactiveDef] remove hasInactiveDefOffhand
tag @s[tag=hasDefOffhand,tag=hasInactiveDef] add hasActiveDefOffhand

kill @e[tag=current]
tag @s remove hasDefOffhand
tag @s remove hasDefMainhand
tag @s remove hasInactiveDef
tag @s remove hasActiveDef