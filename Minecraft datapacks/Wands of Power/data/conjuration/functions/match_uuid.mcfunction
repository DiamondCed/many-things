data modify storage cjr temp set from storage cjr cmp
execute store success score #matchUUID calc run data modify storage cjr cmp set from entity @s UUID[0]
execute if score #matchUUID matches 0 run tag @s add currHB
