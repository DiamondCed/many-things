summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["cmodeltemp"],ArmorItems:[{},{},{},{}]}
item replace entity @e[tag=cmodeltemp,limit=1,sort=nearest] weapon.mainhand from entity @s weapon.mainhand
execute store result entity @e[tag=cmodeltemp,limit=1,sort=nearest] HandItems[0].tag.CustomModelData int 1 run scoreboard players get @s CustomModelData
item replace entity @s weapon.mainhand from entity @e[tag=cmodeltemp,limit=1,sort=nearest] weapon.mainhand
kill @e[tag=cmodeltemp,limit=1,sort=nearest]