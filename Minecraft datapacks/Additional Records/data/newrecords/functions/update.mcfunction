#manage disc stopping
execute as @e[type=item,nbt={Item:{tag:{customRecord:1b}}},tag=!hasStopped] at @s if block ~ ~ ~ jukebox run function newrecords:stop_music
execute as @e[type=item,nbt={Item:{tag:{customRecord:1b}}},tag=!hasStopped] at @s if block ~ ~-1 ~ jukebox run function newrecords:stop_music


#manage disc using
execute as @a[tag=hasRecord,scores={usedrecord=1..},gamemode=!creative] unless entity @s[nbt={SelectedItem:{tag:{customRecord:1b}}}] at @s run function newrecords:play_correct_record
execute as @a[tag=hasRecord,scores={usedrecord=1..},gamemode=creative] at @s run function newrecords:play_correct_record
tag @a remove hasRecord
function newrecords:clear_tags
tag @a[nbt={SelectedItem:{tag:{customRecord:1b}}}] add hasRecord
function newrecords:add_tags
scoreboard players set @a usedrecord 0