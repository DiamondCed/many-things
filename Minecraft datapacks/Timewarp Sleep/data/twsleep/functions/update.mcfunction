gamerule playersSleepingPercentage 110

# save previous skip state
scoreboard players operation #prevCanSkip calc = #canSkip calc

# determine if the timewarp can occur (cancelled if awake players in overworld, or nobody in overworld)
scoreboard players set #canSkip calc 1
execute as @a[nbt={Dimension:"minecraft:overworld"}] unless score @s isSleeping matches 0 run scoreboard players set #canSkip calc 0
execute unless entity @a[nbt={Dimension:"minecraft:overworld"}] run scoreboard players set #canSkip calc 0

# timeskip factor: 60x
# assumed randomTickSpeed: 3 
# start or stop timewarp if #prevCanSkip and #canSkip don't match
execute if score #canSkip calc matches 1 if score #prevCanSkip calc matches 0 run gamerule randomTickSpeed 180
execute if score #canSkip calc matches 0 if score #prevCanSkip calc matches 1 run gamerule randomTickSpeed 3

# fast forward daytime if doDaylightCycle is true
execute store result score #daylightCycle calc run gamerule doDaylightCycle
execute if score #canSkip calc matches 1 if score #daylightCycle calc matches 1 run time add 59