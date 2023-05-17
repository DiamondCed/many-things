#loot spawn ~ ~ ~ loot blocks/quantum_storage

kill @e[type=item,nbt={Item:{id:"minecraft:iron_block",Count:4b}},distance=..1,limit=1]
kill @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",Count:2b}},distance=..1,limit=1]

data modify entity @s Item set value {id:"minecraft:glow_item_frame",Count:1b,tag:{CustomModelData:1,display:{Name:'{"text":"Quantum Storage Unit","color":"yellow","italic":false}'},EntityTag:{Facing:1b,Silent:1b,Invisible:1b,Fixed:1b,Tags:[qstore,init],Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:1,DeepItems:[]}}}}}