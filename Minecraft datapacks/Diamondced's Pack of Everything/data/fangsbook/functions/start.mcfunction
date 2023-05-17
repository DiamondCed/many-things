#tellraw @a {"text":"Book of Fangs Pack loaded!","color":"gold"}
scoreboard objectives add cast1 trigger
scoreboard objectives add cast2 trigger
scoreboard objectives add sneaking_fangs minecraft.custom:minecraft.sneak_time
scoreboard players set @a sneaking_fangs 0
scoreboard objectives add used_fangs minecraft.used:minecraft.carrot_on_a_stick
scoreboard players set @a used_fangs 0
scoreboard objectives add fangs_cooldown dummy
scoreboard players set @a fangs_cooldown 0

scoreboard players set #version cast1 0
function fangsbook:versioncheck