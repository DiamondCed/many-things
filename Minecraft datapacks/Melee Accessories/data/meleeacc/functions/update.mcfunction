tag @a remove hasFeralClaws
tag @a remove hasDebuffVenom
tag @a remove hasDebuffWither
tag @a remove hasDebuffSlow
tag @a remove hasDebuffWeak
tag @a remove hasDebuffLevitate
tag @a remove hasUpgradedClaws
execute as @a run function meleeacc:detect_items_normal
# normal as opposed to the restricted version with enderchest slots and whatnot

# feral claws functionality
execute as @a[tag=!hasFeralClaws] run attribute @s minecraft:generic.attack_speed modifier remove FE4A1-0-0-0-1
execute as @a[tag=hasFeralClaws] run attribute @s minecraft:generic.attack_speed modifier add FE4A1-0-0-0-1 feral_speed 0.2 add

execute as @a[tag=!hasUpgradedClaws] run attribute @s minecraft:generic.attack_speed modifier remove FE4A1-0-0-0-2
execute as @a[tag=hasUpgradedClaws] run attribute @s minecraft:generic.attack_speed modifier add FE4A1-0-0-0-2 upgraded_claw_speed 0.2 add

# allow enemy to be detected as hit again next frame
tag @e remove hitCooldown


# fuse items (claws + debuff = upgraded claws)
execute as @e[type=item,nbt={Item:{tag:{isFeralClaws:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isDebuffVenom:1b}}},nbt=!{Item:{tag:{isUpgradedClaws:1b}}}] run function meleeacc:fuse_venom

execute as @e[type=item,nbt={Item:{tag:{isFeralClaws:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isDebuffWither:1b}}},nbt=!{Item:{tag:{isUpgradedClaws:1b}}}] run function meleeacc:fuse_wither

execute as @e[type=item,nbt={Item:{tag:{isFeralClaws:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isDebuffSlow:1b}}},nbt=!{Item:{tag:{isUpgradedClaws:1b}}}] run function meleeacc:fuse_slow

execute as @e[type=item,nbt={Item:{tag:{isFeralClaws:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isDebuffWeak:1b}}},nbt=!{Item:{tag:{isUpgradedClaws:1b}}}] run function meleeacc:fuse_weak

execute as @e[type=item,nbt={Item:{tag:{isFeralClaws:1b}}}] at @s if block ~ ~-1 ~ #anvil if entity @e[type=item,nbt={Item:{tag:{isDebuffLevitate:1b}}},nbt=!{Item:{tag:{isUpgradedClaws:1b}}}] run function meleeacc:fuse_levitate

