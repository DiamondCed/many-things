tag @s[tag=hasInactiveDesOffhand] add hasDesOffhand
tag @s[tag=hasActiveDesOffhand] add hasDesOffhand
tag @s[tag=hasInactiveDesMainhand] add hasDesMainhand
tag @s[tag=hasActiveDesMainhand] add hasDesMainhand

tag @s[tag=hasInactiveDesOffhand] add hasInactiveDes
tag @s[tag=hasActiveDesOffhand] add hasActiveDes
tag @s[tag=hasInactiveDesMainhand] add hasInactiveDes
tag @s[tag=hasActiveDesMainhand] add hasActiveDes

data modify storage des temp set from entity @s[tag=hasDesOffhand] Inventory[{Slot:-106b}]
data modify storage des temp set from entity @s[tag=hasDesMainhand] SelectedItem

execute if entity @s[tag=hasInactiveDes] run data modify storage des temp.tag.Active set value 1b
execute if entity @s[tag=hasActiveDes] run data modify storage des temp.tag.Active set value 0b
execute if entity @s[tag=hasInactiveDes] run data modify storage des temp.tag.CustomModelData set value 71
execute if entity @s[tag=hasActiveDes] run data modify storage des temp.tag.CustomModelData set value 70

summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage des temp
item replace entity @s[tag=hasDesMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasDesOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

tag @s[tag=hasDesMainhand,tag=hasActiveDes] remove hasActiveDesMainhand
tag @s[tag=hasDesMainhand,tag=hasActiveDes] add hasInactiveDesMainhand
tag @s[tag=hasDesMainhand,tag=hasInactiveDes] remove hasInactiveDesMainhand
tag @s[tag=hasDesMainhand,tag=hasInactiveDes] add hasActiveDesMainhand
tag @s[tag=hasDesOffhand,tag=hasActiveDes] remove hasActiveDesOffhand
tag @s[tag=hasDesOffhand,tag=hasActiveDes] add hasInactiveDesOffhand
tag @s[tag=hasDesOffhand,tag=hasInactiveDes] remove hasInactiveDesOffhand
tag @s[tag=hasDesOffhand,tag=hasInactiveDes] add hasActiveDesOffhand

kill @e[tag=current]
tag @s remove hasDesOffhand
tag @s remove hasDesMainhand
tag @s remove hasInactiveDes
tag @s remove hasActiveDes