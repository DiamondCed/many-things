tellraw @a {"text":"Envenomed Datapack Loaded!","color":"dark_green"}
scoreboard objectives add hit_wooden minecraft.used:minecraft.wooden_sword
scoreboard objectives add hit_stone minecraft.used:minecraft.stone_sword
scoreboard objectives add hit_gold minecraft.used:minecraft.golden_sword
scoreboard objectives add hit_iron minecraft.used:minecraft.iron_sword
scoreboard objectives add hit_diamond minecraft.used:minecraft.diamond_sword
scoreboard objectives add calc dummy
scoreboard players set #version_test calc 0
function venomblade:versioncheck
execute if score #version_test calc matches 1 run function venomblade:start116