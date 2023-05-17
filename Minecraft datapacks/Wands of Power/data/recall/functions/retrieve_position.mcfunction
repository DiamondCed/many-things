# copy compared value over
data modify storage rc tempTemp set from storage rc tempDim
# attempt to override the compared value with the current value
execute store success score #matches calc run data modify storage rc tempTemp set from storage rc temp[0].Dimension
# if the value matches (so success is 0, not 1 you dumbass), copy the params to an output value
execute if score #matches calc matches 0 run data modify storage rc tpParams set from storage rc temp[0]
# delete the first (current) element in the list since we already copied the important stuff over
data remove storage rc temp[0]

# continue looping through if we haven't found an answer (so matches is 1 not 0 you further dumbass) and the list is not empty
execute if data storage rc temp[0] if score #matches calc matches 1.. run function recall:retrieve_position

