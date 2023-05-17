tag @s add destroying
execute as @e[tag=storage] if score @s playerid = @e[tag=destroying,limit=1] playerid run tag @s add receiver
data modify entity @e[tag=receiver,limit=1] HandItems[0].tag.BlockEntityData.Items set from entity @s Items
data modify entity @s Items set value []
tag @e remove receiver

execute at @s run particle reverse_portal ~ ~0.3 ~ 0.3 0.3 0.3 2 200
execute at @s run playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 1 0.75
kill @s
