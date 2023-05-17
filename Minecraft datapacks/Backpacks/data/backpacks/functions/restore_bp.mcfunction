data modify storage backpacks temp set from entity @s Inventory[{Slot:-106b}]

# add UUID to backpack if it doesn't ahve one already
execute unless data storage backpacks temp.tag.UUID run tag @s add processUUID
execute if entity @s[tag=processUUID] run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["IDStand"]}
execute if entity @s[tag=processUUID] run data modify storage backpacks temp.tag.UUID set from entity @e[tag=IDStand,limit=1,sort=nearest] UUID[0]
execute if entity @s[tag=processUUID] run kill @e[tag=IDStand]

# this is always done
summon armor_stand ~ ~ ~ {Tags:["current"],Invisible:1b,Marker:1b}

# continue adding UUID to backpack 
execute if entity @s[tag=processUUID] run data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
execute if entity @s[tag=processUUID] run data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp
execute if entity @s[tag=processUUID] run item replace entity @s weapon.offhand from entity @e[tag=current,limit=1,sort=nearest] armor.chest
tag @s remove processUUID

# normal code
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:15b}]
item replace entity @s container.15 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:16b}]
item replace entity @s container.16 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:17b}]
item replace entity @s container.17 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:24b}]
item replace entity @s container.24 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:25b}]
item replace entity @s container.25 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:26b}]
item replace entity @s container.26 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:33b}]
item replace entity @s container.33 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:34b}]
item replace entity @s container.34 from entity @e[tag=current,limit=1,sort=nearest] armor.chest
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set value {}
data modify entity @e[tag=current,limit=1,sort=nearest] ArmorItems[2] set from storage backpacks temp.tag.BagItems[{Slot:35b}]
item replace entity @s container.35 from entity @e[tag=current,limit=1,sort=nearest] armor.chest

kill @e[tag=current,limit=1,sort=nearest]