data modify storage fbcannon:temp copy set from storage fbcannon:temp master
execute store success score #success shot_fbc run data modify storage fbcannon:temp copy set from entity @s Owner

execute if score #success shot_fbc matches 1 run tag @s add fb_ignored


execute unless entity @s[tag=fb_ignored] run summon fireball ~ ~ ~ {direction:[0.0,0.0,0.0],Tags:["cannonfb","current"]}

execute unless entity @s[tag=fb_ignored] run data modify entity @e[tag=current,limit=1,sort=nearest] Motion set from entity @s Motion

execute unless entity @s[tag=fb_ignored] run data modify entity @e[tag=current,limit=1,sort=nearest] Owner set from entity @s Owner

#execute unless entity @s[tag=fb_ignored] run data modify entity @e[tag=current,limit=1,sort=nearest] power set from entity @s Motion

tag @e remove current

kill @s