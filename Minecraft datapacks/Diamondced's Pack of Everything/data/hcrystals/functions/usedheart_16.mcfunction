scoreboard players add @s usedhearts 1

replaceitem entity @s[gamemode=!creative,nbt=!{SelectedItem:{tag:{isHeart:1b}}},nbt={Inventory:[{Slot:-106b,tag:{isHeart:1b}}]}] weapon.offhand air
replaceitem entity @s[gamemode=!creative,nbt={SelectedItem:{tag:{isHeart:1b}}}] weapon.mainhand air

scoreboard players set @s usedheart 0

#effect give @s instant_health 1 0 true