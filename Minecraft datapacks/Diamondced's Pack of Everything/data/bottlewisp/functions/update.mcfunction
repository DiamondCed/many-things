#Manage Wisp
execute as @e[tag=isWisp] at @s positioned ~ ~-1.75 ~ unless entity @a[tag=hasWisp,distance=..2,gamemode=!spectator] run kill @s
execute as @e[tag=isWisp] at @s run particle enchanted_hit ~ ~1 ~ 0.1 0.1 0.1 0.2 1
#particle minecraft:block soul_fire ~ ~1 ~ 0.1 0.1 0.1 5 1
execute as @e[tag=isWisp] at @p[tag=hasWisp,gamemode=!spectator] run tp @s ~ ~1.75 ~
execute as @e[tag=isWisp] at @s positioned ~ ~-1.75 ~ run data modify entity @s Rotation set from entity @p[tag=hasWisp,gamemode=!spectator] Rotation
execute as @e[tag=hasWisp,gamemode=!spectator] at @s positioned ~ ~1.75 ~ unless entity @e[tag=isWisp,distance=..2] run summon armor_stand ~ ~ ~ {Invisible:1b,Small:1b,Tags:["isWisp"],Marker:1b,ArmorItems:[{},{},{},{Count:1b,id:"minecraft:sea_lantern",tag:{Enchantments:[{id:"sharpness",lvl:1s}]}}]}


#Obtain/remove wisp
tag @a[nbt={Inventory:[{Slot:-106b,tag:{bottlewisp:1b}}]}] add hasWispBottle
tag @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove hasWispBottle
tag @a[nbt={SelectedItem:{tag:{bottlewisp:1b}}}] add hasWispBottle

execute as @a[tag=hasWispBottle,scores={used_wisp=1..}] run function bottlewisp:swap_wisp

tag @a[scores={wispDied=1..}] remove hasWisp

tag @a remove hasWispBottle
scoreboard players set @a used_wisp 0
scoreboard players set @a wispDied 0
