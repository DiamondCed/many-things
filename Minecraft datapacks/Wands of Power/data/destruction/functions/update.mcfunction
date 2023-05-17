# figure out if a player is holding the wand, where and whether it is active
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDesItem:1b,Active:0b}}]}] add hasInactiveDesOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasInactiveDesOffhand
tag @a[nbt={SelectedItem:{tag:{isDesItem:1b,Active:0b}}}] add hasInactiveDesMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDesItem:1b,Active:1b}}]}] add hasActiveDesOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasActiveDesOffhand
tag @a[nbt={SelectedItem:{tag:{isDesItem:1b,Active:1b}}}] add hasActiveDesMainhand

tag @a[tag=hasInactiveDesOffhand] add hasDes
tag @a[tag=hasInactiveDesMainhand] add hasDes
tag @a[tag=hasActiveDesOffhand] add hasDes
tag @a[tag=hasActiveDesMainhand] add hasDes

# detect when the wand is clicked to toggle its effect
# prevent toggling active when on cooldown
execute as @a[tag=hasDes,scores={used_des=1..,des_cooldown=0}] run function destruction:toggle_active

# make sure the wand works, even while holding a fungus on a stick, I guess
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isDesItem:1b,Active:1b}}]}] add hasActiveDesOffhand

# detect when a player is holding an active wand and run the actual functionality code
tag @a remove desUser
tag @a[tag=hasActiveDesOffhand] add desUser
tag @a[tag=hasActiveDesMainhand] add desUser

# trigger wand effect -> raycast to find a non-air block, then do stuff
execute as @a[tag=desUser,scores={des_cooldown=0}] at @s positioned ~ ~ ~ run function destruction:use

# mark players who used wand
execute as @a unless entity @s[scores={des_cooldown=0..}] run scoreboard players set @s des_cooldown 0
execute as @a[tag=desUser,scores={des_cooldown=1}] run function destruction:toggle_active
scoreboard players remove @a[tag=desUser,scores={des_cooldown=1..}] des_cooldown 1
scoreboard players set @a[tag=hasActiveDesMainhand,scores={des_cooldown=0}] des_cooldown 12
scoreboard players set @a[tag=hasActiveDesOffhand,scores={des_cooldown=0}] des_cooldown 12

# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:crying_obsidian",Count:1b}},distance=..1] run function destruction:craft

scoreboard players set @a used_des 0
tag @a remove hasDes
tag @a remove hasInactiveDesOffhand
tag @a remove hasInactiveDesMainhand
tag @a remove hasActiveDesOffhand
tag @a remove hasActiveDesMainhand