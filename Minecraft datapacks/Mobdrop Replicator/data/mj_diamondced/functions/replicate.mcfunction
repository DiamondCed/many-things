execute if entity @s[nbt={ItemRotation:0b}] run tag @s add RepEven
execute if entity @s[nbt={ItemRotation:2b}] run tag @s add RepEven
execute if entity @s[nbt={ItemRotation:4b}] run tag @s add RepEven
execute if entity @s[nbt={ItemRotation:6b}] run tag @s add RepEven


execute if entity @s[tag=RepEven] as @p run loot insert ^ ^ ^-1 kill @e[tag=InReplicator,limit=1,sort=nearest]

scoreboard players set @s rep_cooldown 200

execute align xyz positioned ~0.5 ~0.5 ~0.5 positioned ^0.5 ^0.5 ^-1.5 unless entity @e[tag=InReplicator,limit=1,sort=nearest,distance=..0.75] run scoreboard players reset @s rep_cooldown
execute align xyz positioned ~0.5 ~0.5 ~0.5 positioned ^0.5 ^0.5 ^-1.5 unless entity @e[tag=InReplicator,limit=1,sort=nearest,distance=..0.75] run tag @s remove HasMob


execute if entity @s[tag=RepEven] align xyz positioned ~0.5 ~0.5 ~0.5 run playsound minecraft:item.trident.riptide_1 block @a ^0.5 ^1.5 ^-1.5 0.5 0.75
execute if entity @s[tag=RepEven] align xyz positioned ~0.5 ~0.5 ~0.5 run playsound minecraft:item.bottle.fill_dragonbreath block @a ^0.5 ^1.5 ^-1.5 0.5 1

execute if entity @s[tag=RepEven] align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:ash ^0.5 ^1.5 ^-1.5 .25 .4 .25 0 1000
#execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:enchanted_hit ^0.5 ^1.5 ^-1.5 .5 .5 .5 0 100
execute if entity @s[tag=RepEven] align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:dust_color_transition 1 1 1 1 0 0 0 ^0.5 ^1.5 ^-1.5 0.3 0.4 0.3 1 100

tag @s remove RepEven