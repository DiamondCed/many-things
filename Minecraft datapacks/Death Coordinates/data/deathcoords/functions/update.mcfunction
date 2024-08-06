# manage privacy setting (/trigger adds 1, so yea)
scoreboard players set @a[scores={private_coordinates=2..}] private_coordinates 0
scoreboard players enable @a private_coordinates

# manage player death
execute as @a[scores={diedDeathCoord=1..}] run function deathcoords:show_position
