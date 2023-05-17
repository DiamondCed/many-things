kill @e[type=item,nbt={Item:{tag:{isRegen:1b}}},limit=1,sort=nearest]
data modify entity @s Item.tag.isLifeCuffs set value 1b
data modify entity @s Item.tag.CustomModelData set value 33
data remove entity @s Item.tag.isShackle
data modify entity @s Item.tag.isRegen set value 1b
data modify entity @s Item.tag.display.Name set value '{"text":"Life Cuffs","italic":false,"color":"green"}'