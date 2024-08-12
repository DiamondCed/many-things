# manage notification subscriptions setting
execute as @a[scores={trader_notif=1..}] run function tradernotif:update_preference
scoreboard players enable @a trader_notif

# manage trader spawning
execute as @e[type=wandering_trader, tag=!hasNotified] at @s run function tradernotif:notify
