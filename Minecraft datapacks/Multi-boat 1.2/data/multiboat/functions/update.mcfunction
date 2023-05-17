execute as @e[tag=base] at @s run tp @e[tag=back,distance=..20] ^ ^ ^-2.5 ~ ~
execute as @e[tag=base] at @s run tp @e[tag=left,distance=..20] ^1.7 ^ ^-1.5 ~ ~
execute as @e[tag=base] at @s run tp @e[tag=right,distance=..20] ^-1.7 ^ ^-1.5 ~ ~
execute as @e[type=boat,nbt={Type:"oak"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summonoak
execute as @e[type=boat,nbt={Type:"birch"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summonbirch
execute as @e[type=boat,nbt={Type:"spruce"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summonspruce
execute as @e[type=boat,nbt={Type:"jungle"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summonjungle
execute as @e[type=boat,nbt={Type:"dark_oak"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summondarkoak
execute as @e[type=boat,nbt={Type:"acacia"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:iron_ingot"}}] run function multiboat:summonacacia

execute as @e[type=boat,nbt={Type:"oak"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summonoak4
execute as @e[type=boat,nbt={Type:"birch"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summonbirch4
execute as @e[type=boat,nbt={Type:"spruce"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summonspruce4
execute as @e[type=boat,nbt={Type:"jungle"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summonjungle4
execute as @e[type=boat,nbt={Type:"dark_oak"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summondarkoak4
execute as @e[type=boat,nbt={Type:"acacia"},tag=!back,tag=!left,tag=!right] at @s if entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:gold_ingot"}}] run function multiboat:summonacacia4

execute as @e[type=boat,tag=!hasChest,tag=!hasHopper] at @s if entity @e[type=chest_minecart,distance=..2,tag=!inBoat] run function multiboat:chestboat

execute as @e[type=boat,tag=hasChest] at @s unless entity @e[type=chest_minecart,distance=..1,tag=inBoat] run tag @s remove hasChest

execute as @e[type=boat,tag=!hasChest,tag=!hasHopper] at @s if entity @e[type=hopper_minecart,distance=..2,tag=!inBoat] run function multiboat:hopperboat

execute as @e[type=boat,tag=hasHopper] at @s unless entity @e[type=hopper_minecart,distance=..1,tag=inBoat] run tag @s remove hasHopper