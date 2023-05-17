tag @a[nbt={SelectedItem:{tag:{bundleOfHolding:1b}}}] add hasBoHMainhand
tag @a[nbt={Inventory:[{Slot:-106b,tag:{bundleOfHolding:1b}}]}] add hasBoHOffhand
tag @a[tag=!hadBoHOffhand,nbt={Inventory:[{Slot:-106b,tag:{bundleOfHolding:1b}}]}] add hasBoHOffhand_start

#hide all items when first entering mainhand
#execute as @a[tag=hasBoHMainhand,tag=!hasBoHMainhand] at @s run function bundleofholding:hide_all

#hide items in deep storage when added in mainhand
execute as @a[tag=hasBoHMainhand] if data entity @s SelectedItem.tag.Items[0] at @s run function bundleofholding:input

#show item from deep storage when empty in offhand, for survival mode use
execute as @a[tag=hasBoHOffhand,gamemode=survival] unless data entity @s Inventory[-1].tag.Items[0] at @s run function bundleofholding:output

#show items from deep storage when in offhand, for creative mode only
execute as @a[tag=hasBoHOffhand_start,gamemode=creative] unless data entity @s Inventory[-1].tag.Items[0] at @s run function bundleofholding:show_all

#add bundle of holding as last trade of wandering trader 1/10 of the time
execute as @e[type=wandering_trader,tag=!attempt_boh] at @s run function bundleofholding:swap_trade

#clean up tags
tag @a remove hasBoHMainhand
tag @a remove hasBoHOffhand
tag @a remove hasBoHOffhand_start


tag @a remove hadBoHMainhand
tag @a[nbt={SelectedItem:{tag:{bundleOfHolding:1b}}}] add hadBoHMainhand

tag @a remove hadBoHOffhand
tag @a[nbt={Inventory:[{Slot:-106b,tag:{bundleOfHolding:1b}}]}] add hadBoHOffhand

