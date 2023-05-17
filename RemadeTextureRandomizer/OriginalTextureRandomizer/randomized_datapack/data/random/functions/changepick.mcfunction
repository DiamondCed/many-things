summon item ~ ~ ~ {Tags:["change"],Item:{id:"minecraft:egg",Count:1b}}
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item set from entity @s SelectedItem
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.tags append value {modified:1}
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.AttributeModifiers append value {UUIDLeast:1,Operation:0,UUIDMost:56861,Slot:mainhand,AttributeName:generic.attackDamage,Amount:5}
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.AttributeModifiers append value {UUIDLeast:1,Operation:0,UUIDMost:18946,Slot:mainhand,AttributeName:generic.attackSpeed,Amount:1.0}
replaceitem entity @s weapon.mainhand air
