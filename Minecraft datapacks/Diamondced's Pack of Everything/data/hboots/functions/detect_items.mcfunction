execute unless entity @s[nbt={EnderItems:[{Slot:26b}]}] unless entity @s[nbt={EnderItems:[{Slot:25b}]}] unless entity @s[nbt={EnderItems:[{Slot:24b}]}] unless entity @s[nbt={EnderItems:[{Slot:23b}]}] unless entity @s[nbt={EnderItems:[{Slot:22b}]}] run tag @s add allowInventory

tag @s[tag=allowInventory,nbt={Inventory:[{Slot:17b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:16b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:15b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:14b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:13b,tag:{isBoots:1b}}]}] add hasBoots

tag @s[nbt={EnderItems:[{Slot:26b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[nbt={EnderItems:[{Slot:25b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[nbt={EnderItems:[{Slot:24b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[nbt={EnderItems:[{Slot:23b,tag:{isBoots:1b}}]}] add hasBoots
tag @s[nbt={EnderItems:[{Slot:22b,tag:{isBoots:1b}}]}] add hasBoots

tag @s remove allowInventory