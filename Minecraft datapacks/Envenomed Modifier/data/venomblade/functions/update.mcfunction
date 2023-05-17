execute as @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:stone_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:golden_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @e[type=item,nbt={Item:{id:"minecraft:diamond_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @a[scores={hit_wooden=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit
execute as @a[scores={hit_stone=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit
execute as @a[scores={hit_gold=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit
execute as @a[scores={hit_iron=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit
execute as @a[scores={hit_diamond=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit

execute if score #version_test calc matches 1 run function venomblade:update116

scoreboard players set @a hit_wooden 0
scoreboard players set @a hit_stone 0
scoreboard players set @a hit_gold 0
scoreboard players set @a hit_iron 0
scoreboard players set @a hit_diamond 0