#circles of 6(r=1) and 8(r=2)
tag @s add fangowner
#6
summon evoker_fangs ~1.5 ~ ~ {Tags:["newfangs"],Warmup:0}
summon evoker_fangs ~0.75 ~ ~1.299 {Tags:["newfangs"],Warmup:0}
summon evoker_fangs ~-0.75 ~ ~1.299 {Tags:["newfangs"],Warmup:0}
summon evoker_fangs ~-1.75 ~ ~ {Tags:["newfangs"],Warmup:0}
summon evoker_fangs ~-0.75 ~ ~-1.299 {Tags:["newfangs"],Warmup:0}
summon evoker_fangs ~0.5 ~ ~-1.299 {Tags:["newfangs"],Warmup:0}
#8
summon evoker_fangs ~3 ~ ~ {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~2.121 ~ ~2.121 {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~ ~ ~3 {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~-2.121 ~ ~2.121 {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~-3 ~ ~ {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~-2.121 ~ ~-2.121 {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~ ~ ~-3 {Tags:["newfangs"],Warmup:3}
summon evoker_fangs ~2.121 ~ ~-2.121 {Tags:["newfangs"],Warmup:3}

execute as @e[tag=newfangs] at @s facing entity @p eyes run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=newfangs] run data modify entity @s Owner set from entity @p[tag=fangowner] UUID
tag @e remove newfangs
tag @s remove fangowner

scoreboard players set @s fangs_cooldown 15
playsound entity.evoker.cast_spell player @s
