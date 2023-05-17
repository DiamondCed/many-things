
execute as @e[tag=arrowCatch] at @s unless entity @e[tag=boomArrow,distance=..3.5] run function boombow:explode

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:tnt",Count:8b}}] run function boombow:addattribute

tag @a remove hasBoomBow

#offhand, checks for mainland bow/crossbow
tag @a[nbt={Inventory:[{Slot:-106b,tag:{boom:1}}]}] add hasBoomBow
tag @a[nbt={SelectedItem:{id:"minecraft:bow"}}] remove hasBoomBow
tag @a[nbt={SelectedItem:{id:"minecraft:crossbow"}}] remove hasBoomBow

#mainhand, needs no offhand check
tag @a[nbt={SelectedItem:{tag:{boom:1}}}] add hasBoomBow

execute as @e[type=arrow,tag=!boomArrow,tag=!notBoomArrow] at @s positioned ~ ~-1 ~ if entity @a[tag=hasBoomBow,distance=..1] run tag @s add boomArrow

tag @e[type=arrow,tag=!boomArrow,tag=!notBoomArrow] add notBoomArrow

execute as @e[tag=boomArrow,nbt={inGround:1b}] at @s run function boombow:explode

execute as @e[tag=boomArrow] at @s run summon area_effect_cloud ~ ~ ~ {Tags:[arrowCatch],Duration:2}