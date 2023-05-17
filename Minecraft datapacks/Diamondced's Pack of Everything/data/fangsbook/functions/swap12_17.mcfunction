summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["temp_BoF"],ArmorItems:[{},{},{},{}]}

execute if entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run data modify entity @e[type=armor_stand,limit=1,sort=nearest,tag=temp_BoF] ArmorItems[2] set from entity @s SelectedItem
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{fangs:1}}]}] run data modify entity @e[type=armor_stand,limit=1,sort=nearest,tag=temp_BoF] ArmorItems[2] set from entity @s Inventory[-1]

data modify entity @e[type=armor_stand,limit=1,sort=nearest,tag=temp_BoF] ArmorItems[2].tag.mode set value 2
data modify entity @e[type=armor_stand,limit=1,sort=nearest,tag=temp_BoF] ArmorItems[2].tag.CustomModelData set value 99
data modify entity @e[type=armor_stand,limit=1,sort=nearest,tag=temp_BoF] ArmorItems[2].tag.display.Lore[0] set value '{"text":"Mode: Circle","color":"gray","italic":"false"}'

execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{fangs:1}}]}] unless entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run item replace entity @s weapon.offhand from entity @e[limit=1,sort=nearest,tag=temp_BoF] armor.chest
execute if entity @s[nbt={SelectedItem:{tag:{fangs:1}}}] run item replace entity @s weapon.mainhand from entity @e[limit=1,sort=nearest,tag=temp_BoF] armor.chest

kill @e[tag=temp_BoF]