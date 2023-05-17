scoreboard players operation #temp RNG_ghast = $RNG RNG_ghast
scoreboard players operation $RNG RNG_ghast *= $RNG RNG_ghast
scoreboard players operation $RNG RNG_ghast /= #100 RNG_ghast
scoreboard players operation #temp RNG_ghast /= #1000 RNG_ghast
scoreboard players operation $RNG RNG_ghast %= #10000 RNG_ghast
scoreboard players operation $RNG RNG_ghast += #deloop RNG_ghast
scoreboard players operation $RNG RNG_ghast %= #10000 RNG_ghast

execute if score $RNG RNG_ghast matches 1 run scoreboard players set $RNG RNG_ghast 4314

#f(x)=((f(x-1)^2)/100)%10000
#f(1)=4314