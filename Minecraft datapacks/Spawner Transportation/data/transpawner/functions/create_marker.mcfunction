summon armor_stand ~ ~ ~ {Tags:["current","transpawner_marker"],Marker:1b,Invisible:1b,ArmorItems:[{},{},{id:"minecraft:stone",Count:1b,tag:{}},{}]}

data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.Delay set from entity @s Delay
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.MaxNearbyEntities set from entity @s MaxNearbyEntities
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.MaxSpawnDelay set from entity @s MaxSpawnDelay
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.MinSpawnDelay set from entity @s MinSpawnDelay
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.RequiredPlayerRange set from entity @s RequiredPlayerRange
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.SpawnCount set from entity @s SpawnCount
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.SpawnData set from entity @s SpawnData
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.SpawnPotentials set from entity @s SpawnPotentials
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.SpawnRange set from entity @s SpawnRange
data modify entity @e[type=armor_stand,tag=current,limit=1,sort=nearest] ArmorItems[2].tag.UUID set from entity @s UUID

tag @e[type=armor_stand,tag=current,limit=1,sort=nearest] remove current