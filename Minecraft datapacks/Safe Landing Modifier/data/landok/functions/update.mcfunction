execute as @e[type=item,nbt={Item:{id:"minecraft:leather_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:chainmail_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:golden_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:iron_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:diamond_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:netherite_boots"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:shulker_shell",Count:1b}}] run function landok:addattribute

execute as @a[nbt={Inventory:[{Slot:100b,tag:{landok:1b}}]}] at @s run function landok:preventfall
