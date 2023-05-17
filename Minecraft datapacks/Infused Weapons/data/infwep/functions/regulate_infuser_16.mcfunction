execute unless block ~ ~ ~ dropper{Items:[{Slot:3b}]} run replaceitem block ~ ~ ~ container.3 glass_pane{temp:1b}
execute unless block ~ ~ ~ dropper{Items:[{Slot:5b}]} run replaceitem block ~ ~ ~ container.5 glass_pane{temp:1b}

execute unless block ~ ~ ~ dropper{Items:[{Slot:0b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:0b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:0b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:0b}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[0]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:1b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:1b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:1b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[1]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:2b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:2b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:2b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[2]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:4b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[4]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:6b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:6b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:6b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[6]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:7b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:7b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:7b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[7]
tag @e remove currentitem

execute unless block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:8b}]} run summon item ~ ~0.7 ~ {Item:{id:"minecraft:stick",Count:1b},Tags:["currentitem"]}
execute unless block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{InfuserGUI:1b}}]} run data modify entity @e[tag=currentitem,limit=1] Item set from block ~ ~ ~ Items[8]
tag @e remove currentitem

execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{temp:1b}}]} run replaceitem block ~ ~ ~ container.3 air
execute if block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{temp:1b}}]} run replaceitem block ~ ~ ~ container.5 air


execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:potion"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:spectral_arrow"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:wither_skeleton_skull"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_powder"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_rod"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:shulker_shell"}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} unless block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:apply_infusion

execute at @s if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:water"}}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{InfuserGUI:1b}}]} if block ~ ~ ~ dropper{Items:[{Slot:5b}]} if block ~ ~ ~ dropper{Items:[{Slot:5b,tag:{Infused:1b}}]} run function infwep:clear_infusion





replaceitem block ~ ~ ~ container.0 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.1 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.2 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.6 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.7 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.8 white_stained_glass_pane{InfuserGUI:1b,display:{Name:"{\"text\":\"\"}"}}
replaceitem block ~ ~ ~ container.4 arrow{InfuserGUI:1b,display:{Name:"{\"text\":\"Confirm Infusion\",\"italic\":\"false\"}"}}