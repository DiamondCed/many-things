# clear values
scoreboard players set mapRed colorCalc 0
scoreboard players set mapGreen colorCalc 0
scoreboard players set mapBlue colorCalc 0

# turn previous map color data into usable numbers
execute store result score mapTemp colorCalc run data get entity @s Item.tag.display.MapColor

scoreboard players operation mapRed colorCalc = mapTemp colorCalc
scoreboard players operation mapGreen colorCalc = mapTemp colorCalc
scoreboard players operation mapBlue colorCalc = mapTemp colorCalc

scoreboard players operation mapRed colorCalc /= $256 colorCalc
scoreboard players operation mapRed colorCalc /= $256 colorCalc
scoreboard players operation mapGreen colorCalc /= $256 colorCalc

scoreboard players operation mapRed colorCalc %= $256 colorCalc
scoreboard players operation mapGreen colorCalc %= $256 colorCalc
scoreboard players operation mapBlue colorCalc %= $256 colorCalc

# add map values to rgb totals
scoreboard players operation totalRed colorCalc = mapRed colorCalc
scoreboard players operation totalGreen colorCalc = mapGreen colorCalc
scoreboard players operation totalBlue colorCalc = mapBlue colorCalc

# add max of map colors to max total
scoreboard players operation totalMax colorCalc = mapRed colorCalc
execute if score mapGreen colorCalc > mapRed colorCalc run scoreboard players operation totalMax colorCalc = mapGreen colorCalc
execute if score mapBlue colorCalc > mapGreen colorCalc if score mapBlue colorCalc > mapRed colorCalc run scoreboard players operation totalMax colorCalc = mapBlue colorCalc

# add dye values to rgb totals
scoreboard players operation totalRed colorCalc += dyeRed colorCalc
scoreboard players operation totalGreen colorCalc += dyeGreen colorCalc
scoreboard players operation totalBlue colorCalc += dyeBlue colorCalc

# add max dye value to max total
scoreboard players operation temp colorCalc = dyeRed colorCalc
execute if score dyeGreen colorCalc > dyeRed colorCalc run scoreboard players operation temp colorCalc = dyeGreen colorCalc
execute if score dyeBlue colorCalc > dyeGreen colorCalc if score dyeBlue colorCalc > dyeRed colorCalc run scoreboard players operation temp colorCalc = dyeBlue colorCalc
scoreboard players operation totalMax colorCalc += temp colorCalc

#divide all totals by 2 if map had a previous color
execute if data entity @s Item.tag.display.MapColor run scoreboard players operation totalRed colorCalc /= $2 colorCalc
execute if data entity @s Item.tag.display.MapColor run scoreboard players operation totalGreen colorCalc /= $2 colorCalc
execute if data entity @s Item.tag.display.MapColor run scoreboard players operation totalBlue colorCalc /= $2 colorCalc
execute if data entity @s Item.tag.display.MapColor run scoreboard players operation totalMax colorCalc /= $2 colorCalc

#find max of averages
scoreboard players operation temp colorCalc = totalRed colorCalc
execute if score totalGreen colorCalc > totalRed colorCalc run scoreboard players operation temp colorCalc = totalGreen colorCalc
execute if score totalBlue colorCalc > totalGreen colorCalc if score totalBlue colorCalc > totalRed colorCalc run scoreboard players operation temp colorCalc = totalBlue colorCalc
scoreboard players operation maxOfAvg colorCalc = temp colorCalc

#get final colors
scoreboard players operation totalRed colorCalc *= totalMax colorCalc
scoreboard players operation totalRed colorCalc /= maxOfAvg colorCalc
scoreboard players operation totalGreen colorCalc *= totalMax colorCalc
scoreboard players operation totalGreen colorCalc /= maxOfAvg colorCalc
scoreboard players operation totalBlue colorCalc *= totalMax colorCalc
scoreboard players operation totalBlue colorCalc /= maxOfAvg colorCalc

#get int color value
scoreboard players operation finalColor colorCalc = totalRed colorCalc
scoreboard players operation finalColor colorCalc *= $256 colorCalc
scoreboard players operation finalColor colorCalc += totalGreen colorCalc
scoreboard players operation finalColor colorCalc *= $256 colorCalc
scoreboard players operation finalColor colorCalc += totalBlue colorCalc

execute store result entity @s Item.tag.display.MapColor int 1 run scoreboard players get finalColor colorCalc