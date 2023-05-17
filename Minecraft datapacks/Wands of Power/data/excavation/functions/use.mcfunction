# tag nearest newly created item within 7 blocks of the front of the player (since that's what they would have mined)
execute positioned ^ ^ ^3.5 run tag @e[type=item,nbt={Age:0s},limit=1,sort=nearest,distance=..3.5] add current_excav

# detect player direction (making sure only one tag is ever on the player just in case)
execute store result score #y calc run data get entity @s Rotation[1]
execute if score #y calc matches 45..90 run tag @s add EXCAV_Y
execute if score #y calc matches -90..-45 run tag @s add EXCAV_Y

execute store result score #xz calc run data get entity @s Rotation[0]
execute if score #xz calc matches -180..-135 run tag @s[tag=!EXCAV_Y] add EXCAV_Z
execute if score #xz calc matches -135..-45 run tag @s[tag=!EXCAV_Y,tag=!EXCAV_Z] add EXCAV_X
execute if score #xz calc matches -45..45 run tag @s[tag=!EXCAV_Y,tag=!EXCAV_X] add EXCAV_Z
execute if score #xz calc matches 45..135 run tag @s[tag=!EXCAV_Y,tag=!EXCAV_Z] add EXCAV_X
execute if score #xz calc matches 135..180 run tag @s[tag=!EXCAV_Y,tag=!EXCAV_X] add EXCAV_Z

# it is assumed the player has exactly one of these tags from now on
# edges
# less than diamond
execute if entity @s[tag=!EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~ #excavation:obsidian_tier run setblock ~ ~-1 ~ air destroy
execute if entity @s[tag=!EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~ #excavation:obsidian_tier run setblock ~ ~1 ~ air destroy

execute if entity @s[tag=!EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~ #excavation:obsidian_tier run setblock ~-1 ~ ~ air destroy
execute if entity @s[tag=!EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~ #excavation:obsidian_tier run setblock ~1 ~ ~ air destroy

execute if entity @s[tag=!EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~ ~-1 #excavation:obsidian_tier run setblock ~ ~ ~-1 air destroy
execute if entity @s[tag=!EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~ ~1 #excavation:obsidian_tier run setblock ~ ~ ~1 air destroy

# diamond-tier
execute if entity @s[tag=!EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~ #excavation:unbreakable run setblock ~ ~-1 ~ air destroy
execute if entity @s[tag=!EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~ #excavation:unbreakable run setblock ~ ~1 ~ air destroy

execute if entity @s[tag=!EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~ #excavation:unbreakable run setblock ~-1 ~ ~ air destroy
execute if entity @s[tag=!EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~ #excavation:unbreakable run setblock ~1 ~ ~ air destroy

execute if entity @s[tag=!EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~ ~-1 #excavation:unbreakable run setblock ~ ~ ~-1 air destroy
execute if entity @s[tag=!EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~ ~1 #excavation:unbreakable run setblock ~ ~ ~1 air destroy

# corners
# less than diamond
execute if entity @s[tag=EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~-1 #excavation:obsidian_tier run setblock ~-1 ~ ~-1 air destroy
execute if entity @s[tag=EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~1 #excavation:obsidian_tier run setblock ~-1 ~ ~1 air destroy
execute if entity @s[tag=EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~-1 #excavation:obsidian_tier run setblock ~1 ~ ~-1 air destroy
execute if entity @s[tag=EXCAV_Y] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~1 #excavation:obsidian_tier run setblock ~1 ~ ~1 air destroy

execute if entity @s[tag=EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~-1 #excavation:obsidian_tier run setblock ~ ~-1 ~-1 air destroy
execute if entity @s[tag=EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~1 #excavation:obsidian_tier run setblock ~ ~-1 ~1 air destroy
execute if entity @s[tag=EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~-1 #excavation:obsidian_tier run setblock ~ ~1 ~-1 air destroy
execute if entity @s[tag=EXCAV_X] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~1 #excavation:obsidian_tier run setblock ~ ~1 ~1 air destroy

execute if entity @s[tag=EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~-1 ~ #excavation:obsidian_tier run setblock ~-1 ~-1 ~ air destroy
execute if entity @s[tag=EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~1 ~ #excavation:obsidian_tier run setblock ~-1 ~1 ~ air destroy
execute if entity @s[tag=EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~-1 ~ #excavation:obsidian_tier run setblock ~1 ~-1 ~ air destroy
execute if entity @s[tag=EXCAV_Z] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~1 ~ #excavation:obsidian_tier run setblock ~1 ~1 ~ air destroy

# diamond-tier
execute if entity @s[tag=EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~-1 #excavation:unbreakable run setblock ~-1 ~ ~-1 air destroy
execute if entity @s[tag=EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~ ~1 #excavation:unbreakable run setblock ~-1 ~ ~1 air destroy
execute if entity @s[tag=EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~-1 #excavation:unbreakable run setblock ~1 ~ ~-1 air destroy
execute if entity @s[tag=EXCAV_Y,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~ ~1 #excavation:unbreakable run setblock ~1 ~ ~1 air destroy

execute if entity @s[tag=EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~-1 #excavation:unbreakable run setblock ~ ~-1 ~-1 air destroy
execute if entity @s[tag=EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~-1 ~1 #excavation:unbreakable run setblock ~ ~-1 ~1 air destroy
execute if entity @s[tag=EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~-1 #excavation:unbreakable run setblock ~ ~1 ~-1 air destroy
execute if entity @s[tag=EXCAV_X,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~ ~1 ~1 #excavation:unbreakable run setblock ~ ~1 ~1 air destroy

execute if entity @s[tag=EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~-1 ~ #excavation:unbreakable run setblock ~-1 ~-1 ~ air destroy
execute if entity @s[tag=EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~-1 ~1 ~ #excavation:unbreakable run setblock ~-1 ~1 ~ air destroy
execute if entity @s[tag=EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~-1 ~ #excavation:unbreakable run setblock ~1 ~-1 ~ air destroy
execute if entity @s[tag=EXCAV_Z,scores={calc=2}] at @e[tag=current_excav,limit=1,sort=nearest] unless block ~1 ~1 ~ #excavation:unbreakable run setblock ~1 ~1 ~ air destroy


tag @s remove EXCAV_X
tag @s remove EXCAV_Y
tag @s remove EXCAV_Z

tag @e remove current_excav