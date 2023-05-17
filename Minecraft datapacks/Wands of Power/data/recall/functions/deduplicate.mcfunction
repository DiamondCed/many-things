# copy the comparison value over to temp
data modify storage rc deDuplicateTemp set from storage rc deDuplicateCompare
# try to override temp with the dimension value, and store the success
execute store success score #dedup calc run data modify storage rc deDuplicateTemp set from storage rc deDuplicateL1[0].Dimension
# if the operation was successful, the dimension values didn't match, so the value is copied over into the new list
execute if score #dedup calc matches 1 run data modify storage rc deDuplicateL2 append from storage rc deDuplicateL1[0]
# whether or not it was copied over, the value is now removed from the first list, deleting any entries that were duplicates of the comparison
data remove storage rc deDuplicateL1[0]

# keep running the function (loop) until the original list is empty
execute if data storage rc deDuplicateL1[0] run function recall:deduplicate