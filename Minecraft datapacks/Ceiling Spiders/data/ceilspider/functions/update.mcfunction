execute as @e[type=#ceilspider:spiders] at @s run function ceilspider:detect_ceil

execute as @e[type=#ceilspider:spiders,tag=!drop] at @s positioned ~ ~-3 ~ unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..3] run tag @s add upsideDown

# randomly drop from the ceiling if nobody is within 10 blocks, after 1/1200 chance per tick aka 30 seconds on average
execute as @e[tag=upsideDown] at @s unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..10] if predicate ceilspider:random_drop run tag @s add longDrop
tag @e[tag=longDrop] remove upsideDown

effect give @e[tag=upsideDown] levitation 1 0 true
execute as @e[tag=upsideDown] run data modify entity @s CustomName set value '{"text":"Dinnerbone"}'
team join hiddenName @e[tag=upsideDown]

effect clear @e[tag=!upsideDown,type=#ceilspider:spiders] levitation
execute as @e[tag=!upsideDown,type=#ceilspider:spiders] run data modify entity @s CustomName set value ''
team leave @e[tag=!upsideDown,type=#ceilspider:spiders]

#effect clear @e[tag=!upsideDown,type=#ceilspider:spiders] glowing
#effect give @e[tag=upsideDown] glowing 1 0 true

# regain ability to go on ceiling if either dropped on floor or randomly (avg 30s)
tag @e[nbt={OnGround:1b}] remove longDrop
execute as @e[tag=longDrop] if predicate ceilspider:random_drop run tag @s remove longDrop
tag @e remove upsideDown
tag @e remove drop