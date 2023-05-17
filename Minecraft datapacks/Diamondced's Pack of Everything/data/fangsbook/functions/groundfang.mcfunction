execute run data modify storage temp Pos[0] set from entity @s Pos[0]
execute run data modify storage temp Pos[1] set from entity @s Pos[2]
execute run spreadplayers ~ ~ 0 1 false @s
execute run data modify entity @s Pos[0] set from storage temp Pos[0]
execute run data modify entity @s Pos[2] set from storage temp Pos[1]


