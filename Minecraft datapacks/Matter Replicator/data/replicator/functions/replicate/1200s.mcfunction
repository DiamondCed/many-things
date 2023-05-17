#say 1200s

execute as @e[type=item_frame,nbt={Facing:1b,Item:{id:"minecraft:nether_star"}}] at @s if block ~ ~-3 ~ dropper[facing=up] if block ~1 ~-3 ~ lever[facing=east,face=wall,powered=false] if block ~-1 ~-3 ~ lever[facing=west,face=wall,powered=false] if block ~ ~-3 ~1 lever[facing=south,face=wall,powered=false] if block ~ ~-3 ~-1 lever[facing=north,face=wall,powered=false] if block ~1 ~-1 ~ lever[facing=east,face=wall,powered=true] if block ~-1 ~-1 ~ lever[facing=west,face=wall,powered=true] if block ~ ~-1 ~1 lever[facing=south,face=wall,powered=true] if block ~ ~-1 ~-1 lever[facing=north,face=wall,powered=true] if block ~1 ~-2 ~ end_rod[facing=up] if block ~-1 ~-2 ~ end_rod[facing=up] if block ~ ~-2 ~1 end_rod[facing=up] if block ~ ~-2 ~-1 end_rod[facing=up] run tag @s add matter_replicator

execute as @e[tag=matter_replicator] at @s if block ~ ~-1 ~ netherite_block run tag @s add matter_netherite
#execute as @e[tag=matter_replicator] at @s if block ~ ~-1 ~ diamond_block run tag @s add matter_diamond
#execute as @e[tag=matter_replicator] at @s if block ~ ~-1 ~ iron_block run tag @s add matter_iron

execute as @e[tag=matter_netherite] at @s if block ~ ~-2 ~ #replicator:tier_5 run loot insert ~ ~-3 ~ mine ~ ~-2 ~ diamond_pickaxe{Enchantments:[{id:"silk_touch",lvl:1s}]}


#execute as @e[tag=matter_replicator] at @s run loot insert ~ ~-3 ~ mine ~ ~-2 ~ diamond_pickaxe{Enchantments:[{id:"silk_touch",lvl:1s}]}

tag @e remove matter_replicator
tag @e remove matter_netherite
#tag @e remove matter_diamond
#tag @e remove matter_iron

schedule function replicator:replicate/1200s 1200s