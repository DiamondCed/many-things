kill @e[type=item,nbt={Item:{tag:{isDebuffVenom:1b}}},limit=1,sort=nearest]
data remove entity @s Item.tag.isFeralClaws
data modify entity @s Item.tag.isUpgradedClaws set value 1b
data modify entity @s Item.tag.CustomModelData set value 44
data modify entity @s Item.tag.isDebuffVenom set value 1b
data modify entity @s Item.tag.display.Name set value '{"text":"Venomous Claws","italic":false,"color":"gold"}'