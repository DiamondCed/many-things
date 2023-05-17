execute as @e[type=item,nbt={Item:{id:"minecraft:wooden_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:stone_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:golden_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:iron_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:diamond_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:netherite_hoe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b}}] run function replant:addattribute

execute as @a[scores={broken_wheat=1..,sneaking=0},nbt={SelectedItem:{tag:{replant:1}}}] at @s positioned ~ ~1.85 ~ run function replant:broken
execute as @a[scores={broken_carrots=1..,sneaking=0},nbt={SelectedItem:{tag:{replant:1}}}] at @s positioned ~ ~1.85 ~ run function replant:broken
execute as @a[scores={broken_potatoes=1..,sneaking=0},nbt={SelectedItem:{tag:{replant:1}}}] at @s positioned ~ ~1.85 ~ run function replant:broken
execute as @a[scores={broken_beets=1..,sneaking=0},nbt={SelectedItem:{tag:{replant:1}}}] at @s positioned ~ ~1.85 ~ run function replant:broken
execute as @a[scores={broken_warts=1..,sneaking=0},nbt={SelectedItem:{tag:{replant:1}}}] at @s positioned ~ ~1.85 ~ run function replant:broken

scoreboard players set @a sneaking 0
scoreboard players set @a broken_wheat 0
scoreboard players set @a broken_carrots 0
scoreboard players set @a broken_potatoes 0
scoreboard players set @a broken_beets 0
scoreboard players set @a broken_warts 0