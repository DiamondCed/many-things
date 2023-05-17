scoreboard players add @s usedhearts 1

function hcrystals:updatehearts_15

replaceitem entity @s[gamemode=!creative,nbt=!{SelectedItem:{tag:{isHeart:1b}}},nbt={Inventory:[{Slot:-106b,tag:{isHeart:1b}}]}] weapon.offhand air
replaceitem entity @s[gamemode=!creative,nbt={SelectedItem:{tag:{isHeart:1b}}}] weapon.mainhand air

effect give @s instant_health 1 4 true

scoreboard players set @s usedheart 0

#function hcrystals:sound


#playsound minecraft:block.note_block.chime player @s ~ ~ ~ 1 2

#playsound minecraft:block.note_block.chime player @s ~ ~ ~ 0.5 1.916

#playsound minecraft:block.note_block.bell player @s ~ ~ ~ 1 2

#playsound minecraft:block.redstone_torch.burnout player @s ~ ~ ~ 0.2 2