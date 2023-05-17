tag @s add prevUsedCjr
# find the nearest conjured block in front of the player, prioritizing any previously carried block, or create one if fail
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^1 positioned ~ ~-0.5 ~ run tag @e[tag=prev_affected_conjured,limit=1,distance=..2,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^2 positioned ~ ~-0.5 ~ run tag @e[tag=prev_affected_conjured,limit=1,distance=..2,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^3 positioned ~ ~-0.5 ~ run tag @e[tag=prev_affected_conjured,limit=1,distance=..2,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^4 positioned ~ ~-0.5 ~ run tag @e[tag=prev_affected_conjured,limit=1,distance=..2,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 positioned ~ ~-0.5 ~ run tag @e[tag=prev_affected_conjured,limit=1,distance=..2,sort=nearest] add affected_conjured

execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^1 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^2 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^3 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^4 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add affected_conjured
execute unless entity @e[tag=affected_conjured] at @s positioned ~ ~1.8 ~ positioned ^ ^ ^5 positioned ~ ~-0.5 ~ run tag @e[tag=conjured_block,limit=1,distance=..1.25,sort=nearest] add affected_conjured

execute unless entity @s[tag=prevCjr0User] unless entity @e[tag=affected_conjured] run summon armor_stand ~ ~ ~ {Tags:["conjured_block","affected_conjured"],Invisible:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"ender_chest",Count:1b,tag:{CustomModelData:57}}],Passengers:[{Tags:["conjured_hitbox"],id:"shulker",DeathLootTable:"",Invulnerable:1b,Silent:1b,NoAI:1b,ActiveEffects:[{Id:14b,Duration:210000000}]}]}

execute if entity @e[tag=affected_conjured] positioned ~ ~ ~ run particle minecraft:dust_color_transition 1 0.25 0.85 1 1 1 0 ~ ~ ~ 0.35 0.35 0.35 0.0125 1
execute if entity @e[tag=affected_conjured] run tag @s add spawnedParticles

# teleport the entity 5 blocks in front of player and 1.98 blocks down (to match the stand position such that the block is in front of the player)
# since marker armor stands don't react to motion, we need to just tp them :/
tp @e[tag=affected_conjured] ~ ~-0.75 ~ 0 0

# we leave a tag on the armor stand to mark it as having been moved this frame, to snap to grid when that is no longer the case
#execute as @e[tag=affected_conjured,limit=1,sort=nearest] run data modify entity @s Passengers[0].Tags append value "carried"
#tag @e remove affected_conjured