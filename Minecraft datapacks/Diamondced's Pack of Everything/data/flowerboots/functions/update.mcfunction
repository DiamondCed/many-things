tag @a remove hasFlowerBoots
execute as @a run function flowerboots:detect_items

execute as @a[tag=hasFlowerBoots,nbt={OnGround:1b}] at @s unless predicate flowerboots:no_flowers if block ~ ~-1 ~ grass_block if block ~ ~ ~ #flowerboots:air run function flowerboots:create
