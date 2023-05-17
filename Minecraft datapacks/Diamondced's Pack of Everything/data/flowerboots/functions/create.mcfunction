execute if predicate flowerboots:plains run loot spawn ~ -64 ~ loot flowerboots:randomizer_plains
execute if predicate flowerboots:swamp run loot spawn ~ -64 ~ loot flowerboots:randomizer_swamp
execute if predicate flowerboots:flower_forest run loot spawn ~ -64 ~ loot flowerboots:randomizer_flower_forest
execute unless predicate flowerboots:plains unless predicate flowerboots:swamp unless predicate flowerboots:flower_forest run loot spawn ~ -64 ~ loot flowerboots:randomizer_generic


execute if entity @e[nbt={Item:{tag:{flowerType:0}}}] run setblock ~ ~ ~ dandelion
execute if entity @e[nbt={Item:{tag:{flowerType:1}}}] run setblock ~ ~ ~ poppy
execute if entity @e[nbt={Item:{tag:{flowerType:2}}}] run setblock ~ ~ ~ blue_orchid
execute if entity @e[nbt={Item:{tag:{flowerType:3}}}] run setblock ~ ~ ~ allium
execute if entity @e[nbt={Item:{tag:{flowerType:4}}}] run setblock ~ ~ ~ azure_bluet
execute if entity @e[nbt={Item:{tag:{flowerType:5}}}] run setblock ~ ~ ~ red_tulip
execute if entity @e[nbt={Item:{tag:{flowerType:6}}}] run setblock ~ ~ ~ orange_tulip
execute if entity @e[nbt={Item:{tag:{flowerType:7}}}] run setblock ~ ~ ~ white_tulip
execute if entity @e[nbt={Item:{tag:{flowerType:8}}}] run setblock ~ ~ ~ pink_tulip
execute if entity @e[nbt={Item:{tag:{flowerType:9}}}] run setblock ~ ~ ~ oxeye_daisy
execute if entity @e[nbt={Item:{tag:{flowerType:10}}}] run setblock ~ ~ ~ cornflower
execute if entity @e[nbt={Item:{tag:{flowerType:11}}}] run setblock ~ ~ ~ lily_of_the_valley
execute if entity @e[nbt={Item:{tag:{flowerType:12}}}] run setblock ~ ~ ~ wither_rose

kill @e[nbt={Item:{tag:{flowerRandomizer:1b}}}]