# easy way to chop off the decimals
execute store result score $x diedDeathCoord run data get entity @s Pos[0]
execute store result score $y diedDeathCoord run data get entity @s Pos[1]
execute store result score $z diedDeathCoord run data get entity @s Pos[2]

execute unless score @s private_coordinates matches 1 run tellraw @a {"text":"","extra":[{"selector":"@s"},{"text":" died at "},{"score":{"name":"$x","objective":"diedDeathCoord"}},{"text":", "},{"score":{"name":"$y","objective":"diedDeathCoord"}},{"text":", "},{"score":{"name":"$z","objective":"diedDeathCoord"}}]}
execute if score @s private_coordinates matches 1 run tellraw @s {"text":"","extra":[{"selector":"@s"},{"text":" died at "},{"score":{"name":"$x","objective":"diedDeathCoord"}},{"text":", "},{"score":{"name":"$y","objective":"diedDeathCoord"}},{"text":", "},{"score":{"name":"$z","objective":"diedDeathCoord"}}],"color":"gray","italic":"true"}
scoreboard players set @s diedDeathCoord 0