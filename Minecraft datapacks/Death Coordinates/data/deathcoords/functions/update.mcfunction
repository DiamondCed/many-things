# manage privacy setting
execute as @a[scores={private_coordinates=1..}] run function deathcoords:update_privacy
scoreboard players enable @a private_coordinates

# manage player death
execute as @a[scores={diedDeathCoord=1..}] run function deathcoords:show_position
