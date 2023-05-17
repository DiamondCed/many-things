data modify storage def temp set value []
data modify storage def temp set from entity @s Owner
execute store success score #temp calc run data modify storage def temp set from entity @a[tag=user,limit=1,sort=nearest] UUID 

execute if score #temp calc matches 0 run tag @s remove defAffected