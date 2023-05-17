kill @e[type=item,nbt={Item:{tag:{isDebuffSlow:1b}}},limit=1,sort=nearest]
data remove entity @s Item.tag.isFeralClaws
data modify entity @s Item.tag.isUpgradedClaws set value 1b
data modify entity @s Item.tag.CustomModelData set value 46
data modify entity @s Item.tag.isDebuffSlow set value 1b
data modify entity @s Item.tag.display.Name set value '{"text":"Frost Claws","italic":false,"color":"gold"}'