effect clear @a[tag=remLev] levitation
tag @a[tag=remLev] remove remLev

execute as @a[nbt={FallFlying:1b},scores={stElySneak=1..}] run effect give @s levitation 1 0 true
execute as @a[nbt={FallFlying:1b},scores={stElySneak=1..}] run tag @s add remLev

scoreboard players set @a stElySneak 0