summon item ~ ~ ~ {Tags:["change"],Item:{id:"minecraft:egg",Count:1b}}
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item set from entity @s SelectedItem
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.tags append value {modified:1}
data modify entity @e[type=item,distance=..2,limit=1,tag=change] Item.tag.AttributeModifiers append value {UUIDLeast:1,Operation:0,UUIDMost:34099,Slot:feet,AttributeName:generic.armor,Amount:2}
replaceitem entity @s weapon.mainhand air
