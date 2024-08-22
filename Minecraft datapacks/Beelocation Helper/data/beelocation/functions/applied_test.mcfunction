execute store success score $1 bee_dummy run data get entity @s Item.tag.BlockEntityTag.Bees[0]
# only add lore if a) doesn't already have lore and b) has bees
execute unless data entity @s Item.tag.beelocationApplied if score $1 bee_dummy matches 1 run function beelocation:apply
tag @s add beelocation_applied