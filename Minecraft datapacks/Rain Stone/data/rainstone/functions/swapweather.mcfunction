execute if predicate rainstone:israining run tag @s add yes
execute if entity @s[tag=yes] run weather clear 6300
execute unless entity @s[tag=yes] run weather rain 900
tag @s remove yes