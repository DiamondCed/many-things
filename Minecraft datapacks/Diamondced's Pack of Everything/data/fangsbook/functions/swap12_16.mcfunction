summon item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",Count:1b},Tags:["newitem"]}

execute if entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run data modify entity @e[type=item,limit=1,sort=nearest,tag=newitem] Item.tag set from entity @s SelectedItem.tag
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{fangs:1}}]}] unless entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run data modify entity @e[type=item,limit=1,sort=nearest,tag=newitem] Item.tag set from entity @s Inventory[-1].tag

data modify entity @e[type=item,limit=1,sort=nearest,tag=newitem] Item.tag.mode set value 2
data modify entity @e[type=item,limit=1,sort=nearest,tag=newitem] Item.tag.CustomModelData set value 99
data modify entity @e[type=item,limit=1,sort=nearest,tag=newitem] Item.tag.display.Lore[0] set value '{"text":"Mode: Circle","color":"gray","italic":"false"}'

tag @e remove newitem
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{fangs:1}}]}] unless entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run replaceitem entity @s weapon.offhand air
execute if entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run replaceitem entity @s weapon.mainhand air

