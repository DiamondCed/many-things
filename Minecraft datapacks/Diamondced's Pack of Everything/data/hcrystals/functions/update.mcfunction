execute as @a unless score @s usedhearts matches -1.. run scoreboard players set @s usedhearts 0

execute as @a[scores={usedheart=1..},nbt=!{SelectedItem:{tag:{isHeart:1b}}},nbt={Inventory:[{Slot:-106b,tag:{isHeart:1b}}]}] at @s run function hcrystals:sound
execute as @a[scores={usedheart=1..},nbt={SelectedItem:{tag:{isHeart:1b}}}] at @s run function hcrystals:sound

execute if score #version_check usedheart matches 0 run function hcrystals:update_15
execute if score #version_check usedheart matches 1 run function hcrystals:update_16
execute if score #version_check usedheart matches 2 run function hcrystals:update_17

scoreboard players set @a usedheart 0