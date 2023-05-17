
#refill mainhand
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["vktemp"],ArmorItems:[{},{},{},{}]}
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @e[type=armor_stand,tag=vktemp,limit=1,sort=nearest] ArmorItems[2] set from entity @s SelectedItem
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.Charged set value 1b
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run item replace entity @s weapon.mainhand from entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] armor.chest
kill @e[tag=vktemp,type=armor_stand]

#refill offhand
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["vktemp"],ArmorItems:[{},{},{},{}]}
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @e[type=armor_stand,tag=vktemp,limit=1,sort=nearest] ArmorItems[2] set from entity @s Inventory[-1]
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @s Inventory[-1].tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.Charged set value 1b
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run item replace entity @s weapon.offhand from entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] armor.chest
kill @e[tag=vktemp,type=armor_stand]

#set charged flag in mainhand
#

#set charged flag in mainhand
#