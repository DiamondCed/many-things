# summon the armor stand and teleport it so it has the same look/rotation vector
summon armor_stand ~ ~ ~ {Tags:["current","des_raycast"],Marker:1b,Invisible:1b}
tp @e[tag=current, tag=des_raycast,limit=1,sort=nearest] ~ ~1.8 ~ ~ ~

# set the max distance limit in 1/10 of a block (so 10x the actual distance)
# 60 for 6 block reach aka standard player reach I think
scoreboard players set #distance calc 60

# start the loop -> it keeps going until it either hits the distance limit or hits a solid block
execute as @e[tag=current,tag=des_raycast,limit=1,sort=nearest] at @s run function destruction:raycast_loop

# teleport to the center of the detected block
execute as @e[tag=current,tag=des_raycast,limit=1,sort=nearest] at @s align xyz run tp ~ ~ ~