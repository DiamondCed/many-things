execute unless entity @p[gamemode=creative] run loot spawn ~ ~ ~ loot blocks/quantum_storage
execute unless entity @p[gamemode=creative] run kill @e[type=item,nbt={Item:{id:"minecraft:barrel",tag:{display:{Name:'{"text":"Quantum Storage Unit"}'}}}},limit=1,sort=nearest]
execute if data entity @s Item.tag.DeepItems[0] run function qstore:recursive_drop
kill @s