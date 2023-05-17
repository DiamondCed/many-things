tag @s[tag=hasInactiveCjrOffhand] add hasCjrOffhand
tag @s[tag=hasActiveCjrOffhand] add hasCjrOffhand
tag @s[tag=hasInactiveCjrMainhand] add hasCjrMainhand
tag @s[tag=hasActiveCjrMainhand] add hasCjrMainhand

tag @s[tag=hasInactiveCjrOffhand] add hasInactiveCjr
tag @s[tag=hasActiveCjrOffhand] add hasActiveCjr
tag @s[tag=hasInactiveCjrMainhand] add hasInactiveCjr
tag @s[tag=hasActiveCjrMainhand] add hasActiveCjr

tag @s[tag=hasMode0CjrOffhand] add hasMode0Cjr
tag @s[tag=hasMode1CjrOffhand] add hasMode1Cjr
tag @s[tag=hasMode0CjrMainhand] add hasMode0Cjr
tag @s[tag=hasMode1CjrMainhand] add hasMode1Cjr

data modify storage cjr temp set from entity @s[tag=hasCjrOffhand] Inventory[{Slot:-106b}]
data modify storage cjr temp set from entity @s[tag=hasCjrMainhand] SelectedItem

execute if entity @s[tag=hasInactiveCjr] run data modify storage cjr temp.tag.Active set value 1b
execute if entity @s[tag=hasActiveCjr] run data modify storage cjr temp.tag.Active set value 0b
execute if entity @s[tag=hasInactiveCjr,tag=hasMode1Cjr] run data modify storage cjr temp.tag.CustomModelData set value 65
execute if entity @s[tag=hasActiveCjr,tag=hasMode1Cjr] run data modify storage cjr temp.tag.CustomModelData set value 64
execute if entity @s[tag=hasInactiveCjr,tag=hasMode0Cjr] run data modify storage cjr temp.tag.CustomModelData set value 63
execute if entity @s[tag=hasActiveCjr,tag=hasMode0Cjr] run data modify storage cjr temp.tag.CustomModelData set value 62

summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage cjr temp
item replace entity @s[tag=hasCjrMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasCjrOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

tag @s[tag=hasCjrMainhand,tag=hasActiveCjr] remove hasActiveCjrMainhand
tag @s[tag=hasCjrMainhand,tag=hasActiveCjr] add hasInactiveCjrMainhand
tag @s[tag=hasCjrMainhand,tag=hasInactiveCjr] remove hasInactiveCjrMainhand
tag @s[tag=hasCjrMainhand,tag=hasInactiveCjr] add hasActiveCjrMainhand
tag @s[tag=hasCjrOffhand,tag=hasActiveCjr] remove hasActiveCjrOffhand
tag @s[tag=hasCjrOffhand,tag=hasActiveCjr] add hasInactiveCjrOffhand
tag @s[tag=hasCjrOffhand,tag=hasInactiveCjr] remove hasInactiveCjrOffhand
tag @s[tag=hasCjrOffhand,tag=hasInactiveCjr] add hasActiveCjrOffhand

kill @e[tag=current]
tag @s remove hasCjrOffhand
tag @s remove hasCjrMainhand
tag @s remove hasInactiveCjr
tag @s remove hasActiveCjr
tag @s remove hasMode0Cjr
tag @s remove hasMode1Cjr