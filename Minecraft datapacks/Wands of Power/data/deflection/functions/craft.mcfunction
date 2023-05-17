kill @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1,limit=1]
kill @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",Count:1b}},distance=..1,limit=1]
kill @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1,limit=1]

data modify entity @s Item set value {id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{Unbreakable:1b,HideFlags:4,isDefItem:1b,Active:0b,CustomModelData:60,display:{Name:'{"text":"Wand of Deflection","italic":false,"color":"yellow"}'}}}