#Detect hitting stuff
tag @a remove hitStuff
execute as @a[nbt={SelectedItem:{tag:{Infused:1b}}},scores={hitdt1=1..}] run tag @s add hitStuff
execute as @a[nbt={SelectedItem:{tag:{Infused:1b}}},scores={hitdt2=1..}] run tag @s add hitStuff
execute as @a[nbt={SelectedItem:{tag:{Infused:1b}}},scores={hitdt3=1..}] run tag @s add hitStuff
scoreboard players set @a hitdt1 0
scoreboard players set @a hitdt2 0
scoreboard players set @a hitdt3 0
tag @e remove gotHit
execute as @e[type=!player,nbt={HurtTime:10s}] run tag @s add gotHit
execute as @a[tag=hitStuff] at @s if entity @e[tag=gotHit,distance=..6] positioned ~ ~1.85 ~ positioned ^ ^ ^2.5 run function infwep:hitsth

#Tag arrows
execute as @a[nbt={SelectedItem:{tag:{Infused:1b}}}] at @s run tag @e[type=arrow,distance=..3,tag=!InfusedArrow,tag=!UnInfusedArrow] add InfusedArrow
tag @e[type=arrow,tag=!InfusedArrow,tag=!UnInfusedArrow] add UnInfusedArrow

#stop affecting long-lived arrows
execute as @e[tag=InfusedArrow] unless entity @s[scores={arrowlife=0..}] run scoreboard players set @s arrowlife 0
scoreboard players add @e[tag=InfusedArrow] arrowlife 1 

#Detect arrows hitting
execute as @e[tag=InfusedArrow,nbt={inGround:0b},scores={arrowlife=..200}] at @s run summon area_effect_cloud ^ ^ ^1 {Tags:["ArrowMonitor"],Duration:2}
execute as @e[tag=InfusedArrow,nbt={inGround:0b}] at @s run tp @e[tag=ArrowMonitor,distance=..5] @s
execute as @e[tag=ArrowMonitor] at @s unless entity @e[type=arrow,tag=InfusedArrow,distance=..1.5,nbt={inGround:0b}] as @p[nbt={SelectedItem:{tag:{Infused:1b}}}] run function infwep:hitsth

execute as @e[tag=InfusedArrow,scores={arrowlife=200}] at @s run kill @e[tag=ArrowMonitor,distance=..2]

#Tridents
execute as @e[type=trident,tag=!appliedEffect,nbt={DealtDamage:1b,Trident:{tag:{Infused:1b}}}] at @s run function infwep:hittrident

#Create/Manage Infusers
execute as @e[type=item,nbt={Item:{id:"minecraft:potion"}}] at @s if block ~ ~ ~ enchanting_table run function infwep:setup_infuser
kill @e[type=item,nbt={Item:{tag:{InfuserGUI:1b}}}]
execute as @e[tag=InfuserMarker] at @s unless block ~ ~ ~ dropper run kill @e[type=item,limit=1,sort=nearest,distance=..2,nbt={Item:{id:"minecraft:dropper"}}]
execute as @e[tag=InfuserMarker] at @s unless block ~ ~ ~ dropper unless entity @p[gamemode=creative] run loot spawn ~ ~ ~ loot minecraft:blocks/enchanting_table
execute as @e[tag=InfuserMarker] at @s unless block ~ ~ ~ dropper run kill @s
execute as @e[tag=InfuserMarker] at @s if entity @a[distance=..10] run function infwep:regulate_infuser