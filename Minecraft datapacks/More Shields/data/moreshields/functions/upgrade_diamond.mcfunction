kill @e[type=item,nbt={Item:{id:"minecraft:diamond_block",Count:1b}},limit=1,sort=nearest]

data merge entity @s {Item:{tag:{upgradedShield:1b,diamondShield:1b,HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:cbo,Color:8},{Pattern:sc,Color:0},{Pattern:bts,Color:0},{Pattern:tts,Color:0},{Pattern:bo,Color:3},{Pattern:flo,Color:0}],Base:3},AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Slot:"offhand",Amount:4,Operation:0,UUID:[I;6,6,6,6]},{AttributeName:"generic.armor",Name:"generic.armor",Slot:"offhand",Amount:6,Operation:0,UUID:[I;7,7,7,7]}]}}}

execute unless data entity @s Item.tag.display run data modify entity @s Item.tag.display set value {Name:'{"text":"Diamond Shield","italic":false}'}