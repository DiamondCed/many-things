summon armor_stand ^ ^ ^3 {Tags:["healcheck","current"],Marker:1b,Invisible:1b}
scoreboard players operation @e[tag=current,limit=1,sort=nearest] knivesid = @s knivesid
tag @e[tag=healcheck] remove current