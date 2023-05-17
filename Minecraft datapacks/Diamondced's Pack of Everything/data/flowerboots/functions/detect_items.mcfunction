execute unless entity @s[nbt={EnderItems:[{Slot:26b}]}] unless entity @s[nbt={EnderItems:[{Slot:25b}]}] unless entity @s[nbt={EnderItems:[{Slot:24b}]}] unless entity @s[nbt={EnderItems:[{Slot:23b}]}] unless entity @s[nbt={EnderItems:[{Slot:22b}]}] run tag @s add allowInventory

tag @s[tag=allowInventory,nbt={Inventory:[{Slot:17b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:16b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:15b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:14b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:13b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots

tag @s[nbt={EnderItems:[{Slot:26b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[nbt={EnderItems:[{Slot:25b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[nbt={EnderItems:[{Slot:24b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[nbt={EnderItems:[{Slot:23b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots
tag @s[nbt={EnderItems:[{Slot:22b,tag:{isFlowerBoots:1b}}]}] add hasFlowerBoots

tag @s remove allowInventory