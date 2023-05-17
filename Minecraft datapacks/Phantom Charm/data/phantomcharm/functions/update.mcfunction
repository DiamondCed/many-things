execute if score duration pcactive matches 1.. run scoreboard players remove duration pcactive 1
execute if score duration pcactive matches 0 run gamerule doInsomnia true

tag @a[scores={charmuse=1..},nbt={Inventory:[{Slot:-106b,tag:{pcharm:1b}}]}] add usedcharm
tag @a[scores={charmuse=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove usedcharm
tag @a[scores={charmuse=1..},nbt={SelectedItem:{tag:{pcharm:1b}}}] add usedcharm

execute as @a[tag=usedcharm,scores={pcactive=0}] at @s run function phantomcharm:toggle

tag @a remove usedcharm
scoreboard players set @a charmuse 0
scoreboard players remove @a[scores={pcactive=1..}] pcactive 1 
execute as @a unless entity @s[scores={pcactive=0..}] run scoreboard players set @s pcactive 0