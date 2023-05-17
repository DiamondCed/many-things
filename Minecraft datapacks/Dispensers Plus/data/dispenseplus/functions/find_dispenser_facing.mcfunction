execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ dispenser[triggered=true] run summon armor_stand ~ ~-1 ~ {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~ ~-1 ~ dispenser[triggered=true,facing=up] run tag @s add up
execute if entity @s[tag=!found] if block ~ ~-1 ~ dispenser[triggered=true,facing=up] run tag @s add found
execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~1 ~ dispenser[triggered=true] run summon armor_stand ~ ~1 ~ {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~ ~1 ~ dispenser[triggered=true,facing=down] run tag @s add down
execute if entity @s[tag=!found] if block ~ ~1 ~ dispenser[triggered=true,facing=down] run tag @s add found
execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~-1 ~ ~ dispenser[triggered=true] run summon armor_stand ~-1 ~ ~ {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~-1 ~ ~ dispenser[triggered=true,facing=east] run tag @s add east
execute if entity @s[tag=!found] if block ~-1 ~ ~ dispenser[triggered=true,facing=east] run tag @s add found
execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~1 ~ ~ dispenser[triggered=true] run summon armor_stand ~1 ~ ~ {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~1 ~ ~ dispenser[triggered=true,facing=west] run tag @s add west
execute if entity @s[tag=!found] if block ~1 ~ ~ dispenser[triggered=true,facing=west] run tag @s add found
execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~-1 dispenser[triggered=true] run summon armor_stand ~ ~ ~-1 {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~ ~ ~-1 dispenser[triggered=true,facing=south] run tag @s add south
execute if entity @s[tag=!found] if block ~ ~ ~-1 dispenser[triggered=true,facing=south] run tag @s add found
execute if entity @s[tag=!found] align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~1 dispenser[triggered=true] run summon armor_stand ~ ~ ~1 {Tags:["dispenseplus"],Invisible:1b,Marker:1b}
execute if entity @s[tag=!found] if block ~ ~ ~1 dispenser[triggered=true,facing=north] run tag @s add north
execute if entity @s[tag=!found] if block ~ ~ ~1 dispenser[triggered=true,facing=north] run tag @s add found