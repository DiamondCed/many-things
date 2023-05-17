
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:water"}}]} run data remove block ~ ~ ~ Items[4].tag.display.Lore
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:water"}}]} run data remove block ~ ~ ~ Items[4].tag.InfusedEffect
execute if block ~ ~ ~ dropper{Items:[{Slot:3b,tag:{Potion:"minecraft:water"}}]} run data remove block ~ ~ ~ Items[4].tag.Infused 
replaceitem block ~ ~ ~ container.3 air