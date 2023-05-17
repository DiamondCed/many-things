#check which slot is free (priority going from last slot to first)
execute unless block ~ ~ ~ barrel{Items:[{Slot:0b}]} run scoreboard players set #temp stack_target 0
execute unless block ~ ~ ~ barrel{Items:[{Slot:1b}]} run scoreboard players set #temp stack_target 1
execute unless block ~ ~ ~ barrel{Items:[{Slot:2b}]} run scoreboard players set #temp stack_target 2
execute unless block ~ ~ ~ barrel{Items:[{Slot:3b}]} run scoreboard players set #temp stack_target 3
execute unless block ~ ~ ~ barrel{Items:[{Slot:4b}]} run scoreboard players set #temp stack_target 4
execute unless block ~ ~ ~ barrel{Items:[{Slot:5b}]} run scoreboard players set #temp stack_target 5
execute unless block ~ ~ ~ barrel{Items:[{Slot:6b}]} run scoreboard players set #temp stack_target 6
execute unless block ~ ~ ~ barrel{Items:[{Slot:7b}]} run scoreboard players set #temp stack_target 7
execute unless block ~ ~ ~ barrel{Items:[{Slot:8b}]} run scoreboard players set #temp stack_target 8
execute unless block ~ ~ ~ barrel{Items:[{Slot:9b}]} run scoreboard players set #temp stack_target 9
execute unless block ~ ~ ~ barrel{Items:[{Slot:10b}]} run scoreboard players set #temp stack_target 10
execute unless block ~ ~ ~ barrel{Items:[{Slot:11b}]} run scoreboard players set #temp stack_target 11
execute unless block ~ ~ ~ barrel{Items:[{Slot:12b}]} run scoreboard players set #temp stack_target 12
execute unless block ~ ~ ~ barrel{Items:[{Slot:13b}]} run scoreboard players set #temp stack_target 13
execute unless block ~ ~ ~ barrel{Items:[{Slot:14b}]} run scoreboard players set #temp stack_target 14
execute unless block ~ ~ ~ barrel{Items:[{Slot:15b}]} run scoreboard players set #temp stack_target 15
execute unless block ~ ~ ~ barrel{Items:[{Slot:16b}]} run scoreboard players set #temp stack_target 16
execute unless block ~ ~ ~ barrel{Items:[{Slot:17b}]} run scoreboard players set #temp stack_target 17
execute unless block ~ ~ ~ barrel{Items:[{Slot:18b}]} run scoreboard players set #temp stack_target 18
execute unless block ~ ~ ~ barrel{Items:[{Slot:19b}]} run scoreboard players set #temp stack_target 19
execute unless block ~ ~ ~ barrel{Items:[{Slot:20b}]} run scoreboard players set #temp stack_target 20
execute unless block ~ ~ ~ barrel{Items:[{Slot:21b}]} run scoreboard players set #temp stack_target 21
execute unless block ~ ~ ~ barrel{Items:[{Slot:22b}]} run scoreboard players set #temp stack_target 22
execute unless block ~ ~ ~ barrel{Items:[{Slot:23b}]} run scoreboard players set #temp stack_target 23
execute unless block ~ ~ ~ barrel{Items:[{Slot:24b}]} run scoreboard players set #temp stack_target 24
execute unless block ~ ~ ~ barrel{Items:[{Slot:25b}]} run scoreboard players set #temp stack_target 25
execute unless block ~ ~ ~ barrel{Items:[{Slot:26b}]} run scoreboard players set #temp stack_target 26

#prevent transfer to slot 0
execute unless score #temp stack_target matches 0 run tag @s add transfer

#set slot number of first slot of storage, then transfer to second slot of barrel list (positioned depending on slot value)
execute if entity @s[tag=transfer] store result entity @s Item.tag.DeepItems[0].Slot byte 1 run scoreboard players get #temp stack_target
execute if entity @s[tag=transfer] run data modify block ~ ~ ~ Items append from entity @s Item.tag.DeepItems[0]
execute if entity @s[tag=transfer] run data remove entity @s Item.tag.DeepItems[0]

tag @s remove transfer