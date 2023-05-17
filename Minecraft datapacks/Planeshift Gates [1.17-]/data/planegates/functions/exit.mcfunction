scoreboard players operation @s planeCalc *= $1 planeCalc
tag @s add invalid
tag @s[scores={planeY=0..}] remove invalid
execute unless entity @s[tag=invalid] align xyz positioned ~0.5 ~ ~0.5 run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["exitTemp","planeTech","current"]}
tag @s add currentTarget
execute unless entity @s[tag=invalid] as @e[tag=exitTemp,tag=current,limit=1,sort=nearest] at @s run function planegates:load_area
execute if entity @s[tag=invalid] run tp @s @e[tag=planeGateMarker,limit=1,sort=nearest]
execute if entity @s[tag=invalid] run data modify entity @s Motion set value [0.0,0.5,0.0]
tag @s remove invalid
tag @s remove currentTarget

scoreboard players set @s planeCool 20

tag @s add getSound

xp add @s 0 levels
schedule function planegates:play_sound 1t