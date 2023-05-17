execute store result score @s calc run time query daytime

execute unless block ~ ~1 ~ furnace{Items:[{Slot:1b}]} unless score @s calc matches 12720..23300 positioned ~ ~2 ~ if predicate solarsmelt:solared positioned ~ ~-2 ~ run item replace block ~ ~1 ~ container.1 with daylight_detector{solarsmelt:1b,display:{Name:'{"text":"Solar Furnace","italic":"false"}'}}
