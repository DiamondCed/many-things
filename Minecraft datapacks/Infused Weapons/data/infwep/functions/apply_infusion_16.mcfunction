#poison
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:poison"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Poison","italic":"false","color":"dark_green"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:poison"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:200,Id:19b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:poison"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#stronk poison
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Poison (Strong)","italic":"false","color":"dark_green"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:150,Id:19b,Amplifier:1b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#lonk poison
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Poison (Long)","italic":"false","color":"dark_green"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:400,Id:19b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_poison"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#weak
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Weakness","italic":"false","color":"gray"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:200,Id:18b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#lonk weak
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Weakness (Long)","italic":"false","color":"gray"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:400,Id:18b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_weakness"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#slow
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Slowness","italic":"false","color":"dark_aqua"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:200,Id:2b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#stronk slow
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Slowness (Strong)","italic":"false","color":"dark_aqua"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:150,Id:2b,Amplifier:3b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:strong_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#lonk slow
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Slowness (Long)","italic":"false","color":"dark_aqua"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:400,Id:2b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:long_slowness"}}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#glow
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:spectral_arrow"}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Glowing","italic":"false","color":"yellow"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:spectral_arrow"}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:200,Id:24b,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:spectral_arrow"}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#wither
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:wither_skeleton_skull"}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Wither","italic":"false","color":"dark_red"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:wither_skeleton_skull"}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:200,Id:20b,Amplifier:1b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:wither_skeleton_skull"}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#fire
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_powder"}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Fire","italic":"false","color":"gold"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_powder"}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:80,Id:-1,Amplifier:1b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_powder"}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#lonk fire
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_rod"}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Fire (Long)","italic":"false","color":"gold"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_rod"}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:160,Id:-1,Amplifier:1b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:blaze_rod"}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

#levitat
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:shulker_shell"}]} run data modify block ~ ~ ~ Items[4].tag.display.Lore append value '{"text":"Levitation","italic":"false","color":"light_purple"}'
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:shulker_shell"}]} run data modify block ~ ~ ~ Items[4].tag.InfusedEffect set value {Ambient:0b,ShowIcon:1b,ShowParticles:1b,Duration:150,Id:25,Amplifier:0b}
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,id:"minecraft:shulker_shell"}]} run data modify block ~ ~ ~ Items[4].tag.Infused set value 1b

replaceitem block ~ ~ ~ container.3 air