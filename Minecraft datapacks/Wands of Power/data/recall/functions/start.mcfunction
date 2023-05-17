scoreboard objectives add used_rc minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add sneak_rc minecraft.custom:minecraft.sneak_time
scoreboard objectives add calc dummy
scoreboard objectives add buildup_rc dummy
scoreboard objectives add cooldown_rc dummy
scoreboard objectives add recall_id dummy
execute unless score #next_id recall_id matches 1.. run scoreboard players set #next_id recall_id 1

# cooldown constant (40t = 2s)
scoreboard players set #cooldown cooldown_rc 40

# buildup constant (30t = 1.5s)
scoreboard players set #buildup buildup_rc 30

# postbuildup constant (buildup+5)
scoreboard players operation #postbuildup buildup_rc = #buildup buildup_rc
scoreboard players add #postbuildup buildup_rc 5