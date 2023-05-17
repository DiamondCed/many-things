tag @s add current
execute as @e[tag=vknives] if score @s knivesid = @e[tag=current,limit=1,sort=nearest] knivesid run tag @e[tag=current,limit=1,sort=nearest] add found_vknives
tag @s remove current
