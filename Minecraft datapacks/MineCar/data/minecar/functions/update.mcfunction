tag @e[type=minecart,nbt={CustomName:"{\"text\":\"Car\"}"}] add car
#execute as @e[tag=car] run data modify entity @s NoGravity set value 1

execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] at @s run summon area_effect_cloud ^ ^ ^0.5 {Duration:1,Tags:["target"]}

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] run tp @s ~ ~ ~ facing entity @e[tag=target,limit=1,sort=nearest]

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] run tp @s ~ ~ ~ ~90 0

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={SelectedItem:{id:"minecraft:coal"},RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] if block ^0.5 ^ ^ #minecar:canbypass run tp @s ^0.3 ^ ^

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={SelectedItem:{id:"minecraft:coal"},RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] unless block ^0.5 ^ ^ #minecar:canbypass if block ^0.5 ^1 ^ #minecar:canbypass run tp @s ^ ^0.5 ^

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={SelectedItem:{id:"minecraft:coal"},RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] if block ^ ^ ^ #minecraft:carpets run tp @s ^ ^0.2 ^

execute as @e[tag=car] at @s if block ~ ~-0.2 ~ #minecar:canbypass run tp ~ ~-0.1 ~

execute as @e[tag=car] at @s if block ~ ~-0.2 ~ water run data modify entity @s NoGravity set value 1

execute as @e[tag=car] at @s if block ~ ~-0.2 ~ lava run data modify entity @s NoGravity set value 1

execute as @e[tag=car] at @s unless block ~ ~-0.2 ~ water run data modify entity @s NoGravity set value 0

execute as @e[tag=car] at @s unless block ~ ~-0.2 ~ lava run data modify entity @s NoGravity set value 0

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={SelectedItem:{id:"minecraft:coal"},RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] if block ~ ~ ~ water if block ~ ~ ~ #minecar:canbypass run tp @s ^ ^0.5 ^

execute as @e[tag=car] at @s if entity @a[distance=..1,nbt={SelectedItem:{id:"minecraft:coal"},RootVehicle:{Entity:{id:"minecraft:minecart",Tags:["car"]}}}] if block ~ ~ ~ lava if block ~ ~ ~ #minecar:canbypass run tp @s ^ ^0.5 ^