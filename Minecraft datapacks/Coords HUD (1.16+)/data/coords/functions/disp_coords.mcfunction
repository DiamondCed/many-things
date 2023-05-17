execute store result score @s cx run data get entity @s Pos[0]
execute store result score @s cy run data get entity @s Pos[1]
execute store result score @s cz run data get entity @s Pos[2]

scoreboard players set @s calc -1
scoreboard players set @s[nbt={Dimension:"minecraft:overworld"}] calc 1
scoreboard players set @s[nbt={Dimension:"minecraft:the_nether"}] calc 2
scoreboard players set @s[nbt={Dimension:"minecraft:the_end"}] calc 3
scoreboard players set @s[nbt={Dimension:"cavern:cavern"}] calc 4
scoreboard players set @s[nbt={Dimension:"cavern:large_cavern"}] calc 4
scoreboard players set @s[nbt={Dimension:"planegates:pocket"}] calc 5

execute if entity @s[scores={calc=1},tag=!altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"yellow"}

execute if entity @s[scores={calc=1},tag=altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"dark_blue"}

execute if entity @s[scores={calc=2}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"gold"}

execute if entity @s[scores={calc=3}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"white"}


# cavern compatibility
execute if entity @s[scores={calc=4},tag=!altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"white"}

execute if entity @s[scores={calc=4},tag=altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"dark_blue"}

# planeshift gates compatibility -> disabled since coords are irrelevant in there. Would have to retool it around a box's origin
#execute if entity @s[scores={calc=5}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"white"}

# other dimensions
execute if entity @s[scores={calc=-1}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"white"}


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