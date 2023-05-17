kill @e[type=item,nbt={Item:{id:"minecraft:gold_block",Count:1b}},limit=1,sort=nearest]

data merge entity @s {Item:{tag:{upgradedShield:1b,goldenShield:1b,HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:cbo,Color:8},{Pattern:bo,Color:4},{Pattern:mr,Color:0}],Base:4},AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Slot:"offhand",Amount:6,Operation:0,UUID:[I;4,4,4,4]},{AttributeName:"generic.luck",Name:"generic.luck",Slot:"offhand",Amount:1,Operation:0,UUID:[I;5,5,5,5]}]}}}

execute unless data entity @s Item.tag.display run data modify entity @s Item.tag.display set value {Name:'{"text":"Golden Shield","italic":false}'}