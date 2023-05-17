tag @s[tag=hasInactiveExcOffhand] add hasExcOffhand
tag @s[tag=hasActiveExcOffhand] add hasExcOffhand
tag @s[tag=hasInactiveExcMainhand] add hasExcMainhand
tag @s[tag=hasActiveExcMainhand] add hasExcMainhand

tag @s[tag=hasInactiveExcOffhand] add hasInactiveExc
tag @s[tag=hasActiveExcOffhand] add hasActiveExc
tag @s[tag=hasInactiveExcMainhand] add hasInactiveExc
tag @s[tag=hasActiveExcMainhand] add hasActiveExc

data modify storage exc temp set from entity @s[tag=hasExcOffhand] Inventory[{Slot:-106b}]
data modify storage exc temp set from entity @s[tag=hasExcMainhand] SelectedItem

execute if entity @s[tag=hasInactiveExc] run data modify storage exc temp.tag.Active set value 1b
execute if entity @s[tag=hasActiveExc] run data modify storage exc temp.tag.Active set value 0b
execute if entity @s[tag=hasInactiveExc] run data modify storage exc temp.tag.CustomModelData set value 69
execute if entity @s[tag=hasActiveExc] run data modify storage exc temp.tag.CustomModelData set value 68

summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage exc temp
item replace entity @s[tag=hasExcMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasExcOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

tag @s[tag=hasExcMainhand,tag=hasActiveExc] remove hasActiveExcMainhand
tag @s[tag=hasExcMainhand,tag=hasActiveExc] add hasInactiveExcMainhand
tag @s[tag=hasExcMainhand,tag=hasInactiveExc] remove hasInactiveExcMainhand
tag @s[tag=hasExcMainhand,tag=hasInactiveExc] add hasActiveExcMainhand
tag @s[tag=hasExcOffhand,tag=hasActiveExc] remove hasActiveExcOffhand
tag @s[tag=hasExcOffhand,tag=hasActiveExc] add hasInactiveExcOffhand
tag @s[tag=hasExcOffhand,tag=hasInactiveExc] remove hasInactiveExcOffhand
tag @s[tag=hasExcOffhand,tag=hasInactiveExc] add hasActiveExcOffhand

kill @e[tag=current]
tag @s remove hasExcOffhand
tag @s remove hasExcMainhand
tag @s remove hasInactiveExc
tag @s remove hasActiveExc