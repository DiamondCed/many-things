execute as @a unless entity @s[scores={playeridbp=0..}] run scoreboard players set @s playeridbp 0
execute as @a[scores={playeridbp=0}] run function backpacks:setid

tag @a remove hadBackpack
tag @a[tag=hasBackpack] add hadBackpack
tag @a remove hasBackpack
tag @a[nbt={Inventory:[{Slot:-106b,tag:{isBackpack:1b}}]}] add hasBackpack

# has backpack but didn't have backpack before
execute as @a[tag=hasBackpack, tag=!hadBackpack] run function backpacks:store_inv
execute as @a[tag=hasBackpack, tag=!hadBackpack] run function backpacks:restore_bp

# has backpack and had backpack before
execute as @a[tag=hasBackpack, tag=hadBackpack] run function backpacks:store_bp

# doesn't have backpack but had backpack before
execute as @a[tag=!hasBackpack, tag=hadBackpack] run function backpacks:restore_inv

scoreboard players set @a diedbp 0

execute as @a[tag=hasBackpack] store result score @s prevbpID run data get entity @s Inventory[{Slot:-106b}].tag.UUID
scoreboard players set @a[tag=!hasBackpack] prevbpID 0

# add backpack trade to master level leatherworkers only once
execute as @e[type=villager,tag=!bpSwapTrade,nbt={VillagerData:{profession:"minecraft:leatherworker",level:5}}] run function backpacks:modify_trade