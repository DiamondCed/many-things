execute as @e[type=item,nbt={Item:{id:"minecraft:netherite_sword"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}}] run function venomblade:addattribute

execute as @a[scores={hit_netherite=1..},nbt={SelectedItem:{tag:{venomBlade:1b}}}] at @s positioned ~ ~1.85 ~ run function venomblade:detecthit

scoreboard players set @a hit_netherite 0