execute store result score @s calc run time query daytime
execute unless block ~ ~1 ~ furnace{Items:[{Slot:1b}]} unless score @s calc matches 12720..23300 run replaceitem block ~ ~1 ~ container.1 daylight_detector{solarsmelt:1b,display:{Name:'{"text":"Solar Furnace","italic":"false"}'}}

#times for powers:
# 0: 13680-22340
#<1: 13220-22800
#<2: 12940-23080
#<3: 12720-23300
