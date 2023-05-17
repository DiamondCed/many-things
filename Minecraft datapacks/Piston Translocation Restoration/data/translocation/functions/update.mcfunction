execute as @a at @s align xz positioned ~ ~1 ~ unless entity @s[dx=1,dy=1,dz=1] run tag @s add crawlMode

execute as @a[tag=!crawlMode] at @s align xyz positioned ~-1 ~ ~ unless entity @s[dx=-1,dy=1,dz=1] positioned ~2 ~ ~ unless entity @s[dx=1,dy=1,dz=1] positioned ~-1 ~ ~-1 unless entity @s[dx=1,dy=1,dz=-1] positioned ~ ~ ~2 unless entity @s[dx=1,dy=1,dz=1] positioned ~ ~2 ~-1 unless entity @s[dx=1,dy=1,dz=1] run tag @s add blockAligned
execute as @a[tag=crawlMode] at @s align xyz positioned ~-1 ~ ~ unless entity @s[dx=-1,dy=1,dz=1] positioned ~2 ~ ~ unless entity @s[dx=1,dy=1,dz=1] positioned ~-1 ~ ~-1 unless entity @s[dx=1,dy=1,dz=-1] positioned ~ ~ ~2 unless entity @s[dx=1,dy=1,dz=1] positioned ~ ~1 ~-1 unless entity @s[dx=1,dy=1,dz=1] run tag @s add blockAligned

execute as @a[tag=inPistonDown,tag=blockAligned] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~-2 ~ #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~ ~-2 ~
execute as @a[tag=inPistonDown,tag=blockAligned] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~-2 ~ #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~ ~-2 ~
execute as @a[tag=inPistonUp,tag=blockAligned] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~2 ~ #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~ ~2 ~
execute as @a[tag=inPistonUp,tag=blockAligned] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~2 ~ #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~ ~2 ~

execute as @a[tag=inPistonNorth,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~ ~-2 #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~ ~ ~-2
execute as @a[tag=inPistonNorth,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~ ~-2 #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~ ~ ~-2
execute as @a[tag=inPistonEast,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~2 ~ ~ #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~2 ~ ~
execute as @a[tag=inPistonEast,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~2 ~ ~ #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~2 ~ ~

execute as @a[tag=inPistonSouth,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~ ~2 #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~ ~ ~2
execute as @a[tag=inPistonSouth,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~ ~ ~2 #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~ ~ ~2
execute as @a[tag=inPistonWest,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~-2 ~ ~ #translocation:smallhitbox positioned ~ ~-0.5 ~ run tp @s ~-2 ~ ~
execute as @a[tag=inPistonWest,tag=blockAligned,tag=crawlMode] at @s positioned ~ ~0.5 ~ if block ~ ~ ~ air if block ~-2 ~ ~ #minecraft:fence_gates[open=true] positioned ~ ~-0.5 ~ run tp @s ~-2 ~ ~


tag @a remove inPistonDown
tag @a remove inPistonUp
tag @a remove inPistonNorth
tag @a remove inPistonEast
tag @a remove inPistonSouth
tag @a remove inPistonWest

execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=up] run tag @s add inPistonDown
execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=down] run tag @s add inPistonUp
execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=south] run tag @s add inPistonNorth
execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=west] run tag @s add inPistonEast
execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=north] run tag @s add inPistonSouth
execute as @a at @s positioned ~ ~0.5 ~ if block ~ ~ ~ piston_head[facing=east] run tag @s add inPistonWest

tag @a remove crawlMode
tag @a remove blockAligned