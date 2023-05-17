tellraw @a {"text":"Infused Weapons Datapack loaded!","color":"light_purple"}
scoreboard objectives add hitdt1 minecraft.custom:minecraft.damage_dealt
scoreboard objectives add hitdt2 minecraft.custom:minecraft.damage_dealt_absorbed
scoreboard objectives add hitdt3 minecraft.custom:minecraft.damage_dealt_resisted
scoreboard players set @a hitdt1 0
scoreboard players set @a hitdt2 0
scoreboard players set @a hitdt3 0

scoreboard objectives add arrowlife dummy
function infwep:slow_update