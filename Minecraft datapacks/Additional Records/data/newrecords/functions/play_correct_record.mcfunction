#say hi
#playsound minecraft:block.anvil.place record @a ~ ~ ~ 1
schedule function newrecords:remove_spoopy 2
execute if entity @s[tag=hasRecord1] at @s run playsound minecraft:music.credits record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord1] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - Credits","color":"light_purple"}
execute if entity @s[tag=hasRecord2] at @s run playsound minecraft:music.creative record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord2] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - Creative Ambient","color":"aqua"}
execute if entity @s[tag=hasRecord3] at @s run playsound minecraft:music.game record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord3] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - Ambient","color":"green"}
execute if entity @s[tag=hasRecord4] at @s run playsound minecraft:music.end record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord4] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - The End","color":"light_purple"}
execute if entity @s[tag=hasRecord5] at @s run playsound minecraft:music.menu record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord5] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - Main Menu","color":"gray"}
execute if entity @s[tag=hasRecord6] at @s run playsound minecraft:music.under_water record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord6] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: C418 - Underwater","color":"aqua"}

execute if entity @s[tag=hasRecord21] at @s run playsound minecraft:custom1 record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord21] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: Custom Track 1","color":"aqua"}
execute if entity @s[tag=hasRecord22] at @s run playsound minecraft:custom2 record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord22] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: Custom Track 2","color":"blue"}
execute if entity @s[tag=hasRecord23] at @s run playsound minecraft:custom3 record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord23] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: Custom Track 3","color":"yellow"}
execute if entity @s[tag=hasRecord24] at @s run playsound minecraft:custom4 record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord24] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: Custom Track 4","color":"blue"}
execute if entity @s[tag=hasRecord25] at @s run playsound minecraft:custom5 record @a ~ ~ ~ 1
execute if entity @s[tag=hasRecord25] at @s run title @a[distance=..75] actionbar {"text":"Now Playing: Custom Track 5","color":"green"}