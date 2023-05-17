execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changesword

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changepick

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_axe"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changeaxe

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_shovel"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changeshovel

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changehoe

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_helmet"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changehelmet

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_chestplate"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changechestplate

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_leggings"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changeleggings

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_boots"}},nbt=!{SelectedItem:{tag:{tags:[{modified:1}]}}}] at @s run function random:changeboots

function random:grounditems
schedule function random:slow_loop 1s