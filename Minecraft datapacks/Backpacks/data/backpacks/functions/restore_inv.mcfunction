tag @s add current
execute as @e[tag=storagebp] if score @s playeridbp = @e[tag=current,limit=1] playeridbp run tag @s add sender

# check if the backpack was mistakenly put in its own space to prevent erasing it forever in a paradox
execute if entity @s[nbt={Inventory:[{Slot:15b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:15b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:15b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:16b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:16b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:16b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:17b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:17b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:17b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:24b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:24b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:24b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:25b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:25b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:25b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:26b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:26b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:26b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:33b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:33b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:33b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:34b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:34b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:34b}]
tag @e remove currentItem
execute if entity @s[nbt={Inventory:[{Slot:35b,tag:{isBackpack:1b}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[nbt={Inventory:[{Slot:35b,tag:{isBackpack:1b}}]}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:35b}]
tag @e remove currentItem


# restore items to inventory unless player died
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:15b}]
item replace entity @s container.15 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:16b}]
item replace entity @s container.16 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:17b}]
item replace entity @s container.17 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:24b}]
item replace entity @s container.24 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:25b}]
item replace entity @s container.25 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:26b}]
item replace entity @s container.26 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:33b}]
item replace entity @s container.33 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:34b}]
item replace entity @s container.34 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set value {}
execute as @e[tag=sender] run data modify entity @s ArmorItems[2] set from entity @s HandItems[0].tag.BlockEntityData.Items[{Slot:35b}]
item replace entity @s container.35 from entity @e[tag=sender,limit=1,sort=nearest] armor.chest

# spawn items on ground if player died
execute if score @s diedbp matches 1.. at @s as @e[tag=storagebp] if score @s playeridbp = @p playeridbp run tag @s add sender

execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:15b}] run say hi
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:15b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:15b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:16b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:16b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:17b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:17b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:24b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:24b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:25b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:25b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:26b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:26b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:33b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:33b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:34b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:34b}]
tag @e remove currentItem
execute if entity @s[scores={diedbp=1..}] if data entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:35b}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["currentItem"]}
execute if entity @s[scores={diedbp=1..}] at @s run data modify entity @e[tag=currentItem,limit=1,sort=nearest] Item set from entity @e[tag=sender,limit=1,sort=nearest] HandItems[0].tag.BlockEntityData.Items[{Slot:35b}]
tag @e remove currentItem



execute as @e[tag=sender] run data modify entity @s HandItems[0].tag.BlockEntityData.Items set value []

tag @e remove sender
tag @s remove current