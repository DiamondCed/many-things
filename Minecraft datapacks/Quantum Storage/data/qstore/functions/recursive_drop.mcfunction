summon item ~ ~ ~ {Tags:["curr"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[tag=curr,type=item,limit=1,sort=nearest] Item set from entity @s Item.tag.DeepItems[0]
data remove entity @s Item.tag.DeepItems[0]
tag @e remove curr
execute if data entity @s Item.tag.DeepItems[0] run function qstore:recursive_drop