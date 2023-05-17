tag @s[tag=hasSandstorm,tag=usedSandstorm] add skipSandstorm
tag @s[tag=!hasSandstorm] add skipSandstorm
tag @s[tag=hasBlizzard,tag=usedBlizzard] add skipBlizzard
tag @s[tag=!hasBlizzard] add skipBlizzard
tag @s[tag=hasCloud,tag=usedCloud] add skipCloud
tag @s[tag=!hasCloud] add skipCloud

execute if entity @s[tag=!skipSandstorm] run function doublejump:jump_sandstorm
execute if entity @s[tag=skipSandstorm,tag=!skipBlizzard] run function doublejump:jump_blizzard
execute if entity @s[tag=skipSandstorm,tag=skipBlizzard,tag=!skipCloud] run function doublejump:jump_cloud

tag @s remove skipSandstorm
tag @s remove skipBlizzard
tag @s remove skipCloud
