execute as @e[type=item_frame,nbt={Item:{id:"minecraft:clock"}}] run tag @s add wallclock


execute as @e[tag=wallclock,scores={currtime=0..1500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:5b}] run data modify entity @s ItemRotation set value 5

execute as @e[tag=wallclock,scores={currtime=1500..4500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:6b}] run data modify entity @s ItemRotation set value 6

execute as @e[tag=wallclock,scores={currtime=4500..7500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:7b}] run data modify entity @s ItemRotation set value 7

execute as @e[tag=wallclock,scores={currtime=7500..10500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:0b}] run data modify entity @s ItemRotation set value 0

execute as @e[tag=wallclock,scores={currtime=10500..13500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:1b}] run data modify entity @s ItemRotation set value 1

execute as @e[tag=wallclock,scores={currtime=13500..16500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:2b}] run data modify entity @s ItemRotation set value 2

execute as @e[tag=wallclock,scores={currtime=16500..19500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:3b}] run data modify entity @s ItemRotation set value 3

execute as @e[tag=wallclock,scores={currtime=19500..22500}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:4b}] run data modify entity @s ItemRotation set value 4

execute as @e[tag=wallclock,scores={currtime=22500..24000}] unless entity @s[nbt={Item:{id:"minecraft:clock"}}] unless entity @s[nbt={ItemRotation:5b}] run data modify entity @s ItemRotation set value 5
#ItemRotation:0-7b

function wallclock:update_17