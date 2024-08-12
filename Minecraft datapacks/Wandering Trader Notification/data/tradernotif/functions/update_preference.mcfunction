# implementation kinda sucks but I just wanted to notify the player of what changed
scoreboard players set @s trader_notif 0
scoreboard players add @s trader_notif_ignore 1
scoreboard players set @s[scores={trader_notif_ignore=2..}] trader_notif_ignore 0

tellraw @s[scores={trader_notif_ignore=1}] {"text":"You will no longer be notified of wandering traders", "italic":true, "color":"gray"}
tellraw @s[scores={trader_notif_ignore=0}] {"text":"You will now be notified of wandering traders", "italic":true, "color":"gray"}