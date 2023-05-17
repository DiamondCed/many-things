#setblock ^ ^ ^-1 structure_block{ignoreEntities:0b,powered:0b,author:"DiamondCed",rotation:"NONE",mode:"LOAD",integrity:1.0f,name:"mj_diamondced:mobdrop_replicator",posX:-1,posZ:-1}
#setblock ^ ^1 ^-1 redstone_block
tag @s add Replicator
execute if entity @s[nbt={Facing:5b}] run summon glow_item_frame ^-1 ^ ^-1 {Facing:3b,Tags:[ReplicatorDisplay]}
execute if entity @s[nbt={Facing:3b}] run summon glow_item_frame ^-1 ^ ^-1 {Facing:4b,Tags:[ReplicatorDisplay]}
execute if entity @s[nbt={Facing:4b}] run summon glow_item_frame ^-1 ^ ^-1 {Facing:2b,Tags:[ReplicatorDisplay]}
execute if entity @s[nbt={Facing:2b}] run summon glow_item_frame ^-1 ^ ^-1 {Facing:5b,Tags:[ReplicatorDisplay]}

function mj_diamondced:creation_effects