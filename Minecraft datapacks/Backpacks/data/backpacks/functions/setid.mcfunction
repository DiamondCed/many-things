scoreboard players add #prevID previdbp 1
scoreboard players operation @s playeridbp = #prevID previdbp

summon armor_stand 0 -65 0 {Tags:["storagebp","current"],NoAI:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Invisible:1b,HandItems:[{id:"minecraft:chest",Count:1b,tag:{BlockEntityData:{Items:[]}}}]}


execute store result score @e[tag=current] playeridbp run scoreboard players get @s playeridbp

tag @e remove current