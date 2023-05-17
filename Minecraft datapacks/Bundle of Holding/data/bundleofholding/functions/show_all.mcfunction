summon armor_stand ~ 0 ~ {Marker:1b,Invisible:1b,Tags:["tempBoH","current"]}

item replace entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] weapon.offhand from entity @s weapon.offhand
data modify entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[1].tag.Items set from entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[1].tag.DeepItems

data remove entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[1].tag.DeepItems

item replace entity @s weapon.offhand from entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] weapon.offhand

kill @e[tag=tempBoH,tag=current,limit=1,sort=nearest]