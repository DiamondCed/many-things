scoreboard players add #prevID previd 1
scoreboard players operation @s playerid = #prevID previd

#summon chest_minecart 0 -1 0 {NoAI:1b,Invulnerable:1b,NoGravity:1b,CustomName:'{"text":"Personal Storage Cart","color":"blue"}'}
summon armor_stand 0 -65 0 {NoAI:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Invisible:1b,HandItems:[{id:"minecraft:chest",Count:1b,tag:{BlockEntityData:{Items:[]}}}]}

#execute store result entity @e[limit=1,x=0,y=-65,z=0,type=armor_stand,nbt={Air:0s}] Air short 1 run scoreboard players get @s playerid

execute store result score @e[limit=1,x=0,y=-65,z=0,type=armor_stand,tag=!storage] playerid run scoreboard players get @s playerid

tag @e[type=armor_stand,x=0,y=-65,z=0] add storage
