tellraw @a {"text":"Crystal Hearts Pack loaded!","color":"green"}
scoreboard objectives add usedhearts dummy
scoreboard objectives add usedheart minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add hasdied deathCount

scoreboard players set #version_check usedheart 0
function hcrystals:version_check_16
function hcrystals:version_check_17

execute if score #version_check usedheart matches 0 run function hcrystals:slow_loop