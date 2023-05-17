execute if entity @e[tag=boxmarker] in the_nether run tag @s add boxexists
execute unless entity @s[tag=boxexists] in the_nether run function dimbox:makefirstbox
execute if entity @s[tag=boxexists] in the_nether run function dimbox:newbox
tag @a remove boxexists