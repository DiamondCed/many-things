execute as @a[scores={CustomModelData=-2147483648..2147483647}] at @s unless entity @s[scores={CustomModelData=0}] run function cmodelizer:change
scoreboard players set @a CustomModelData 0
scoreboard players enable @a CustomModelData