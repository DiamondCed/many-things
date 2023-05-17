tag @s add playhook
execute as @a[tag=hasGrapple] at @s if score @s hookid = @e[tag=playhook,limit=1] hookid run playsound minecraft:entity.arrow.hit master @s ~ ~ ~ 1 1.8
tag @e remove playhook
tag @s add playedSound

#playsound minecraft:block.note_block.bit master @a[tag=hasGrapple] ~ ~ ~