tag @a[nbt={Inventory:[{Slot:-106b,tag:{rainstone:1b}}]}] add hasStone
tag @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove hasStone
tag @a[nbt={SelectedItem:{tag:{rainstone:1b}}}] add hasStone

execute as @a[tag=hasStone,scores={used_rainstone=1..}] run function rainstone:swapweather

tag @a remove hasStone
scoreboard players set @a used_rainstone 0