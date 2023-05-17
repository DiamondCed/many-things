#say broken
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:wheat_seeds"}}] add BrokenWheatSeeds
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:wheat"}}] add BrokenWheat
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:carrot"}}] add BrokenCarrot
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:potato"}}] add BrokenPotato
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:beetroot"}}] add BrokenBeets
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:beetroot_seeds"}}] add BrokenBeetSeeds
execute run tag @e[type=item,limit=10,sort=nearest,distance=..10,nbt={Age:0s,Item:{id:"minecraft:nether_wart"}}] add BrokenWarts

#wheat item
execute as @e[tag=BrokenWheat] at @s if entity @p[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] if block ~ ~ ~ air run function replant:wheat

#wheat seeds item
execute as @e[tag=BrokenWheatSeeds] at @s if block ~ ~ ~ air run function replant:wheat_seeds

#carrot item
execute as @e[tag=BrokenCarrot] at @s if block ~ ~ ~ air run function replant:carrots

#potato item
execute as @e[tag=BrokenPotato] at @s if block ~ ~ ~ air run function replant:potatoes

#beetroot item
execute as @e[tag=BrokenBeets] at @s if entity @p[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] if block ~ ~ ~ air run function replant:beetroots

#beetroot seeds item
execute as @e[tag=BrokenBeetSeeds] at @s if block ~ ~ ~ air run function replant:beetroot_seeds

#nether wart item
execute as @e[tag=BrokenWarts] at @s if block ~ ~ ~ air run function replant:warts


tag @e remove BrokenWheat
tag @e remove BrokenWheatSeeds
tag @e remove BrokenCarrot
tag @e remove BrokenPotato
tag @e remove BrokenBeets
tag @e remove BrokenBeetSeeds
tag @e remove BrokenWarts