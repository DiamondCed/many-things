#fill cauldron with water bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:water_bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ cauldron run function dispenseplus:use_17/fill

#empty cauldron with bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=3] run function dispenseplus:use_17/empty


#fill cauldron with lava bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:lava_bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ cauldron run function dispenseplus:use_17/fill_lava

#empty cauldron from lava with bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ lava_cauldron run function dispenseplus:use_17/empty_lava


#fill cauldron with powder snow
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:powder_snow_bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ cauldron run function dispenseplus:use_17/fill_snow

#empty cauldron from powder snow with bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bucket"}}] at @s unless data entity @s Thrower if block ~ ~ ~ powder_snow_cauldron[level=3] run function dispenseplus:use_17/empty_snow





#milk cow/mooshroom with bucket
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bucket"}}] at @s unless data entity @s Thrower if entity @e[type=cow,dx=0,dy=0,dz=0] run function dispenseplus:use_17/fill_milk
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bucket"}}] at @s unless data entity @s Thrower if entity @e[type=mooshroom,dx=0,dy=0,dz=0] run function dispenseplus:use_17/fill_milk

#milk mushroom/suspicious stews from mooshroom
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bowl"}}] at @s unless data entity @s Thrower if entity @e[type=mooshroom,dx=0,dy=0,dz=0] unless data entity @e[type=mooshroom,limit=1,dx=0,dy=0,dz=0] EffectId run function dispenseplus:use_17/fill_stew
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:bowl"}}] at @s unless data entity @s Thrower if entity @e[type=mooshroom,dx=0,dy=0,dz=0] if data entity @e[type=mooshroom,limit=1,dx=0,dy=0,dz=0] EffectId run function dispenseplus:use_17/fill_stew_sus

#place chorus flower
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:chorus_flower"}}] at @s unless data entity @s Thrower if block ~ ~ ~ air if block ~ ~-1 ~ end_stone run function dispenseplus:use_17/place_chorus

#place sponge
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:sponge"}}] at @s unless data entity @s Thrower if block ~ ~ ~ air run function dispenseplus:use_17/place_sponge

#fill cauldron with water bottle
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=2] run function dispenseplus:use_17/fill_bottle_2
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=1] run function dispenseplus:use_17/fill_bottle_1
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}] at @s unless data entity @s Thrower if block ~ ~ ~ cauldron run function dispenseplus:use_17/fill_bottle_0

#empty cauldron with glass bottles
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:glass_bottle"}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=1] run function dispenseplus:use_17/empty_bottle_0
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:glass_bottle"}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=2] run function dispenseplus:use_17/empty_bottle_1
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:glass_bottle"}}] at @s unless data entity @s Thrower if block ~ ~ ~ water_cauldron[level=3] run function dispenseplus:use_17/empty_bottle_2

#nametag entity
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:name_tag"}}] at @s unless data entity @s Thrower if entity @e[type=!#dispenseplus:no_nametag,dx=0,dy=0,dz=0] if data entity @s Item.tag.display.Name run function dispenseplus:use_17/apply_nametag

#throw trident
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:trident"}}] at @s unless data entity @s Thrower run function dispenseplus:use_17/throw_trident

#put book on lectern
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:written_book"}}] at @s unless data entity @s Thrower if block ~ ~ ~ lectern[has_book=false] run function dispenseplus:use_17/place_book
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:written_book"}}] at @s unless data entity @s Thrower if block ~ ~ ~ lectern[has_book=true] run function dispenseplus:use_17/replace_book
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:writable_book"}}] at @s unless data entity @s Thrower if block ~ ~ ~ lectern[has_book=false] run function dispenseplus:use_17/place_book
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:writable_book"}}] at @s unless data entity @s Thrower if block ~ ~ ~ lectern[has_book=true] run function dispenseplus:use_17/replace_book

#place end crystal
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:end_crystal"}}] at @s unless data entity @s Thrower if block ~ ~ ~ obsidian if block ~ ~1 ~ air if block ~ ~2 ~ air run function dispenseplus:use_17/place_end_crystal1
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:end_crystal"}}] at @s unless data entity @s Thrower if block ~ ~ ~ bedrock if block ~ ~1 ~ air if block ~ ~2 ~ air run function dispenseplus:use_17/place_end_crystal1
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:end_crystal"}}] at @s unless data entity @s Thrower if block ~ ~-1 ~ obsidian if block ~ ~ ~ air if block ~ ~1 ~ air run function dispenseplus:use_17/place_end_crystal2
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:end_crystal"}}] at @s unless data entity @s Thrower if block ~ ~-1 ~ bedrock if block ~ ~ ~ air if block ~ ~1 ~ air run function dispenseplus:use_17/place_end_crystal2

#place banner
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:white_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/white
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:light_gray_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/light_gray
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:gray_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/gray
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:black_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/black
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:red_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/red
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:orange_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/orange
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:yellow_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/yellow
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:lime_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/lime
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:green_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/green
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:cyan_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/cyan
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:light_blue_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/light_blue
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:blue_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/blue
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:purple_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/purple
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:magenta_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/magenta
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:pink_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/pink
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:brown_banner"}}] at @s unless data entity @s Thrower if block ~ ~ ~ #dispenseplus:banner_replace run function dispenseplus:use_17/banner/brown

#place scaffolding
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:scaffolding"}}] at @s unless data entity @s Thrower if block ~ ~ ~ air run function dispenseplus:use_17/place_scaffolding
execute as @e[tag=!processed,type=item,nbt={Age:1s,Item:{id:"minecraft:scaffolding"}}] at @s unless data entity @s Thrower if block ~ ~ ~ scaffolding run function dispenseplus:use_17/place_scaffolding

#repair fireball-in-block-ignition feature
execute as @e[tag=!processed,type=small_fireball] at @s unless data entity @s Owner if block ~ ~ ~ #dispenseplus:blocks run function dispenseplus:use_17/set_on_fire

tag @e remove processed