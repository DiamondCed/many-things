kill @e[type=item,nbt={Item:{id:"minecraft:iron_block",Count:1b}},limit=1,sort=nearest]

data merge entity @s {Item:{tag:{upgradedShield:1b,ironShield:1b,HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:cbo,Color:8},{Pattern:bo,Color:0}],Base:0},AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Slot:"offhand",Amount:6,Operation:0,UUID:[I;1,1,1,1]},{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Slot:"offhand",Amount:-0.1,Operation:1,UUID:[I;2,2,2,2]}]}}}

execute unless data entity @s Item.tag.display run data modify entity @s Item.tag.display set value {Name:'{"text":"Iron Shield","italic":false}'}