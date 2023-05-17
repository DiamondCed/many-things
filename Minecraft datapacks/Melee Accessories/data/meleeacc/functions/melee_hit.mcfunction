advancement revoke @s only meleeacc:melee_hit

# detect the current, most logical enemy to try to give the effect to -> that doesn't include the attacker aka me
tag @e[nbt={HurtTime:10s},limit=1,sort=nearest,distance=0.0001..6] add current

# give debuff appropriate to the worn accessory/ies
execute if entity @s[tag=hasDebuffVenom] run effect give @e[tag=current,limit=1,sort=nearest] poison 5 0
execute if entity @s[tag=hasDebuffWither] run effect give @e[tag=current,limit=1,sort=nearest] wither 5 1
execute if entity @s[tag=hasDebuffSlow] run effect give @e[tag=current,limit=1,sort=nearest] slowness 5 1
execute if entity @s[tag=hasDebuffWeak] run effect give @e[tag=current,limit=1,sort=nearest] weakness 5 1
execute if entity @s[tag=hasDebuffLevitate] run effect give @e[tag=current,limit=1,sort=nearest] levitation 1 0

tag @e[tag=current,limit=1,sort=nearest] add hitCooldown
tag @e[tag=current,limit=1,sort=nearest] remove current
