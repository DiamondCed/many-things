#refill mainhand
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @s SelectedItem.tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]

#refill offhand
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @s Inventory[-1].tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]

#set charged flag in mainhand
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @s SelectedItem.tag.Charged set value 1b

#set charged flag in mainhand
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @s Inventory[-1].tag.Charged set value 1b