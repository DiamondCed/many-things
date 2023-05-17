execute as @e[type=item,nbt={Item:{id:"minecraft:trident"}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}}] run function unvoidable:addattribute

execute as @e[type=trident,nbt={Trident:{tag:{unvoid:1}}}] at @s if entity @s[y=0,dy=-200] run data modify entity @s DealtDamage set value 1b