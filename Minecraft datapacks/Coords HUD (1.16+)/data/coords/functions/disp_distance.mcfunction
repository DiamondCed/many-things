execute store result score @s cx run data get entity @s Pos[0]
execute store result score @s cy run data get entity @s Pos[1]
execute store result score @s cz run data get entity @s Pos[2]

scoreboard players operation #dist px = @s px
scoreboard players operation #dist px -= @s cx
scoreboard players operation #dist px *= #dist px
scoreboard players operation #dist py = @s py
scoreboard players operation #dist py -= @s cy
scoreboard players operation #dist py *= #dist py
scoreboard players operation #dist pz = @s pz
scoreboard players operation #dist pz -= @s cz
scoreboard players operation #dist pz *= #dist pz

scoreboard players operation #A calc = #dist px
scoreboard players operation #A calc += #dist py
scoreboard players operation #A calc += #dist pz

function coords:sqrt

scoreboard players operation #dist calc = #A calc

scoreboard players set @s calc -1
scoreboard players set @s[nbt={Dimension:"minecraft:overworld"}] calc 1
scoreboard players set @s[nbt={Dimension:"minecraft:the_nether"}] calc 2
scoreboard players set @s[nbt={Dimension:"minecraft:the_end"}] calc 3
scoreboard players set @s[nbt={Dimension:"cavern:cavern"}] calc 4
scoreboard players set @s[nbt={Dimension:"cavern:large_cavern"}] calc 4
scoreboard players set @s[nbt={Dimension:"planegates:pocket"}] calc 5

execute if entity @s[scores={calc=1},tag=!altColor] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"yellow"}

execute if entity @s[scores={calc=1},tag=altColor] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"dark_blue"}

execute if entity @s[scores={calc=2}] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"gold"}

execute if entity @s[scores={calc=3}] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"white"}


# cavern compatibility
execute if entity @s[scores={calc=4},tag=!altColor] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"white"}

execute if entity @s[scores={calc=4},tag=altColor] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"dark_blue"}

# planeshift gates compatibility
execute if entity @s[scores={calc=5}] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"white"}

# other dimensions
execute if entity @s[scores={calc=-1}] run title @s actionbar {"text":"","extra":[{"text":"Distance: "},{"score":{"name":"#dist","objective":"calc"}}],"color":"white"}


# overworld cycle:
# yellow
# dark_aqua/dark_blue

# end:white
# nether:gold

# caverns cycle:
# white
# dark_blue

# planeshift gates: white

# other: white