#tellraw @a {"text":"Hermes Boots Pack loaded!","color":"green"}
scoreboard objectives add sprinted minecraft.custom:minecraft.sprint_one_cm
scoreboard players set @a sprinted 0
scoreboard objectives add lastsprinted dummy
scoreboard players set @a lastsprinted 0
scoreboard objectives add difference dummy
scoreboard players set @a difference 0
scoreboard objectives add globaltimer dummy
execute unless score #timer globaltimer matches 1.. run scoreboard players set #timer globaltimer 0
scoreboard players set $loop globaltimer 3

scoreboard players set #version_check sprinted 0
function hboots:version_check