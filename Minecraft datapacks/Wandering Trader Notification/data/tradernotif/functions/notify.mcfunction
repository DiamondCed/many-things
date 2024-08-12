# runs as+at wandering trader
# this dance with the tag sucks but I don't know how else to test for an unset score
tag @a[scores={trader_notif_ignore=1}] add traderNotifIgnore
tellraw @a[tag=!traderNotifIgnore] {"selector":"@s","extra":[{"text":" has spawned near "},{"selector":"@p"}]}
tag @s add hasNotified
tag @a remove traderNotifIgnore