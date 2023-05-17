#destroy
execute unless entity @s[scores={age=4}] unless entity @e[tag=ghastPlant,distance=..0.5] if block ~ ~1 ~ structure_void run setblock ~ ~1 ~ air
execute at @s unless entity @p[gamemode=creative,tag=!ghastdev] if entity @s[scores={age=3}] run loot spawn ~ ~ ~ loot ghastplant:blocks/ghast_stem_full
execute at @s unless entity @p[gamemode=creative,tag=!ghastdev] unless entity @s[scores={age=3..}] run loot spawn ~ ~ ~ loot ghastplant:blocks/ghast_stem_growing
execute unless entity @s[scores={age=4}] run playsound block.crop.break block @a
execute unless entity @s[scores={age=4}] run kill @s

#harvest
#execute if entity @s[scores={age=4}] run playsound minecraft:item.sweet_berries.pick_from_bush block @a
execute if entity @s[scores={age=4}] run playsound minecraft:block.weeping_vines.break block @a
execute if entity @s[scores={age=4}] if block ~ ~1 ~ air run setblock ~ ~1 ~ structure_void
execute if entity @s[scores={age=4}] run loot spawn ~ ~0.5 ~ loot ghastplant:blocks/harvest_ghast
execute if entity @s[scores={age=4}] run data modify entity @s ArmorItems[3] set value {Count:1b,id:"minecraft:structure_void",tag:{CustomModelData:203}}
scoreboard players set @s[scores={age=4}] age 3
