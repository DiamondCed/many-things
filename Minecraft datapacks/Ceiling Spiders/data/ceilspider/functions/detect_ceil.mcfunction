scoreboard players set @s calc 0

execute as @s[type=spider] at @s if block ~-0.35 ~0.95 ~-0.35 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=spider] at @s if block ~-0.35 ~0.95 ~0.35 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=spider] at @s if block ~0.35 ~0.95 ~-0.35 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=spider] at @s if block ~0.35 ~0.95 ~0.35 #ceilspider:nohitbox run scoreboard players add @s calc 1

execute as @s[type=cave_spider] at @s if block ~-0.175 ~0.55 ~-0.175 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=cave_spider] at @s if block ~-0.175 ~0.55 ~0.175 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=cave_spider] at @s if block ~0.175 ~0.55 ~-0.175 #ceilspider:nohitbox run scoreboard players add @s calc 1
execute as @s[type=cave_spider] at @s if block ~0.175 ~0.55 ~0.175 #ceilspider:nohitbox run scoreboard players add @s calc 1

execute if score @s calc matches 2.. run tag @s add drop