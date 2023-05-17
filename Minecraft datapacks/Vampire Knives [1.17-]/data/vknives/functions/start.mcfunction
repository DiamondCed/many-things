tellraw @a {"text":"Vampire Knives Pack loaded!","color":"red"}
#scoreboard objectives add dmg_vknives minecraft.custom:minecraft.damage_dealt
scoreboard objectives add knivesid dummy
scoreboard players set #nextid knivesid 1
scoreboard objectives add knifelife dummy
scoreboard players set #version knifelife 0
function vknives:versioncheck_15
function vknives:versioncheck_17