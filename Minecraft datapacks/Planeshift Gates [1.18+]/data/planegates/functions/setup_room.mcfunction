forceload add ~ ~ ~48 ~48
fill ~-3 ~-4 ~-3 ~50 ~-4 ~50 barrier
#0-11
fill ~-3 ~-3 ~-3 ~50 ~35 ~11 black_concrete_powder
fill ~-2 ~-2 ~-2 ~49 ~34 ~11 barrier
fill ~-1 ~-1 ~-1 ~48 ~33 ~11 black_concrete
fill ~ ~ ~ ~47 ~32 ~11 air
#12-23
fill ~-3 ~-3 ~12 ~50 ~35 ~23 black_concrete_powder
fill ~-2 ~-2 ~12 ~49 ~34 ~23 barrier
fill ~-1 ~-1 ~12 ~48 ~33 ~23 black_concrete
fill ~ ~ ~12 ~47 ~32 ~23 air
#24-35
fill ~-3 ~-3 ~24 ~50 ~35 ~35 black_concrete_powder
fill ~-2 ~-2 ~24 ~49 ~34 ~35 barrier
fill ~-1 ~-1 ~24 ~48 ~33 ~35 black_concrete
fill ~ ~ ~24 ~47 ~32 ~35 air
#36-47
fill ~-3 ~-3 ~36 ~50 ~35 ~50 black_concrete_powder
fill ~-2 ~-2 ~36 ~49 ~34 ~49 barrier
fill ~-1 ~-1 ~36 ~48 ~33 ~48 black_concrete
fill ~ ~ ~36 ~47 ~32 ~47 air

#structure_block[mode=load]{mode:"LOAD"}

summon armor_stand ~23.5 ~ ~23.5 {Marker:1b,NoGravity:1b,Invisible:1b,Tags:["current","planeGateMarker","planeTech"]}
scoreboard players operation @e[tag=current,limit=1,sort=nearest] planeCalc = #roomid planeCalc

execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=0}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_oak"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=1}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_birch"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=2}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_spruce"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=3}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_jungle"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=4}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_acacia"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=5}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_dark_oak"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=6}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_warped"}
execute at @e[tag=current,limit=1,sort=nearest,scores={planeCalc=7}] run setblock ~-4 ~-1 ~-4 structure_block{mode:"LOAD",name:"planegates:center_crimson"}

execute at @e[tag=current,limit=1,sort=nearest] run setblock ~-4 ~ ~-4 redstone_block

tag @e[tag=current,limit=1,sort=nearest] remove current