fill ~ ~ ~ ~ ~ ~ spawner destroy

data modify block ~ ~ ~ Delay set from entity @s ArmorItems[2].tag.Delay
data modify block ~ ~ ~ MaxNearbyEntities set from entity @s ArmorItems[2].tag.MaxNearbyEntities
data modify block ~ ~ ~ MaxSpawnDelay set from entity @s ArmorItems[2].tag.MaxSpawnDelay
data modify block ~ ~ ~ MinSpawnDelay set from entity @s ArmorItems[2].tag.MinSpawnDelay
data modify block ~ ~ ~ RequiredPlayerRange set from entity @s ArmorItems[2].tag.RequiredPlayerRange
data modify block ~ ~ ~ SpawnCount set from entity @s ArmorItems[2].tag.SpawnCount
data modify block ~ ~ ~ SpawnData set from entity @s ArmorItems[2].tag.SpawnData
data modify block ~ ~ ~ SpawnPotentials set from entity @s ArmorItems[2].tag.SpawnPotentials
data modify block ~ ~ ~ SpawnRange set from entity @s ArmorItems[2].tag.SpawnRange

kill @s