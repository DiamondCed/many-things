execute store result score @s cx run data get entity @s Pos[0]
execute store result score @s cy run data get entity @s Pos[1]
execute store result score @s cz run data get entity @s Pos[2]

execute if entity @s[nbt={Dimension:1}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"white"}

execute if entity @s[nbt={Dimension:-1}] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"gold"}

execute if entity @s[nbt={Dimension:0},tag=!altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"yellow"}

execute if entity @s[nbt={Dimension:0},tag=altColor] run title @s actionbar {"text":"","extra":[{"score":{"name":"@s","objective":"cx"}},{"text":" | "},{"score":{"name":"@s","objective":"cy"}},{"text":" | "},{"score":{"name":"@s","objective":"cz"}}],"color":"dark_blue"}


#overworld cycle:
#yellow
#dark_aqua/dark_blue

#end:white
#nether:gold