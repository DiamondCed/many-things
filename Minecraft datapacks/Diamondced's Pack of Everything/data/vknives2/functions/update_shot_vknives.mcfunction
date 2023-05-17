# mark arrows to age and despawn eventually
data modify storage vknives2 compare set from entity @s UUID
execute as @e[type=arrow,distance=..2,tag=!vknife2] run function vknives2:detect_vknives_owner

# add tags for next step
execute if entity @s[nbt={SelectedItem:{tag:{VKnives:1}}}] run tag @s add main_temp
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{VKnives:1}}]}] run tag @s add off_temp

# refill mainhand
execute if entity @s[tag=main_temp] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["vktemp"],ArmorItems:[{},{},{},{}]}
execute if entity @s[tag=main_temp] run data modify entity @e[type=armor_stand,tag=vktemp,limit=1,sort=nearest] ArmorItems[2] set from entity @s SelectedItem
execute if entity @s[tag=main_temp] run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]
execute if entity @s[tag=main_temp] run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.Charged set value 1b
execute if entity @s[tag=main_temp] run item replace entity @s weapon.mainhand from entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] armor.chest
kill @e[tag=vktemp,type=armor_stand]

# refill offhand
execute if entity @s[tag=off_temp] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["vktemp"],ArmorItems:[{},{},{},{}]}
execute if entity @s[tag=off_temp] run data modify entity @e[type=armor_stand,tag=vktemp,limit=1,sort=nearest] ArmorItems[2] set from entity @s Inventory[-1]
execute if entity @s[tag=off_temp] run data modify entity @s Inventory[-1].tag.ChargedProjectiles set value [{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}},{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:16711680,display:{Name:"{\"text\":\"Vampire Knives\",\"color\":\"red\",\"italic\":\"false\"}"}}}]
execute if entity @s[tag=off_temp] run data modify entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] ArmorItems[2].tag.Charged set value 1b
execute if entity @s[tag=off_temp] run item replace entity @s weapon.offhand from entity @e[tag=vktemp,limit=1,sort=nearest,type=armor_stand] armor.chest
kill @e[tag=vktemp,type=armor_stand]

# remove tags from previous step
tag @s remove main_temp
tag @s remove off_temp

tag @s remove shotVknives