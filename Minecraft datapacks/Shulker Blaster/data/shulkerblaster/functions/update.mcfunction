tag @a remove hasShBow
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isShulkerBow:1b}}]}] add hasShBow
tag @a[nbt={SelectedItem:{id:"minecraft:bow"}}] remove hasShBow
tag @a[nbt={SelectedItem:{tag:{isShulkerBow:1b}}}] add hasShBow

execute as @e[type=arrow,tag=!notShBullet] at @s if entity @p[scores={shulkerBow=1..},tag=hasShBow] run tag @s add shBullet
tag @e[type=arrow,tag=!notShBullet,tag=!shBullet] add notShBullet

execute as @e[tag=shBullet] at @s run function shulkerblaster:checkspeed


execute as @e[tag=actualShBullet,scores={life=10..}] at @s run data modify entity @s Target set from entity @e[type=!#shulkerblaster:friend,limit=1,sort=nearest,distance=..40,nbt=!{PersistenceRequired:1b}] UUID
execute as @e[tag=actualShBullet,scores={life=10..},nbt={Steps:0}] run data modify entity @s Steps set value 1

scoreboard players add @e[tag=actualShBullet] life 1
kill @e[tag=actualShBullet,scores={life=600..}]

scoreboard players set @a shulkerBow 0