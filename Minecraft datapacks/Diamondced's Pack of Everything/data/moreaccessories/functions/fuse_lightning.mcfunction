kill @e[type=item,nbt={Item:{tag:{isAglet:1b}}},limit=1,sort=nearest]
kill @e[type=item,nbt={Item:{tag:{isAnklet:1b}}},limit=1,sort=nearest]
data modify entity @s Item.tag.isLBoots set value 1b
data modify entity @s Item.tag.CustomModelData set value 37
data modify entity @s Item.tag.display.Name set value '{"text":"Lightning Boots","italic":false,"color":"light_purple"}'