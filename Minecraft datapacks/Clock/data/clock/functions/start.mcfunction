bossbar add clock ""
execute unless score #init showclock matches 1 run bossbar set minecraft:clock name [{"text":"|","color":"white","bold":"true"},{"text":"______Day______","color":"yellow","bold":"false"},{"text":"|","color":"white","bold":"true"},{"text":"_____Night_____","color":"blue","bold":"false"},{"text":"|","color":"white","bold":"true"}]
bossbar set clock players @a
bossbar set clock max 24000
scoreboard objectives add showclock trigger 
scoreboard players set #init showclock 1