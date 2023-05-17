scoreboard players enable @a exitbox
execute as @a unless entity @s[scores={boxpid=1..}] run function dimbox:assignbox
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:magenta_stained_glass_pane"}}] at @s unless entity @e[tag=accesspoint,distance=..1] if block ~ ~-1 ~ dropper[facing=up] run function dimbox:addaccesspoint

execute as @e[tag=accesspoint] at @s unless block ~ ~ ~ dropper run kill @s
execute as @e[tag=accesspoint] at @s unless entity @e[nbt={Item:{id:"minecraft:magenta_stained_glass_pane"}},distance=..1] run kill @s

execute as @e[tag=accesspoint] at @s if block ~ ~ ~ dropper[triggered=false] run particle minecraft:portal ~ ~ ~ 0.2 0 0.2 0 10

execute as @a[scores={sneaking=1..}] at @s if entity @e[tag=accesspoint,distance=..0.65] if block ~ ~-1 ~ dropper[triggered=false] run function dimbox:tpin

execute as @a[scores={exitbox=1..}] run function dimbox:tpout

scoreboard players set @a sneaking 0
scoreboard players set @a exitbox 0