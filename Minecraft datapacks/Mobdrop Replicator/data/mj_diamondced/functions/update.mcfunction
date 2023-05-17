#spawn machine
  #execute as @e[type=item_frame,tag=!NotReplicator,tag=!Replicator,nbt={Facing:5b,Item:{id:"minecraft:nether_star"}}] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^ ^1 ^-1 #mj_diamondced:rep_top run function mj_diamondced:spawn_west

  #execute as @e[type=item_frame,tag=!NotReplicator,tag=!Replicator,nbt={Facing:4b,Item:{id:"minecraft:nether_star"}}] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^ ^1 ^-1 #mj_diamondced:rep_top run function mj_diamondced:spawn_east

  #execute as @e[type=item_frame,tag=!NotReplicator,tag=!Replicator,nbt={Facing:3b,Item:{id:"minecraft:nether_star"}}] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^ ^1 ^-1 #mj_diamondced:rep_top run function mj_diamondced:spawn_north

  #execute as @e[type=item_frame,tag=!NotReplicator,tag=!Replicator,nbt={Facing:2b,Item:{id:"minecraft:nether_star"}}] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^ ^1 ^-1 #mj_diamondced:rep_top run function mj_diamondced:spawn_south
	
execute as @e[type=item_frame,tag=!NotReplicator,tag=!Replicator,nbt={Item:{id:"minecraft:nether_star"}}] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^1 ^ ^-1 quartz_pillar[axis=y] if block ^ ^ ^-2 quartz_pillar[axis=y] if block ^1 ^ ^-2 quartz_pillar[axis=y] if block ^ ^1 ^-1 glass if block ^1 ^1 ^-1 glass if block ^ ^1 ^-2 glass if block ^1 ^1 ^-2 glass if block ^ ^2 ^-1 glass if block ^1 ^2 ^-1 glass if block ^ ^2 ^-2 glass if block ^1 ^2 ^-2 glass if block ^ ^3 ^-1 iron_trapdoor[open=false] if block ^1 ^3 ^-1 iron_trapdoor[open=false] if block ^ ^3 ^-2 iron_trapdoor[open=false] if block ^1 ^3 ^-2 iron_trapdoor[open=false] run function mj_diamondced:spawn


#for performance?
	#execute as @e[type=item_frame,tag=!NotReplicator,nbt={Item:{id:"minecraft:nether_star"}}] at @s unless block ^ ^ ^-1 dropper[facing=up] run tag @s add NotReplicator
tag @e[type=item_frame,nbt={Item:{id:"minecraft:nether_star"}},tag=!Replicator] add NotReplicator
tag @e[type=item_frame,nbt=!{Item:{id:"minecraft:nether_star"}},tag=!Replicator] remove NotReplicator

#craft lasso
execute as @e[type=item,nbt={Item:{id:"minecraft:lead",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:2b}},distance=..1.5] if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b}},distance=..1.5] run function mj_diamondced:craft_lasso

#use lasso
execute as @a[scores={used_lasso=1..},tag=!holding] if entity @s[nbt={SelectedItem:{tag:{IsLasso:1b}}}] at @s positioned ^ ^ ^2 if entity @e[type=#mj_diamondced:mobs,distance=..2,tag=!InReplicator] run function mj_diamondced:capture

execute as @a[scores={used_lasso=1..},tag=!holding] unless entity @s[nbt={SelectedItem:{tag:{IsLasso:1b}}}] if entity @s[nbt={Inventory:[{Slot:-106b,tag:{IsLasso:1b}}]}] at @s positioned ^ ^ ^2 if entity @e[type=#mj_diamondced:mobs,distance=..2,tag=!InReplicator] run function mj_diamondced:capture

execute as @a[scores={used_lasso=1..},tag=!holding] if entity @s[nbt={SelectedItem:{tag:{IsLasso:1b}}}] at @s positioned ^ ^ ^4 if entity @e[type=#mj_diamondced:mobs,distance=..2,tag=!InReplicator] run function mj_diamondced:capture

execute as @a[scores={used_lasso=1..},tag=!holding] unless entity @s[nbt={SelectedItem:{tag:{IsLasso:1b}}}] if entity @s[nbt={Inventory:[{Slot:-106b,tag:{IsLasso:1b}}]}] at @s positioned ^ ^ ^4 if entity @e[type=#mj_diamondced:mobs,distance=..2,tag=!InReplicator] run function mj_diamondced:capture

execute as @a[scores={used_lasso=1..},tag=holding] at @s run function mj_diamondced:release
execute as @a[tag=holding] unless entity @s[nbt={SelectedItem:{tag:{IsLasso:1b}}}] unless entity @s[nbt={Inventory:[{Slot:-106b,tag:{IsLasso:1b}}]}] run function mj_diamondced:release
execute as @a[tag=holding,scores={player_death=1..}] run function mj_diamondced:release

scoreboard players set @a used_lasso 0
scoreboard players set @a player_death 0

#held entity transport
execute as @a[tag=holding] at @s positioned ~ ~1.85 ~ positioned ^ ^ ^3 positioned ~ ~-0.5 ~ run tp @e[tag=captured,limit=1,sort=nearest] ~ ~ ~

#replicator function
scoreboard players remove @e[tag=HasMob] rep_cooldown 1
execute as @e[tag=Replicator,tag=HasMob,scores={rep_cooldown=0}] at @s run function mj_diamondced:replicate

execute as @e[tag=Replicator] unless entity @s[nbt={Item:{id:"minecraft:nether_star"}}] run function mj_diamondced:disable
execute as @e[tag=Replicator] at @s if block ^ ^ ^-1 dropper[facing=up] if block ^1 ^ ^-1 quartz_pillar[axis=y] if block ^ ^ ^-2 quartz_pillar[axis=y] if block ^1 ^ ^-2 quartz_pillar[axis=y] if block ^ ^1 ^-1 glass if block ^1 ^1 ^-1 glass if block ^ ^1 ^-2 glass if block ^1 ^1 ^-2 glass if block ^ ^2 ^-1 glass if block ^1 ^2 ^-1 glass if block ^ ^2 ^-2 glass if block ^1 ^2 ^-2 glass if block ^ ^3 ^-1 iron_trapdoor if block ^1 ^3 ^-1 iron_trapdoor if block ^ ^3 ^-2 iron_trapdoor if block ^1 ^3 ^-2 iron_trapdoor run tag @s add IntactBuild
execute as @e[tag=Replicator,tag=!IntactBuild] run function mj_diamondced:disable

tag @e remove IntactBuild

#replicator stasis
execute as @e[tag=InReplicator] at @s run function mj_diamondced:manage_stasis 

#replicator display
execute as @e[tag=ReplicatorDisplay] at @s run function mj_diamondced:manage_display 


