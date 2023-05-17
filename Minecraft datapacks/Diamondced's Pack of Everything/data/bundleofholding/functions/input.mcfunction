summon armor_stand ~ 0 ~ {Marker:1b,Invisible:1b,Tags:["tempBoH","current"]}

item replace entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] weapon.mainhand from entity @s weapon.mainhand
data modify entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[0].tag.DeepItems prepend from entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[0].tag.Items[-1]

data remove entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] HandItems[0].tag.Items[-1]

item replace entity @s weapon.mainhand from entity @e[tag=tempBoH,tag=current,limit=1,sort=nearest] weapon.mainhand

kill @e[tag=tempBoH,tag=current,limit=1,sort=nearest]