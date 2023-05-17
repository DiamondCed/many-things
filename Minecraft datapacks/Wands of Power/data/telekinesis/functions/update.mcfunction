# figure out if a player is holding the wand, where and whether it is active
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isTkItem:1b,Active:0b}}]}] add hasInactiveTkOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasInactiveTkOffhand
tag @a[nbt={SelectedItem:{tag:{isTkItem:1b,Active:0b}}}] add hasInactiveTkMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isTkItem:1b,Active:1b}}]}] add hasActiveTkOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasActiveTkOffhand
tag @a[nbt={SelectedItem:{tag:{isTkItem:1b,Active:1b}}}] add hasActiveTkMainhand

tag @a[tag=hasInactiveTkOffhand] add hasTk
tag @a[tag=hasInactiveTkMainhand] add hasTk
tag @a[tag=hasActiveTkOffhand] add hasTk
tag @a[tag=hasActiveTkMainhand] add hasTk

# detect when the wand is clicked to toggle its effect
execute as @a[tag=hasTk,scores={used_tk=1..}] run function telekinesis:toggle

# make sure the wand works while holding a fungus on a stick
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isTkItem:1b,Active:1b}}]}] add hasActiveTkOffhand

# detect when a player is holding an active wand and run the actual functionality code
tag @a remove tkUser
tag @a[tag=hasActiveTkOffhand] add tkUser
tag @a[tag=hasActiveTkMainhand] add tkUser

execute as @a[tag=tkUser] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 if entity @e[type=#telekinesis:tk_affected,distance=..4] run function telekinesis:use

# spawn sparse particles when no entity is in range/held
execute as @a[tag=tkUser,tag=!spawnedParticles] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 if predicate telekinesis:random_particle positioned ~ ~ ~ run particle minecraft:dust 1 0.25 0.85 1 ~ ~ ~ 0.35 0.35 0.35 0.0125 1
tag @a remove spawnedParticles

# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot",Count:1b}},distance=..1] run function telekinesis:craft

tag @a remove hasTk
scoreboard players set @a used_tk 0
tag @a remove hasInactiveTkOffhand
tag @a remove hasInactiveTkMainhand
tag @a remove hasActiveTkOffhand
tag @a remove hasActiveTkMainhand