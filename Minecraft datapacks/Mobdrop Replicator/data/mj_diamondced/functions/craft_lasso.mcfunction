data modify entity @s Item.Count set value 1b
data modify entity @s Item.id set value "minecraft:warped_fungus_on_a_stick"
data modify entity @s Item.tag.CustomModelData set value 1b
data modify entity @s Item.tag.IsLasso set value 1b
kill @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:2b}},limit=1,sort=nearest]
kill @e[type=item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b}},limit=1,sort=nearest]
data modify entity @s Item.tag.display.Name set value '{"text":"Lasso","italic":false,"color":"yellow"}'