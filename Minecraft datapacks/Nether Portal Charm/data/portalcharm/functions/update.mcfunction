execute as @a[tag=turnbackPortalSu] run gamemode survival 
tag @a remove turnbackPortalSu
execute as @a[tag=turnbackPortalAd] run gamemode adventure 
tag @a remove turnbackPortalAd

tag @a remove hasPortalCharm
tag @a[nbt={Inventory:[{tag:{isPortalCharm:1b}}]}] add hasPortalCharm

execute as @e[gamemode=survival,tag=hasPortalCharm,nbt={PortalCooldown:0}] at @s if block ~ ~ ~ nether_portal run function portalcharm:cross_su
execute as @e[gamemode=adventure,tag=hasPortalCharm,nbt={PortalCooldown:0}] at @s if block ~ ~ ~ nether_portal run function portalcharm:cross_ad