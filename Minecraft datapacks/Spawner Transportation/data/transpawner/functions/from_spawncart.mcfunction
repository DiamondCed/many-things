summon minecart ~ ~ ~ {Tags:["current","justdropped"]}
fill ~ ~ ~ ~ ~ ~ spawner destroy

data modify entity @e[type=minecart,tag=current,limit=1,sort=nearest] Pos set from entity @s Pos
data modify entity @e[type=minecart,tag=current,limit=1,sort=nearest] Rotation set from entity @s Rotation
execute as @e[type=minecart,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ ~
data modify entity @e[type=minecart,tag=current,limit=1,sort=nearest] Motion set from entity @s Motion

data modify block ~ ~ ~ Delay set from entity @s Delay
data modify block ~ ~ ~ MaxNearbyEntities set from entity @s MaxNearbyEntities
data modify block ~ ~ ~ MaxSpawnDelay set from entity @s MaxSpawnDelay
data modify block ~ ~ ~ MinSpawnDelay set from entity @s MinSpawnDelay
data modify block ~ ~ ~ RequiredPlayerRange set from entity @s RequiredPlayerRange
data modify block ~ ~ ~ SpawnCount set from entity @s SpawnCount
data modify block ~ ~ ~ SpawnData set from entity @s SpawnData
data modify block ~ ~ ~ SpawnPotentials set from entity @s SpawnPotentials
data modify block ~ ~ ~ SpawnRange set from entity @s SpawnRange

tag @e[type=minecart,tag=current,limit=1,sort=nearest] remove current
kill @s