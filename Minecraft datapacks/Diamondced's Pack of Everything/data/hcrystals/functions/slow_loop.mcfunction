execute as @a[scores={usedhearts=1}] unless entity @s[nbt={ActiveEffects:[{Id:21b}]}] run effect give @s health_boost 1000000 0 true

execute as @a[scores={usedhearts=2}] unless entity @s[nbt={ActiveEffects:[{Id:21b}]}] run effect give @s health_boost 1000000 1 true

execute as @a[scores={usedhearts=3}] unless entity @s[nbt={ActiveEffects:[{Id:21b}]}] run effect give @s health_boost 1000000 2 true

execute as @a[scores={usedhearts=4}] unless entity @s[nbt={ActiveEffects:[{Id:21b}]}] run effect give @s health_boost 1000000 3 true

execute as @a[scores={usedhearts=5}] unless entity @s[nbt={ActiveEffects:[{Id:21b}]}] run effect give @s health_boost 1000000 4 true
schedule function hcrystals:slow_loop 600