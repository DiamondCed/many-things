#refill mainhand
execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run replaceitem entity @s weapon.mainhand crossbow{display:{Name:"{\"text\":\"Vampire Knives\",\"italic\":false,\"color\":\"yellow\"}"},VKnives:1,CustomModelData:2,Unbreakable:1b,Charged:1b,HideFlags:4,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]}

#refill offhand
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run replaceitem entity @s weapon.offhand crossbow{display:{Name:"{\"text\":\"Vampire Knives\",\"italic\":false,\"color\":\"yellow\"}"},VKnives:1,CustomModelData:2,Unbreakable:1b,Charged:1b,HideFlags:4,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]}

#set charged flag in mainhand
#execute as @a[nbt={SelectedItem:{tag:{VKnives:1,Charged:0b}}}] at @s run data modify entity @s SelectedItem.tag.Charged set value 1b

#set charged flag in mainhand
#execute as @a[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1,Charged:0b}}]}] at @s run data modify entity @s Inventory[-1].tag.Charged set value 1b