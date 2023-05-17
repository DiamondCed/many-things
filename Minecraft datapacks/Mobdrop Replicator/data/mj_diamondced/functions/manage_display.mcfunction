execute positioned ^1 ^ ^-1 unless entity @e[tag=Replicator,distance=..0.75] run kill @s
data modify entity @s Fixed set value 1b
data modify entity @s Item.id set value "air"
data modify entity @s Silent set value 1b

execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=180..200}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:1b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=160..180}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:2b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=140..160}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:3b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=120..140}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:4b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=100..120}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:5b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=80..100}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:6b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=60..80}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:7b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=40..60}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:8b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=20..40}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:9b}}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,scores={rep_cooldown=0..20}] run data modify entity @s Item set value {id:"minecraft:structure_void",Count:1b,tag:{CustomModelData:10b}}

execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,sort=nearest,nbt={ItemRotation:1b}] run data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,sort=nearest,nbt={ItemRotation:3b}] run data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,sort=nearest,nbt={ItemRotation:5b}] run data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}
execute positioned ^1 ^ ^-1 if entity @e[tag=Replicator,distance=..0.75,sort=nearest,nbt={ItemRotation:7b}] run data modify entity @s Item set value {id:"minecraft:barrier",Count:1b}