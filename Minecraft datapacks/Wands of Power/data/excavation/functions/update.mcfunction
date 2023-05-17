# figure out if a player is holding the wand, where and whether it is active
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isExcItem:1b,Active:0b}}]}] add hasInactiveExcOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasInactiveExcOffhand
tag @a[nbt={SelectedItem:{tag:{isExcItem:1b,Active:0b}}}] add hasInactiveExcMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isExcItem:1b,Active:1b}}]}] add hasActiveExcOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasActiveExcOffhand
tag @a[nbt={SelectedItem:{tag:{isExcItem:1b,Active:1b}}}] add hasActiveExcMainhand

tag @a[tag=hasInactiveExcOffhand] add hasExc
tag @a[tag=hasInactiveExcMainhand] add hasExc
tag @a[tag=hasActiveExcOffhand] add hasExc
tag @a[tag=hasActiveExcMainhand] add hasExc


# detect when the wand is clicked to toggle its effect
execute as @a[tag=hasExc,scores={used_exc=1..}] run function excavation:toggle

# make sure the wand works while holding a fungus on a stick
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isExcItem:1b,Active:1b}}]}] add hasActiveExcOffhand

# detect when a player is holding an active wand
tag @a remove excUser
tag @a[tag=hasActiveExcOffhand] add excUser
tag @a[tag=hasActiveExcMainhand] add excUser

# detect when a player has mined with one of the enhanced tools (pickaxes and shovels)
execute as @a[tag=excUser] at @s run function excavation:detect_used

# do functionality if the player used one of the enhanced tools
execute as @a[tag=excUser, scores={calc=1..}] at @s run function excavation:use

# display particles ??


# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:nether_brick",Count:1b}},distance=..1] run function excavation:craft

scoreboard players set @a used_exc 0
tag @a remove hasExc
tag @a remove hasInactiveExcOffhand
tag @a remove hasInactiveExcMainhand
tag @a remove hasActiveExcOffhand
tag @a remove hasActiveExcMainhand