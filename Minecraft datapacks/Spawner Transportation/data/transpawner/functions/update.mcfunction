execute as @e[type=minecart,tag=!justdropped] at @s unless data entity @s Passengers if block ~ ~ ~ spawner run function transpawner:to_spawncart
execute as @e[type=spawner_minecart] at @s if block ~ ~ ~ activator_rail[powered=true] run function transpawner:from_spawncart

execute as @e[tag=justdropped] at @s unless block ~ ~ ~ spawner run tag @s remove justdropped


execute as @e[tag=transpawner_marker] at @s run function transpawner:test_marker_cart
kill @e[tag=transpawner_marker]
execute as @e[type=spawner_minecart] at @s run function transpawner:create_marker