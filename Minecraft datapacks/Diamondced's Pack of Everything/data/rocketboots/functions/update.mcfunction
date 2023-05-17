effect clear @a[tag=remfly] levitation
tag @a remove remfly

tag @a remove hasRocketBoots
tag @a remove hasSpectreBoots
execute as @a run function rocketboots:detect_items

execute as @e[type=item,nbt={Item:{tag:{isRocketBoots:1b}}},nbt=!{Item:{tag:{isSpectreBoots:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isBoots:1b}}},nbt=!{Item:{tag:{isSpectreBoots:1b}}}] run function rocketboots:fuse

execute as @a[tag=unsneak] if score @s sneakrb = @s prevsneakrb run scoreboard players set @s sneakrb 0
execute as @a[tag=unsneak] if score @s sneakrb = @s prevsneakrb run tag @s remove unsneak

tag @a[tag=cancel,tag=usedCloud] add unsneak
tag @a[tag=cancel,tag=usedBlizzard] add unsneak
tag @a[tag=cancel,tag=usedSandstorm] add unsneak


tag @a remove cancel
tag @a[tag=hasCloud,tag=!usedCloud] add cancel
tag @a[tag=hasBlizzard,tag=!usedBlizzard] add cancel
tag @a[tag=hasSandstorm,tag=!usedSandstorm] add cancel

execute as @a[tag=hasRocketBoots,tag=!hasSpectreBoots,tag=!unsneak,tag=!depletedBoots,tag=!cancel,scores={sneakrb=1..},nbt={OnGround:0b,abilities:{flying:0b}}] unless score @s sneakrb = @s prevsneakrb at @s unless block ~ ~ ~ #minecraft:climbable run function rocketboots:fly
execute as @a[tag=hasRocketBoots,tag=hasSpectreBoots,tag=!unsneak,tag=!depletedBoots,tag=!cancel,scores={sneakrb=1..},nbt={OnGround:0b,abilities:{flying:0b}}] unless score @s sneakrb = @s prevsneakrb at @s unless block ~ ~ ~ #minecraft:climbable run function rocketboots:fly_spectre

tag @a add temp_soundfix
execute as @a[tag=hasRocketBoots,tag=!unsneak,tag=!depletedBoots,tag=!cancel,scores={sneakrb=1..},nbt={OnGround:0b,abilities:{flying:0b}}] unless score @s sneakrb = @s prevsneakrb at @s run tag @s remove temp_soundfix
execute as @a[tag=temp_soundfix] run scoreboard players set @s soundtimer 0
tag @a remove temp_soundfix

execute as @a[tag=hasRocketBoots,nbt={OnGround:0b},scores={sneakrb=1..}] if score @s sneakrb = @s prevsneakrb run tag @s add remfly
tag @a[tag=depletedBoots] add remfly

execute as @a run scoreboard players operation @s prevsneakrb = @s sneakrb
scoreboard players set @a[nbt={OnGround:1b}] sneakrb 0
scoreboard players set @a[nbt={abilities:{flying:1b}}] sneakrb 0
tag @a[nbt={OnGround:1b}] remove depletedBoots
scoreboard players set @a[tag=cancel] sneakrb 0
tag @a[scores={sneakrb=32..}] add depletedBoots

execute as @e[type=wandering_trader,tag=!attempt_rb] at @s run function rocketboots:swap_trade