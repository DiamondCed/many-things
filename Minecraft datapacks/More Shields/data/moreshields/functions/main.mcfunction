execute as @e[type=item,nbt={Item:{id:"minecraft:shield"}}] unless entity @s[nbt={Item:{tag:{upgradedShield:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[distance=..1, type=item, nbt={Item:{id:"minecraft:iron_block",Count:1b}}] run function moreshields:upgrade_iron

execute as @e[type=item,nbt={Item:{id:"minecraft:shield"}}] unless entity @s[nbt={Item:{tag:{upgradedShield:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[distance=..1, type=item, nbt={Item:{id:"minecraft:gold_block",Count:1b}}] run function moreshields:upgrade_gold

execute as @e[type=item,nbt={Item:{id:"minecraft:shield"}}] unless entity @s[nbt={Item:{tag:{upgradedShield:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[distance=..1, type=item, nbt={Item:{id:"minecraft:diamond_block",Count:1b}}] run function moreshields:upgrade_diamond

execute as @e[type=item,nbt={Item:{id:"minecraft:shield"}}] if entity @s[nbt={Item:{tag:{diamondShield:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[distance=..1, type=item, nbt={Item:{id:"minecraft:netherite_ingot",Count:1b}}] run function moreshields:upgrade_netherite