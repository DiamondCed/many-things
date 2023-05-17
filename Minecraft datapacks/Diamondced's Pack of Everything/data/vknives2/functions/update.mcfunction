# run the update cycle shot vknives code (because otherwise it's too early)
execute as @a[tag=shotVknives] at @s run function vknives2:update_shot_vknives

# age projectiles
scoreboard players add @e[type=arrow,tag=vknife2] knifelife 1

# kill old/landed projectiles
kill @e[type=arrow,nbt={inGround:1b},tag=vknife2]
kill @e[type=arrow,scores={knifelife=2..},tag=vknife2]