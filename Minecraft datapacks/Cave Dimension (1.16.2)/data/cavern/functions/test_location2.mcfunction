execute if block ~ ~-1 ~ polished_blackstone_brick_slab[type=bottom,waterlogged=true] if block ~ ~2 ~ polished_blackstone_brick_slab[type=top,waterlogged=true] if block ~1 ~-1 ~ polished_blackstone_brick_stairs[facing=west,half=bottom,shape=straight] if block ~-1 ~-1 ~ polished_blackstone_brick_stairs[facing=east,half=bottom,shape=straight] if block ~ ~-1 ~1 polished_blackstone_brick_stairs[facing=north,half=bottom,shape=straight] if block ~ ~-1 ~-1 polished_blackstone_brick_stairs[facing=south,half=bottom,shape=straight] if block ~1 ~2 ~ polished_blackstone_brick_stairs[facing=west,half=top,shape=straight] if block ~-1 ~2 ~ polished_blackstone_brick_stairs[facing=east,half=top,shape=straight] if block ~ ~2 ~1 polished_blackstone_brick_stairs[facing=north,half=top,shape=straight] if block ~ ~2 ~-1 polished_blackstone_brick_stairs[facing=south,half=top,shape=straight] run function cavern:activate_portal2