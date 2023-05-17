execute store result score @s calc run data get entity @s Rotation[1]
tag @s[scores={calc=..-45}] add up
tag @s[scores={calc=45..}] add down
execute store result score @s calc run data get entity @s Rotation[0]

tag @s[scores={calc=-45..-0}] add south
tag @s[scores={calc=0..45}] add south
tag @s[scores={calc=-360..-315}] add south
tag @s[scores={calc=315..360}] add south

tag @s[scores={calc=45..135}] add west
tag @s[scores={calc=-315..-225}] add west

tag @s[scores={calc=-225..-135}] add north
tag @s[scores={calc=135..225}] add north

tag @s[scores={calc=-135..-45}] add east
tag @s[scores={calc=225..315}] add east

#tellraw @s {"nbt":"Tags","entity":"@s"}


#function 3x3mine:castray
#say @e[tag=BrokenBlock]
execute positioned ^ ^ ^2.5 run tag @e[type=item,limit=1,sort=nearest,distance=..3,nbt={Age:0s}] add BrokenBlock
execute if entity @s[tag=up] at @e[tag=BrokenBlock] run function 3x3mine:xz
execute if entity @s[tag=down] at @e[tag=BrokenBlock] run function 3x3mine:xz

execute if entity @s[tag=west] unless entity @s[tag=up] unless entity @s[tag=down] at @e[tag=BrokenBlock] run function 3x3mine:yz
execute if entity @s[tag=east] unless entity @s[tag=up] unless entity @s[tag=down] at @e[tag=BrokenBlock] run function 3x3mine:yz

execute if entity @s[tag=north] unless entity @s[tag=up] unless entity @s[tag=down] at @e[tag=BrokenBlock] positioned ~ ~0.1 ~ run function 3x3mine:xy
execute if entity @s[tag=south] unless entity @s[tag=up] unless entity @s[tag=down] at @e[tag=BrokenBlock] run function 3x3mine:xy

tag @e remove BrokenBlock