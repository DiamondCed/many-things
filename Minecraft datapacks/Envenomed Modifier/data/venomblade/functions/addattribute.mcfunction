execute unless entity @s[nbt={Item:{tag:{venomBlade:1b}}}] run data modify entity @s Item.tag.display.Lore append value '{"text":"Envenomed","italic":"false","color":"dark_aqua"}'

execute unless entity @s[nbt={Item:{tag:{venomBlade:1b}}}] run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:spider_eye",Count:3b}},limit=1,sort=nearest]

execute unless entity @s[nbt={Item:{tag:{venomBlade:1b}}}] run data modify entity @s Item.tag.venomBlade set value 1b

