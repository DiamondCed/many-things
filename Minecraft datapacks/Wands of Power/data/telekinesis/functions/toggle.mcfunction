tag @s[tag=hasInactiveTkOffhand] add hasTkOffhand
tag @s[tag=hasActiveTkOffhand] add hasTkOffhand
tag @s[tag=hasInactiveTkMainhand] add hasTkMainhand
tag @s[tag=hasActiveTkMainhand] add hasTkMainhand

tag @s[tag=hasInactiveTkOffhand] add hasInactiveTk
tag @s[tag=hasActiveTkOffhand] add hasActiveTk
tag @s[tag=hasInactiveTkMainhand] add hasInactiveTk
tag @s[tag=hasActiveTkMainhand] add hasActiveTk

data modify storage tk temp set from entity @s[tag=hasTkOffhand] Inventory[{Slot:-106b}]
data modify storage tk temp set from entity @s[tag=hasTkMainhand] SelectedItem

execute if entity @s[tag=hasInactiveTk] run data modify storage tk temp.tag.Active set value 1b
execute if entity @s[tag=hasActiveTk] run data modify storage tk temp.tag.Active set value 0b
execute if entity @s[tag=hasInactiveTk] run data modify storage tk temp.tag.CustomModelData set value 59
execute if entity @s[tag=hasActiveTk] run data modify storage tk temp.tag.CustomModelData set value 58

summon armor_stand ~ ~ ~ {Tags:["current"],Marker:1b,Invisible:1b}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage tk temp
item replace entity @s[tag=hasTkMainhand] weapon.mainhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
item replace entity @s[tag=hasTkOffhand] weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest

tag @s[tag=hasTkMainhand,tag=hasActiveTk] remove hasActiveTkMainhand
tag @s[tag=hasTkMainhand,tag=hasActiveTk] add hasInactiveTkMainhand
tag @s[tag=hasTkMainhand,tag=hasInactiveTk] remove hasInactiveTkMainhand
tag @s[tag=hasTkMainhand,tag=hasInactiveTk] add hasActiveTkMainhand
tag @s[tag=hasTkOffhand,tag=hasActiveTk] remove hasActiveTkOffhand
tag @s[tag=hasTkOffhand,tag=hasActiveTk] add hasInactiveTkOffhand
tag @s[tag=hasTkOffhand,tag=hasInactiveTk] remove hasInactiveTkOffhand
tag @s[tag=hasTkOffhand,tag=hasInactiveTk] add hasActiveTkOffhand

kill @e[tag=current]
tag @s remove hasTkOffhand
tag @s remove hasTkMainhand
tag @s remove hasInactiveTk
tag @s remove hasActiveTk