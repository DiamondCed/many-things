#tellraw @a {"text":"Magic Mirror Pack loaded!","color":"aqua"}
scoreboard objectives add tempmirror dummy
scoreboard objectives add usedmirror minecraft.used:minecraft.carrot_on_a_stick
scoreboard players set @a usedmirror 0
scoreboard players set #existstest tempmirror 0
scoreboard players set #posx tempmirror 0
scoreboard players set #posy tempmirror 0
scoreboard players set #posz tempmirror 0