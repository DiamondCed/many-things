tag @e[tag=gotHit,sort=nearest,limit=1] add target
data modify entity @e[tag=target,limit=1] ActiveEffects append from entity @s Trident.tag.InfusedEffect
execute store result score #tempvar hitdt1 run data get entity @e[tag=target,limit=1] Fire
execute store result score #tempvar hitdt2 run data get entity @s Trident.tag.InfusedEffect.Duration
execute if entity @s[nbt={Trident:{tag:{InfusedEffect:{Id:-1}}}}] if score #tempvar hitdt1 < #tempvar hitdt2 run data modify entity @e[tag=target,limit=1] Fire set from entity @s Trident.tag.InfusedEffect.Duration
tag @e remove target
tag @s add appliedEffect