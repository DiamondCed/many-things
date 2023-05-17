#straight line of -20- 15
tag @s add fangowner
summon armor_stand ~ ~ ~ {Tags:["dummyfangs"],Invisible:1b,Marker:1b}
data modify entity @e[tag=dummyfangs,limit=1,sort=nearest] Rotation[0] set from entity @s Rotation[0]
data modify entity @e[tag=dummyfangs,limit=1,sort=nearest] Rotation[1] set value 0
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^.5 {Tags:["newfangs"],Warmup:0}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^2 {Tags:["newfangs"],Warmup:1}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^3.5 {Tags:["newfangs"],Warmup:2}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^5 {Tags:["newfangs"],Warmup:3}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^6.5 {Tags:["newfangs"],Warmup:4}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^8 {Tags:["newfangs"],Warmup:5}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^9.5 {Tags:["newfangs"],Warmup:6}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^11 {Tags:["newfangs"],Warmup:7}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^12.5 {Tags:["newfangs"],Warmup:8}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^14 {Tags:["newfangs"],Warmup:9}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^15.5 {Tags:["newfangs"],Warmup:10}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^17 {Tags:["newfangs"],Warmup:11}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^18.5 {Tags:["newfangs"],Warmup:12}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^20 {Tags:["newfangs"],Warmup:13}
execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^21.5 {Tags:["newfangs"],Warmup:14}
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^23 {Tags:["newfangs"],Warmup:15}
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^24.5 {Tags:["newfangs"],Warmup:16}
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^26 {Tags:["newfangs"],Warmup:17}
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^27.5 {Tags:["newfangs"],Warmup:18}
#execute as @e[tag=dummyfangs,limit=1,sort=nearest] at @s run summon evoker_fangs ^ ^ ^29 {Tags:["newfangs"],Warmup:19}
execute as @e[tag=newfangs] at @s facing entity @p eyes run tp @s ~ ~ ~ ~90 ~
#execute as @e[tag=newfangs] at @s run data modify entity @s Rotation[0] set from entity @p Rotation[0]
#execute as @e[tag=newfangs] at @s run function fangsbook:groundfang
execute as @e[tag=newfangs] run data modify entity @s Owner set from entity @p[tag=fangowner] UUID
tag @e remove newfangs
tag @s remove fangowner
kill @e[tag=dummyfangs,limit=1,sort=nearest]

scoreboard players set @s fangs_cooldown 15
playsound entity.evoker.cast_spell player @s