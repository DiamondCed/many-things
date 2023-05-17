summon spawner_minecart ~ ~ ~ {Tags:["current"]}
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] Pos set from entity @s Pos
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] Rotation set from entity @s Rotation
execute as @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ ~
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] Motion set from entity @s Motion

data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] Delay set from block ~ ~ ~ Delay
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] MaxNearbyEntities set from block ~ ~ ~ MaxNearbyEntities
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] MaxSpawnDelay set from block ~ ~ ~ MaxSpawnDelay
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] MinSpawnDelay set from block ~ ~ ~ MinSpawnDelay
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] RequiredPlayerRange set from block ~ ~ ~ RequiredPlayerRange
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] SpawnCount set from block ~ ~ ~ SpawnCount
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] SpawnData set from block ~ ~ ~ SpawnData
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] SpawnPotentials set from block ~ ~ ~ SpawnPotentials
data modify entity @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] SpawnRange set from block ~ ~ ~ SpawnRange

tag @e[type=spawner_minecart,tag=current,limit=1,sort=nearest] remove current
setblock ~ ~ ~ air
kill @s