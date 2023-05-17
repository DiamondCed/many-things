kill @e[type=item,nbt={Item:{tag:{isBoots:1b}}},limit=1,sort=nearest]
data modify entity @s Item.tag.isSpectreBoots set value 1b
data modify entity @s Item.tag.CustomModelData set value 26
data modify entity @s Item.tag.isBoots set value 1b
data modify entity @s Item.tag.display.Name set value '{"text":"Spectre Boots","italic":false,"color":"red"}'