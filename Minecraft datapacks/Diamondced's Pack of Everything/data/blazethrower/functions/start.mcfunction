#tellraw @a {"text":"Blazethrower Pack loaded!","color":"gold"}
scoreboard objectives add used_blaze minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add blaze_cooldown dummy
scoreboard players set @a blaze_cooldown 0
scoreboard objectives add flying_fb minecraft.custom:minecraft.aviate_one_cm