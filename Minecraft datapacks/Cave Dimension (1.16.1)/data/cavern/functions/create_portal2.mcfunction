setblock ~ ~ ~ air
fill ~-2 ~-1 ~-2 ~2 ~2 ~2 air replace
setblock ~ ~-1 ~ polished_blackstone_brick_slab[type=bottom,waterlogged=true]
setblock ~ ~2 ~ polished_blackstone_brick_slab[type=top,waterlogged=true]
setblock ~1 ~-1 ~ polished_blackstone_brick_stairs[half=bottom,shape=straight,facing=west]
setblock ~-1 ~-1 ~ polished_blackstone_brick_stairs[half=bottom,shape=straight,facing=east]
setblock ~ ~-1 ~1 polished_blackstone_brick_stairs[half=bottom,shape=straight,facing=north]
setblock ~ ~-1 ~-1 polished_blackstone_brick_stairs[half=bottom,shape=straight,facing=south]
setblock ~1 ~2 ~ polished_blackstone_brick_stairs[half=top,shape=straight,facing=west]
setblock ~-1 ~2 ~ polished_blackstone_brick_stairs[half=top,shape=straight,facing=east]
setblock ~ ~2 ~1 polished_blackstone_brick_stairs[half=top,shape=straight,facing=north]
setblock ~ ~2 ~-1 polished_blackstone_brick_stairs[half=top,shape=straight,facing=south]

summon armor_stand ~ ~ ~ {Tags:["cavern_portal2"],NoGravity:1b,Marker:1b,Invisible:1b}
summon armor_stand ~ ~-2.3 ~ {Tags:["cavern_portal_deco2"],NoGravity:1b,Marker:1b,Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:sea_lantern",Count:1b}],Rotation:[45.0f,0.0f]}