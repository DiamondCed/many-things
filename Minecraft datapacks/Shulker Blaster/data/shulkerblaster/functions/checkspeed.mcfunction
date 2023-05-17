execute store result score #vx calc run data get entity @s Motion[0] 10
execute store result score #vy calc run data get entity @s Motion[1] 10
execute store result score #vz calc run data get entity @s Motion[2] 10

scoreboard players operation #vx calc *= #vx calc
scoreboard players operation #vy calc *= #vy calc
scoreboard players operation #vz calc *= #vz calc

scoreboard players operation #vx calc += #vy calc
scoreboard players operation #vx calc += #vz calc

#tellraw @a {"score":{"objective":"calc","name":"#vx"}}

execute if score #vx calc matches ..775 at @p run playsound minecraft:item.shield.break player @p ~ ~ ~ 1 1.2
execute unless score #vx calc matches ..775 run function shulkerblaster:summon
kill @s

