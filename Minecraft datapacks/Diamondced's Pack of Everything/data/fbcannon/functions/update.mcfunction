scoreboard players add @e[tag=cannonfb] shot_fbc 1
kill @e[tag=cannonfb,scores={shot_fbc=50..}]

tag @a remove hasfbc
tag @a[nbt={Inventory:[{Slot:-106b,tag:{fbcannon:1b}}]}] add hasfbc
tag @a[nbt={SelectedItem:{id:"minecraft:crossbow"}}] remove hasfbc
tag @a[nbt={SelectedItem:{tag:{fbcannon:1b}}}] add hasfbc

execute as @a[scores={shot_fbc=1..},tag=hasfbc] run function fbcannon:fire

scoreboard players set @a shot_fbc 0

#tag @a add hasfbc

#execute as @e[tag=!notfba,tag=!fba,type=arrow,nbt={ShotFromCrossbow:1b}] at @s run function fbcannon:detectandshoot

execute as @e[type=fireball,tag=cannonfb] at @s run particle flame ~ ~ ~ 0.1 0.1 0.1 0 1 force