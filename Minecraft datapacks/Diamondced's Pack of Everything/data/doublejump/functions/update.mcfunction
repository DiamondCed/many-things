effect clear @a[tag=remjump] levitation
tag @a remove remjump

tag @a remove hasCloud
tag @a remove hasBlizzard
tag @a remove hasSandstorm
execute as @a run function doublejump:detect_items


tag @a remove callJump
tag @a[tag=hasCloud] add callJump
tag @a[tag=hasBlizzard] add callJump
tag @a[tag=hasSandstorm] add callJump
execute as @a[tag=callJump,nbt={OnGround:0b},scores={sneakdj=1..,prevsneak=0},gamemode=!spectator,nbt={abilities:{flying:0b}}] at @s unless block ~ ~ ~ #minecraft:climbable run function doublejump:jump

execute as @a run scoreboard players operation @s prevsneak = @s sneakdj
scoreboard players set @a sneakdj 0

tag @a[nbt={OnGround:1b}] remove usedCloud
tag @a[nbt={OnGround:1b}] remove usedBlizzard
tag @a[nbt={OnGround:1b}] remove usedSandstorm

execute as @a[scores={sandstormEffect=1..}] at @s run particle dust 0.97 0.95 0.7 2.5 ~ ~ ~ 0.15 0.15 0.15 1 20
scoreboard players remove @a[scores={sandstormEffect=1..}] sandstormEffect 1

execute as @a[scores={blizzardEffect=1..}] at @s run particle minecraft:poof ~ ~ ~ 0.1 0.1 0.1 0 10
scoreboard players remove @a[scores={blizzardEffect=1..}] blizzardEffect 1

scoreboard players set @a[scores={sandstormEffect=1..},nbt={OnGround:1b}] sandstormEffect 0
scoreboard players set @a[scores={blizzardEffect=1..},nbt={OnGround:1b}] blizzardEffect 0
#execute store result score test sneakdj run gamerule fallDamage