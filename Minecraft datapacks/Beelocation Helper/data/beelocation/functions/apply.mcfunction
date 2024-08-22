# the [0] check is in applied_test to save all this code running on empty nests
execute store success score $2 bee_dummy run data get entity @s Item.tag.BlockEntityTag.Bees[1]
execute store success score $3 bee_dummy run data get entity @s Item.tag.BlockEntityTag.Bees[2]

# aggregate them
scoreboard players operation $2 bee_dummy += $3 bee_dummy
scoreboard players operation $1 bee_dummy += $2 bee_dummy

# unfortunately, Lore cannot be resolved dynamically, so this doesn't work
# data modify entity @s Item.tag.display.Lore prepend value '{"text":"Bees: ","extra":[{"score":{"objective":"bee_dummy","name":"$1"}}],"color":"gray","italic":"false"}'

# show nothing for empty hives
execute if score $1 bee_dummy matches 1 run data modify entity @s Item.tag.display.Lore prepend value '{"text":"Bees: 1","color":"gray","italic":"false"}'
execute if score $1 bee_dummy matches 2 run data modify entity @s Item.tag.display.Lore prepend value '{"text":"Bees: 2","color":"gray","italic":"false"}'
execute if score $1 bee_dummy matches 3 run data modify entity @s Item.tag.display.Lore prepend value '{"text":"Bees: 3","color":"gray","italic":"false"}'

# allow empty beehives to stack with crafted (but not dropped) beehives
# now redundant since this doesn't run without bees present
# execute if score $1 bee_dummy matches 1.. data modify entity @s Item.tag.beelocationApplied set value true