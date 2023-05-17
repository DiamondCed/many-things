tellraw @a {"text":"Dimensional Boxes Pack loaded!","color":"light_purple"}
scoreboard objectives add boxid dummy
scoreboard objectives add boxpid dummy
execute unless score #nextid boxid matches 1.. run scoreboard players set #nextid boxid 1
scoreboard objectives add sneaking minecraft.custom:minecraft.sneak_time
scoreboard players set @a sneaking 0

scoreboard objectives add exitbox trigger
scoreboard players set @a exitbox 0