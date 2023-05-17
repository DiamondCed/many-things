
#scoreboard players enable @a cast1
#scoreboard players enable @a cast2
tag @a remove cast_1
tag @a remove cast_2
tag @e[scores={used_fangs=1..},nbt={Inventory:[{Slot:-106b,tag:{fangs:1,mode:1}}]}] add cast_1
tag @e[scores={used_fangs=1..},nbt={Inventory:[{Slot:-106b,tag:{fangs:1,mode:2}}]}] add cast_2

tag @e[scores={used_fangs=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove cast_1
tag @e[scores={used_fangs=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove cast_2

tag @e[scores={used_fangs=1..},nbt={SelectedItem:{tag:{fangs:1,mode:1}}}] add cast_1
tag @e[scores={used_fangs=1..},nbt={SelectedItem:{tag:{fangs:1,mode:2}}}] add cast_2

execute as @a[tag=cast_1,scores={sneaking_fangs=0}] unless entity @s[scores={fangs_cooldown=1..}] at @s run function fangsbook:cast1
execute as @a[tag=cast_2,scores={sneaking_fangs=0}] unless entity @s[scores={fangs_cooldown=1..}] at @s run function fangsbook:cast2

execute as @a[tag=cast_1,scores={sneaking_fangs=1..}] at @s if score #version cast1 matches 0 run function fangsbook:swap12_16
execute as @a[tag=cast_2,scores={sneaking_fangs=1..}] at @s if score #version cast1 matches 0 run function fangsbook:swap21_16

execute as @a[tag=cast_1,scores={sneaking_fangs=1..}] at @s if score #version cast1 matches 1 run function fangsbook:swap12_17
execute as @a[tag=cast_2,scores={sneaking_fangs=1..}] at @s if score #version cast1 matches 1 run function fangsbook:swap21_17







scoreboard players set @a cast1 0
scoreboard players set @a cast2 0
scoreboard players set @a sneaking_fangs 0
scoreboard players set @a used_fangs 0
scoreboard players remove @a[scores={fangs_cooldown=1..}] fangs_cooldown 1