# implementation kinda sucks but I just wanted to notify the player of what changed
scoreboard players set @s private_coordinates 0
scoreboard players add @s private_coords_setting 1
scoreboard players set @s[scores={private_coords_setting=2..}] private_coords_setting 0

tellraw @s[scores={private_coords_setting=1}] {"text":"Your death coordinates will only be visible to you", "italic":true, "color":"gray"}
tellraw @s[scores={private_coords_setting=0}] {"text":"Your death coordinates will be visible to everyone", "italic":true, "color":"gray"}