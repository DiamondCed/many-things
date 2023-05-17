#say hi
tag @s add hasStopped
execute if entity @s[nbt={Item:{tag:{recordId:1b}}}] run stopsound @a record minecraft:music.credits
execute if entity @s[nbt={Item:{tag:{recordId:2b}}}] run stopsound @a record minecraft:music.creative
execute if entity @s[nbt={Item:{tag:{recordId:3b}}}] run stopsound @a record minecraft:music.game
execute if entity @s[nbt={Item:{tag:{recordId:4b}}}] run stopsound @a record minecraft:music.end
execute if entity @s[nbt={Item:{tag:{recordId:5b}}}] run stopsound @a record minecraft:music.menu
execute if entity @s[nbt={Item:{tag:{recordId:6b}}}] run stopsound @a record minecraft:music.under_water

execute if entity @s[nbt={Item:{tag:{recordId:21b}}}] run stopsound @a record minecraft:custom1
execute if entity @s[nbt={Item:{tag:{recordId:22b}}}] run stopsound @a record minecraft:custom2
execute if entity @s[nbt={Item:{tag:{recordId:23b}}}] run stopsound @a record minecraft:custom3
execute if entity @s[nbt={Item:{tag:{recordId:24b}}}] run stopsound @a record minecraft:custom4
execute if entity @s[nbt={Item:{tag:{recordId:25b}}}] run stopsound @a record minecraft:custom5