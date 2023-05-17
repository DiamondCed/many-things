# figure out if a player is holding the wand, where and whether it is active
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isCjrItem:1b,Active:0b}}]}] add hasInactiveCjrOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasInactiveCjrOffhand
tag @a[nbt={SelectedItem:{tag:{isCjrItem:1b,Active:0b}}}] add hasInactiveCjrMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isCjrItem:1b,Active:1b}}]}] add hasActiveCjrOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasActiveCjrOffhand
tag @a[nbt={SelectedItem:{tag:{isCjrItem:1b,Active:1b}}}] add hasActiveCjrMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isCjrItem:1b,Mode:0b}}]}] add hasMode0CjrOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasMode0CjrOffhand
tag @a[nbt={SelectedItem:{tag:{isCjrItem:1b,Mode:0b}}}] add hasMode0CjrMainhand

tag @a[nbt={Inventory:[{Slot:-106b,tag:{isCjrItem:1b,Mode:1b}}]}] add hasMode1CjrOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasMode1CjrOffhand
tag @a[nbt={SelectedItem:{tag:{isCjrItem:1b,Mode:1b}}}] add hasMode1CjrMainhand

tag @a[tag=hasInactiveCjrOffhand] add hasCjr
tag @a[tag=hasInactiveCjrMainhand] add hasCjr
tag @a[tag=hasActiveCjrOffhand] add hasCjr
tag @a[tag=hasActiveCjrMainhand] add hasCjr

# detect when the wand is clicked to toggle its effect
# prevent toggling active when on cooldown (only effective in mode 1)
# prevent toggling mode when active (effective in both modes)
execute as @a[tag=hasCjr,scores={used_cjr=1..,sneak_cjr=0,cjr_cooldown=0}] run function conjuration:toggle_active
execute as @a[tag=hasCjr,scores={used_cjr=1..,sneak_cjr=1..},tag=!hasActiveCjrMainhand,tag=!hasActiveCjrOffhand] run function conjuration:toggle_mode

# make sure the wand works, even while holding a fungus on a stick
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isCjrItem:1b,Active:1b}}]}] add hasActiveCjrOffhand

# detect when a player is holding an active wand and run the actual functionality code
tag @a remove cjr0User
tag @a[tag=hasActiveCjrOffhand,tag=hasMode0CjrOffhand] add cjr0User
tag @a[tag=hasActiveCjrMainhand,tag=hasMode0CjrMainhand] add cjr0User
tag @a remove cjr1User
tag @a[tag=hasActiveCjrOffhand,tag=hasMode1CjrOffhand] add cjr1User
tag @a[tag=hasActiveCjrMainhand,tag=hasMode1CjrMainhand] add cjr1User

# mark stands that were moved last frame
tag @e remove prev_affected_conjured
tag @e[tag=affected_conjured] add prev_affected_conjured
tag @e remove affected_conjured

# always triggers in mode 0 (create/move)
tag @e remove prevUsedCjr
execute as @a[tag=cjr0User] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 run function conjuration:use_0

# trigger wand in mode 1 only if nearby conjured blocks exist
execute as @a[tag=cjr1User,scores={cjr_cooldown=0}] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 if entity @e[tag=conjured_block,distance=..4] run function conjuration:use_1

# mark players who used mode1 for cooldown
execute as @a unless entity @s[scores={cjr_cooldown=0..}] run scoreboard players set @s cjr_cooldown 0
execute as @a[tag=cjr1User,scores={cjr_cooldown=1}] run function conjuration:toggle_active
scoreboard players remove @a[tag=cjr1User,scores={cjr_cooldown=1..}] cjr_cooldown 1
scoreboard players set @a[tag=hasMode1CjrMainhand,tag=hasActiveCjrMainhand,scores={cjr_cooldown=0}] cjr_cooldown 12
scoreboard players set @a[tag=hasMode1CjrOffhand,tag=hasActiveCjrOffhand,scores={cjr_cooldown=0}] cjr_cooldown 12

# snap blocks that were held last frame but not this one to grid
execute as @e[tag=prev_affected_conjured,tag=!affected_conjured] at @s run function conjuration:snap_to_grid

# update stuff about the conjured blocks themselves -> refresh invisibility on shulker, kill the stand or shulker if the other one is gone for some reason
effect give @e[tag=conjured_hitbox] invisibility 1 0 true
execute as @e[tag=conjured_block,tag=!affected_conjured] at @s if block ~0.45 ~0.05 ~0.45 #conjuration:cubic if block ~0.45 ~0.05 ~-0.45 #conjuration:cubic if block ~-0.45 ~0.05 ~0.45 #conjuration:cubic if block ~-0.45 ~0.05 ~-0.45 #conjuration:cubic if block ~0.45 ~0.95 ~0.45 #conjuration:cubic if block ~0.45 ~0.95 ~-0.45 #conjuration:cubic if block ~-0.45 ~0.95 ~0.45 #conjuration:cubic if block ~-0.45 ~0.95 ~-0.45 #conjuration:cubic run function conjuration:destroy
execute as @e[tag=conjured_block] unless data entity @s Passengers[0] run kill @s
execute as @e[tag=conjured_hitbox] at @s unless entity @e[tag=conjured_block,distance=..0.125] run tp @s ~ ~-68 ~

# mark players that were using the wand in mode 0 last frame (this is unused afaik??)
tag @a remove prevCjr0User
tag @a[tag=cjr0User] add prevCjr0User

# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:quartz",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:gold_ingot",Count:1b}},distance=..1] run function conjuration:craft

scoreboard players set @a used_cjr 0
scoreboard players set @a sneak_cjr 0
tag @a remove hasCjr
tag @a remove hasInactiveCjrOffhand
tag @a remove hasInactiveCjrMainhand
tag @a remove hasActiveCjrOffhand
tag @a remove hasActiveCjrMainhand
tag @a remove hasMode0CjrOffhand
tag @a remove hasMode0CjrMainhand
tag @a remove hasMode1CjrOffhand
tag @a remove hasMode1CjrMainhand