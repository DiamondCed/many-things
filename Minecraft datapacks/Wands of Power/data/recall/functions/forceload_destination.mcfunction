data modify entity @s Pos set from storage rc tpParams.Position
data modify entity @s Rotation set from entity @p[tag=temp_tele] Rotation
execute at @s run tp @s ~ ~ ~ ~ ~

execute store success score @s calc run forceload add ~ ~

#execute at @s run summon armor_stand ~ ~ ~ {Tags:["newCurrRc"],Invisible:1b,Marker:1b}
#tag @e[tag=newCurrRc,limit=1,sort=nearest] add currRc
#tag @e remove newCurrRc
#kill @s