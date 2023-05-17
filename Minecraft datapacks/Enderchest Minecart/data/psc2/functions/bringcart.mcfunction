tag @s add caller
execute as @e[tag=storagecart] at @s if score @s playerid = @a[tag=caller,limit=1,sort=nearest] playerid run function psc2:destroy
execute as @e[tag=storage] if score @s playerid = @a[tag=caller,limit=1] playerid run tag @s add match

summon area_effect_cloud ~ ~ ~ {Tags:["temp_psc"]}
tp @e[tag=temp_psc,limit=1,sort=nearest] ~ ~ ~ ~ 0

execute at @e[tag=temp_psc] run summon chest_minecart ^ ^ ^1.5 {Invulnerable:1b,Tags:["storagecart","newcart"],NoGravity:1b,CustomName:"{\"text\":\"Minecart with Enderchest\"}",CustomDisplayTile:1b,DisplayOffset:8,DisplayState:{Name:"minecraft:ender_chest"}}
data modify entity @e[tag=newcart,limit=1] Items set from entity @e[tag=match,limit=1] HandItems[0].tag.BlockEntityData.Items
scoreboard players operation @e[tag=newcart] playerid = @s playerid
#execute run spreadplayers ~ ~ 1 2 false @e[tag=newcart]

#execute at @e[tag=newcart] run particle portal ~ ~ ~ 0 0 0 1.5 200
execute at @e[tag=newcart] run particle portal ~ ~0.3 ~ 0.3 0.3 0.3 0.5 200
execute at @e[tag=newcart] run playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 1 0.75

tag @s remove caller
tag @e remove match
tag @e remove newcart
kill @e[tag=temp_psc]
