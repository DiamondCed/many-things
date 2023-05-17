scoreboard objectives add hookid dummy "Hook Id"
execute unless score #hookids hookid matches 1.. run scoreboard players set #hookids 0
tellraw @a {"text":"Grappling Hook Pack loaded!","color":"aqua"}