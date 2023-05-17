tag @s add toTp
execute as @a[tag=hasGrapple] if score @s hookid = @e[tag=toTp,limit=1] hookid run tag @e[tag=toTp] add doTp

execute if entity @s[tag=toTp] positioned ~ ~ ~ run tp @a[tag=hasGrapple] ~ ~ ~
kill @s