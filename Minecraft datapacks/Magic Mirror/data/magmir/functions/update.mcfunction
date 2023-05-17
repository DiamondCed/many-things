execute as @a[nbt={SelectedItem:{tag:{isMirror:1b}}},scores={usedmirror=1..}] at @s run tag @s add usedmirror
execute as @a[nbt={SelectedItem:{tag:{isMirror:1b}}},scores={usedmirror=1..}] at @s run function magmir:lowparticles
execute as @a[nbt={SelectedItem:{tag:{isMirror:1b}}},scores={usedmirror=1..}] at @s run function magmir:activatesound
execute as @a[nbt={SelectedItem:{tag:{isMirror:1b}}},scores={usedmirror=1..}] at @s run schedule function magmir:intgohome 20

execute as @a[nbt={Inventory:[{tag:{isMirror:1b},Slot:-106b}]},scores={usedmirror=1..}] at @s run tag @s add usedmirror
execute as @a[nbt={Inventory:[{tag:{isMirror:1b},Slot:-106b}]},scores={usedmirror=1..}] at @s run function magmir:lowparticles
execute as @a[nbt={Inventory:[{tag:{isMirror:1b},Slot:-106b}]},scores={usedmirror=1..}] at @s run schedule function magmir:intgohome 20
scoreboard players set @a usedmirror 0
kill @e[tag=spawntp]