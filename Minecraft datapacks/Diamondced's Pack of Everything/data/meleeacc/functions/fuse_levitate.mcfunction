kill @e[type=item,nbt={Item:{tag:{isDebuffLevitate:1b}}},limit=1,sort=nearest]
data remove entity @s Item.tag.isFeralClaws
data modify entity @s Item.tag.isUpgradedClaws set value 1b
data modify entity @s Item.tag.CustomModelData set value 48
data modify entity @s Item.tag.isDebuffLevitate set value 1b
data modify entity @s Item.tag.display.Name set value '{"text":"Shulker Claws","italic":false,"color":"gold"}'