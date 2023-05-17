tag @a remove hasFlowerBoots
tag @a[nbt={Inventory:[{tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @a[nbt={EnderItems:[{tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots

execute as @a[tag=hasFlowerBoots,nbt={OnGround:1b}] at @s unless predicate flowerboots:no_flowers if block ~ ~-1 ~ grass_block if block ~ ~ ~ #flowerboots:air run function flowerboots:create
