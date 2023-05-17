
execute as @e[type=item,nbt={Item:{id:"minecraft:netherite_pickaxe"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:obsidian",Count:2b}}] run function 3x3mine:addattribute


execute as @a[scores={mined_netherite=1..,sneaking_tunnel=0},nbt={SelectedItem:{tag:{multiBreak:1}}}] at @s positioned ~ ~1.85 ~ run function 3x3mine:mined

scoreboard players set @a mined_netherite 0