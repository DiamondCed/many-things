# item detection
tag @a remove hasShackle
tag @a remove hasRegen
tag @a remove hasLifeCuffs
tag @a remove hasShield
tag @a remove hasAglet
tag @a remove hasAnklet
tag @a remove hasLBoots
execute as @a run function moreaccessories:detect_items

# shackles functionality
execute as @a[tag=!hasShackle] run attribute @s minecraft:generic.armor modifier remove 54AC1E-0-0-0-1
execute as @a[tag=hasShackle] run attribute @s minecraft:generic.armor modifier add 54AC1E-0-0-0-1 shackles_def 1 add

execute as @a[tag=!hasLifeCuffs] run attribute @s minecraft:generic.armor modifier remove 54AC1E-0-0-0-2
execute as @a[tag=hasLifeCuffs] run attribute @s minecraft:generic.armor modifier add 54AC1E-0-0-0-2 life_cuffs_def 1 add

# band of regen functionality
execute as @a unless score @s regen_timer matches 0..100 run scoreboard players set @s regen_timer 0
execute as @a[tag=!hadRegen,tag=hasRegen] run scoreboard players set @s regen_timer 1
execute as @a[scores={regen_timer=0},tag=hasRegen] run effect give @s minecraft:regeneration 1 2 true
scoreboard players add @a regen_timer 1

tag @a remove hadRegen
tag @a[tag=hasRegen] add hadRegen

# shield functionality
execute as @a[tag=!hasShield] run attribute @s minecraft:generic.knockback_resistance base set 0
execute as @a[tag=hasShield] run attribute @s minecraft:generic.knockback_resistance base set 1

# aglet/anklet of the wind/lightning boots functionality
execute as @a[tag=!hasAglet] run attribute @s minecraft:generic.movement_speed modifier remove A91E7-0-0-0-1
execute as @a[tag=hasAglet] run attribute @s minecraft:generic.movement_speed modifier add A91E7-0-0-0-1 aglet 0.05 multiply_base

execute as @a[tag=!hasAnklet] run attribute @s minecraft:generic.movement_speed modifier remove A41E7-0-0-0-1
execute as @a[tag=hasAnklet] run attribute @s minecraft:generic.movement_speed modifier add A41E7-0-0-0-1 anklet 0.1 multiply_base

execute as @a[tag=!hasLBoots] run attribute @s minecraft:generic.movement_speed modifier remove 1B0075-0-0-0-1
execute as @a[tag=hasLBoots] run attribute @s minecraft:generic.movement_speed modifier add 1B0075-0-0-0-1 lBoots 0.08 multiply_base

# fuse items (shackles + band of regen = life cuffs)
execute as @e[type=item,nbt={Item:{tag:{isShackle:1b}}},nbt=!{Item:{tag:{isLifeCuffs:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isRegen:1b}}},nbt=!{Item:{tag:{isLifeCuffs:1b}}}] run function moreaccessories:fuse_def_regen
# fuse items (spectre boots + aglet + anklet = lightning boots)
execute as @e[type=item,nbt={Item:{tag:{isSpectreBoots:1b}}},nbt=!{Item:{tag:{isLBoots:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isAglet:1b}}}] if entity @e[type=item,nbt={Item:{tag:{isAnklet:1b}}}] run function moreaccessories:fuse_lightning