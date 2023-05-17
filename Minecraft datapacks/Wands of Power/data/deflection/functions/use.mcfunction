tag @e[type=#deflection:deflected_projectiles,distance=..5] add defAffected
tag @e[tag=defAffected,nbt={inGround:1b}] remove defAffected
tag @s add user

# deselect any projectiles owned by the user (because repelling them is unintended)
execute as @e[tag=defAffected] run function deflection:detect_user_owned

# execute the code as individual affected entities
execute as @e[tag=defAffected] run function deflection:use_individual

tag @e remove defAffected
tag @s remove user