execute unless entity @s[nbt={EnderItems:[{Slot:26b}]}] unless entity @s[nbt={EnderItems:[{Slot:25b}]}] unless entity @s[nbt={EnderItems:[{Slot:24b}]}] unless entity @s[nbt={EnderItems:[{Slot:23b}]}] unless entity @s[nbt={EnderItems:[{Slot:22b}]}] run tag @s add allowInventory

tag @s[tag=allowInventory,nbt={Inventory:[{Slot:17b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:16b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:15b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:14b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[tag=allowInventory,nbt={Inventory:[{Slot:13b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm

tag @s[nbt={EnderItems:[{Slot:26b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[nbt={EnderItems:[{Slot:25b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[nbt={EnderItems:[{Slot:24b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[nbt={EnderItems:[{Slot:23b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm
tag @s[nbt={EnderItems:[{Slot:22b,tag:{isPortalCharm:1b}}]}] add hasPortalCharm

tag @s remove allowInventory