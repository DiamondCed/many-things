tag @a[nbt={SelectedItem:{tag:{isBlazethrower:1b}}}] add hasBlazethrower
tag @a[nbt={Inventory:[{id:"minecraft:fire_charge"}]}] add hasFirecharge
tag @a[gamemode=creative] add hasFirecharge

execute as @a[tag=hasBlazethrower,scores={blaze_cooldown=0,used_blaze=1..}] at @s run function blazethrower:fire

execute as @a[tag=hasFirecharge,tag=hasBlazethrower,scores={blaze_cooldown=24}] at @s run function blazethrower:createfb
execute as @a[tag=hasFirecharge,tag=hasBlazethrower,scores={blaze_cooldown=18}] at @s run function blazethrower:createfb
execute as @a[tag=hasFirecharge,tag=hasBlazethrower,scores={blaze_cooldown=12}] at @s run function blazethrower:createfb

scoreboard players set @a used_blaze 0
scoreboard players remove @a[scores={blaze_cooldown=1..}] blaze_cooldown 1
scoreboard players add @a[tag=blazeFb] blaze_cooldown 1
kill @e[tag=blazeFb,scores={blaze_cooldown=100..}]
scoreboard players set @a flying_fb 0

tag @a remove hasBlazethrower
tag @a remove hasFirecharge