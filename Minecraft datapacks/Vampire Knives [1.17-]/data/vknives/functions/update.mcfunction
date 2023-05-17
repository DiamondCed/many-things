#add knifelife objective to arrows & increment objective
scoreboard players add @e[type=arrow,tag=vknives] knifelife 1

execute if score #version knifelife matches 0 run function vknives:update_14
execute if score #version knifelife matches 1 run function vknives:update_15
execute if score #version knifelife matches 2 run function vknives:update_17

#add hasVknives tag to players
tag @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1}}]}] add hasVknives
tag @a[nbt={SelectedItem:{id:"minecraft:bow"}}] remove hasVknives
tag @a[nbt={SelectedItem:{id:"minecraft:crossbow"}},nbt={Inventory:[{id:"minecraft:arrow"}]}] remove hasVknives
tag @a[nbt={SelectedItem:{id:"minecraft:crossbow"}},nbt={Inventory:[{id:"minecraft:spectral_arrow"}]}] remove hasVknives
tag @a[nbt={SelectedItem:{id:"minecraft:crossbow"}},nbt={Inventory:[{id:"minecraft:tipped_arrow"}]}] remove hasVknives
tag @a[nbt={SelectedItem:{tag:{VKnives:1}}}] add hasVknives

#add vknives tag to arrows and add specific id
execute as @e[type=arrow,tag=!vknives,tag=!notvknives] at @s if entity @a[distance=..2.5,tag=hasVknives] run function vknives:assign_vknives

#dont add vknives on other arrows
tag @e[type=arrow,tag=!vknives,tag=!notvknives] add notvknives

#lower damage & remove landing sound & prevents picking up bug
execute as @e[type=arrow,tag=vknives] run data modify entity @s damage set value 0.4d
execute as @e[type=arrow,tag=vknives] run data modify entity @s SoundEvent set value "minecraft:entity.cod.ambient"
execute as @e[type=arrow,tag=vknives] run data modify entity @s pickup set value 0

#nogravity effect
execute as @e[tag=vknives] run data modify entity @s NoGravity set value 1b

#heal
execute as @e[tag=healcheck] at @s run function vknives:healcheck
execute as @e[tag=!found_vknives,tag=healcheck] at @s run effect give @p[tag=hasVknives] regeneration 1 2 true
tag @e remove found_vknives

#remove checkers
kill @e[tag=healcheck]

#kill landed/old arrows
kill @e[type=arrow,nbt={inGround:1b},tag=vknives]
kill @e[type=arrow,scores={knifelife=2..},tag=vknives]

#summon checkers
execute as @e[tag=vknives] at @s run function vknives:create_checker



#remove deprecated hasVknives tag and dealt damage
tag @a remove hasVknives
#scoreboard players set @a dmg_vknives 0