loot spawn ~ -64 ~ loot rocketboots:randomizer
execute if entity @e[type=item,nbt={Item:{id:"minecraft:structure_void",tag:{replaceRB:1b}}}] run data modify entity @s Offers.Recipes[-1] set value {maxUses:2,buyB:{id:"minecraft:air",Count:1b},buy:{id:"minecraft:emerald",Count:32b},sell:{id:"minecraft:skull_banner_pattern",Count:1b,tag:{CustomModelData:24,isRocketBoots:1b,HideFlags:32,display:{Name:'{"text":"Rocket Boots","italic":false,"color":"gold"}'}}},xp:1,uses:0,priceMultiplier:0.05f,specialPrice:0,demand:0,rewardExp:1b}
kill @e[type=item,nbt={Item:{id:"minecraft:structure_void",tag:{replaceRB:1b}}}]
tag @s add attempt_rb