# raycast until finding a block within reach (if not, nothing happens)
execute at @s run function destruction:raycast
execute if score @e[tag=des_raycast, tag=current,limit=1,sort=nearest] calc matches 1 run tag @s add des_triggered

# detect player direction (priority given to looking up or down, then Z, then X)
execute store result score #y calc run data get entity @s Rotation[1]
execute if score #y calc matches 45..90 run tag @s add DES_DOWN
execute if score #y calc matches -90..-45 run tag @s add DES_UP

execute store result score #xz calc run data get entity @s Rotation[0]
execute if score #xz calc matches -180..-135 run tag @s[tag=!DES_UP,tag=!DES_DOWN] add DES_NORTH
execute if score #xz calc matches -134..-46 run tag @s[tag=!DES_UP,tag=!DES_DOWN] add DES_EAST
execute if score #xz calc matches -45..45 run tag @s[tag=!DES_UP,tag=!DES_DOWN] add DES_SOUTH
execute if score #xz calc matches 46..134 run tag @s[tag=!DES_UP,tag=!DES_DOWN] add DES_WEST
execute if score #xz calc matches 135..180 run tag @s[tag=!DES_UP,tag=!DES_DOWN] add DES_NORTH

# make sure nothing drops (this is a voiding wand after all... it just doesn't have an undo button, which is inconvenient)
execute store result score #tiles calc run gamerule doTileDrops
gamerule doTileDrops false

# offset the centerpoint armor stand depending on which way the player is looking
execute if entity @s[tag=des_triggered,tag=DES_UP] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~2 ~
execute if entity @s[tag=des_triggered,tag=DES_DOWN] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~-2 ~
execute if entity @s[tag=des_triggered,tag=DES_NORTH] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~ ~-2
execute if entity @s[tag=des_triggered,tag=DES_SOUTH] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~ ~ ~2
execute if entity @s[tag=des_triggered,tag=DES_WEST] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~-2 ~ ~
execute if entity @s[tag=des_triggered,tag=DES_EAST] as @e[tag=des_raycast,tag=current,limit=1,sort=nearest] at @s run tp @s ~2 ~ ~

# destroy each block in the 5x5x5 individually using a loop (because who wants 125 lines of the same thing)
execute if entity @s[tag=des_triggered] as @e[tag=des_raycast,limit=1,sort=nearest] at @s run function destruction:destroy

# restore doTileDrops to what it was before # this line feels like a useless ternary but eh that's how it is
execute if score #tiles calc matches 1 run gamerule doTileDrops true

# kill the armor stand
kill @e[tag=current, tag=des_raycast, limit=1,sort=nearest]

# clean up tags
tag @s remove des_triggered
tag @s remove DES_UP
tag @s remove DES_DOWN
tag @s remove DES_NORTH
tag @s remove DES_SOUTH
tag @s remove DES_WEST
tag @s remove DES_EAST