scoreboard players add @s usedhearts 1

item replace entity @s[gamemode=!creative,nbt=!{SelectedItem:{tag:{isHeart:1b}}},nbt={Inventory:[{Slot:-106b,tag:{isHeart:1b}}]}] weapon.offhand with air
item replace entity @s[gamemode=!creative,nbt={SelectedItem:{tag:{isHeart:1b}}}] weapon.mainhand with air

scoreboard players set @s usedheart 0

#effect give @s instant_health 1 0 true