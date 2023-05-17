# figure out if a player is holding the wand, where and whether it is active
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDefItem:1b,Active:0b}}]}] add hasInactiveDefOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasInactiveDefOffhand
tag @a[nbt={SelectedItem:{tag:{isDefItem:1b,Active:0b}}}] add hasInactiveDefMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDefItem:1b,Active:1b}}]}] add hasActiveDefOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasActiveDefOffhand
tag @a[nbt={SelectedItem:{tag:{isDefItem:1b,Active:1b}}}] add hasActiveDefMainhand

tag @a[tag=hasInactiveDefOffhand] add hasDef
tag @a[tag=hasInactiveDefMainhand] add hasDef
tag @a[tag=hasActiveDefOffhand] add hasDef
tag @a[tag=hasActiveDefMainhand] add hasDef

# detect when the wand is clicked to toggle its effect
execute as @a[tag=hasDef,scores={used_def=1..}] run function deflection:toggle

# make sure the wad works while holding a fungus on a stick
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDefItem:1b,Active:1b}}]}] add hasActiveDefOffhand

# detect when a player is holding an active wand and run the actual functionality code
tag @a remove defUser
tag @a[tag=hasActiveDefOffhand] add defUser
tag @a[tag=hasActiveDefMainhand] add defUser

execute as @a[tag=defUser] at @s positioned ~ ~1 ~ if entity @e[type=#deflection:deflected_projectiles,distance=..5] run function deflection:use

# display particles around users
execute as @a[tag=defUser] at @s positioned ~ ~1 ~ run particle dust 1 1 1 0.75 ~ ~ ~ 2.5 2.5 2.5 0 1

# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",Count:1b}},distance=..1] run function deflection:craft

scoreboard players set @a used_def 0
tag @a remove hasDef
tag @a remove hasInactiveDefOffhand
tag @a remove hasInactiveDefMainhand
tag @a remove hasActiveDefOffhand
tag @a remove hasActiveDefMainhand