execute as @a[scores={usedheart=1..,usedhearts=..4},nbt={SelectedItem:{tag:{isHeart:1b}}}] at @s run function hcrystals:usedheart_15
execute as @a[scores={usedheart=1..,usedhearts=..4},nbt={Inventory:[{Slot:-106b,tag:{isHeart:1b}}]}] at @s run function hcrystals:usedheart_15

execute as @a[scores={hasdied=1,usedhearts=1..},nbt={Health:20.0f}] run function hcrystals:updatehearts_15

execute as @a[scores={hasdied=1,usedhearts=1..},nbt={Health:20.0f}] run effect give @s instant_health 1 4 true

execute as @a[scores={hasdied=1},nbt={Health:20.0f}] run scoreboard players set @s hasdied 0