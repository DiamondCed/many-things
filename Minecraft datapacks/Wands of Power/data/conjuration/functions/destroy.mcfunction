#say destroy

# make sure to select the actual correct hitbox, not the poser from another armor stand
data modify storage cjr cmp set from entity @s Passengers[0].UUID[0]
execute as @e[tag=conjured_hitbox,distance=..0.125] at @s run function conjuration:match_uuid

kill @s
execute as @e[tag=currHB] at @s run tp @s ~ -68 ~
execute as @e[tag=currHB] at @s run kill @s
tag @e remove currHB