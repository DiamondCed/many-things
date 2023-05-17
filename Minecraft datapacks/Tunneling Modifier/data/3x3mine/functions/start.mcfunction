tellraw @a {"text":"Tunneling Datapack Loaded!","color":"gray"}
scoreboard objectives add mined_wooden minecraft.used:minecraft.wooden_pickaxe
scoreboard objectives add mined_stone minecraft.used:minecraft.stone_pickaxe
scoreboard objectives add mined_gold minecraft.used:minecraft.golden_pickaxe
scoreboard objectives add mined_iron minecraft.used:minecraft.iron_pickaxe
scoreboard objectives add mined_diamond minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add calc dummy
scoreboard objectives add sneaking_tunnel minecraft.custom:minecraft.sneak_time
scoreboard players set #version_test calc 0
function 3x3mine:versioncheck
execute if score #version_test calc matches 1 run function 3x3mine:start116