execute as @a[scores={playerid=0}] run function psc2:setid

tag @a[nbt={Inventory:[{Slot:-106b,tag:{issummon:1b}}]}] add hassummon
tag @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] remove hassummon
tag @a[nbt={SelectedItem:{tag:{issummon:1b}}}] add hassummon

execute as @a[scores={usedsummon=1..},tag=hassummon] at @s run function psc2:bringcart

scoreboard players set @a usedsummon 0
tag @a remove hassummon
execute as @e[tag=storagecart] run data modify entity @s Motion set value [0.0,0.0,0.0]
execute as @e[tag=storagecart] at @s unless entity @p[distance=..4] at @s run function psc2:destroy