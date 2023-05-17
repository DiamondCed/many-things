# remove at start instead of end for telekinesis compat
tag @a remove hasRc

# figure out if a player is holding the wand, and where (but not if active I don't think)
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isRcItem:1b}}]}] add hasRcOffhand
tag @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick"}}] remove hasRcOffhand
tag @a[nbt={SelectedItem:{tag:{isRcItem:1b}}}] add hasRcMainhand

tag @a[tag=hasRcOffhand] add hasRc
tag @a[tag=hasRcMainhand] add hasRc

# give all players who don't have one a recall_id for setting recall points
execute as @a unless score @s recall_id matches 1.. run function recall:assign_id

# give a default cooldown to players
execute as @a unless score @s cooldown_rc matches 0.. run scoreboard players set @s cooldown_rc 0

# detect when the want is clicked while not sneaking and count up; if the counter hits eg: 10 ticks and the player is still clicking, then initiate a teleport
scoreboard players add @a[scores={buildup_rc=1..}] buildup_rc 1
scoreboard players remove @a[scores={cooldown_rc=1..}] cooldown_rc 1
execute as @a[tag=hasRc,scores={used_rc=1..,sneak_rc=0,buildup_rc=0,cooldown_rc=0}] at @s run scoreboard players set @s buildup_rc 1
execute as @a[tag=hasRc] run function recall:update_model
execute as @a[tag=hasRc,scores={used_rc=1..}] if score @s buildup_rc >= #buildup buildup_rc at @s run function recall:teleport_before_destination
execute as @a if score @s buildup_rc > #postbuildup buildup_rc run scoreboard players set @s buildup_rc 0
scoreboard players set @a[scores={sneak_rc=1..}] buildup_rc 0


# remove recall_id of non-player, non-recall beacon entities (which would be added by telekinesis code) -> there is no such thing as a recall wand beacon though
scoreboard players reset @e[type=!player,tag=!recallWandBeacon] recall_id

# detect when the wand is used while sneaking to set a position
execute as @a[tag=hasRc,scores={used_rc=1..,sneak_rc=1..,buildup_rc=0}] at @s run function recall:set_position
scoreboard players set @a sneak_rc 0


# craft wand
execute as @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:2b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:dragon_breath",Count:1b}},distance=..1] if entity @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:1b}},distance=..1] run function recall:craft

scoreboard players set @a used_rc 0
scoreboard players set @a sneak_rc 0
tag @a remove hasRcOffhand
tag @a remove hasRcMainhand