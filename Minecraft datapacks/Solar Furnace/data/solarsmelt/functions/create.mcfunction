summon armor_stand ~ ~-1.55 ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:[solarsmelt],HandItems:[{id:"minecraft:glowstone_dust",Count:1b},{}],ArmorItems:[{},{},{},{id:"minecraft:daylight_detector",Count:1b}],Pose:{RightArm:[0f,0f,327f]}}

kill @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:1b}},distance=..1,limit=1]

kill @s