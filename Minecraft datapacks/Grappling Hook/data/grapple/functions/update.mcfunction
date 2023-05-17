execute as @a unless score @s hookid matches 1.. run function grapple:setid
execute as @e[type=fishing_bobber] unless score @s hookid matches 1.. run scoreboard players set @s hookid -1

tag @a remove hasGrapple
tag @a[nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{display:{Name:"{\"text\":\"Grappling Hook\"}"}}}}] add hasGrapple
tag @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:fishing_rod",tag:{display:{Name:"{\"text\":\"Grappling Hook\"}"}}}]}] add hasGrapple

execute as @a[tag=hasGrapple] at @s run tag @e[type=fishing_bobber,distance=..2,scores={hookid=-1}] add hook
execute as @a[tag=hasGrapple] at @s run scoreboard players operation @e[type=fishing_bobber,distance=..3,scores={hookid=-1}] hookid = @s hookid

execute as @e[tag=hook,nbt={OnGround:1b},tag=!playedSound] at @s run function grapple:sound

execute as @e[tag=hook,nbt={OnGround:1b}] at @s run kill @e[tag=hookAoE,distance=..2]
execute as @e[tag=hook,nbt={OnGround:1b}] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["hookAoE"],Duration:3}
execute as @e[tag=hook,nbt={OnGround:1b}] at @s run scoreboard players operation @e[tag=hookAoE,limit=1] hookid = @s hookid

execute as @e[tag=hookAoE] at @s unless entity @e[tag=hook,distance=..1] run function grapple:tphook 