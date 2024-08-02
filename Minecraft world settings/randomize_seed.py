import json
import argparse
from random import randint

parser = argparse.ArgumentParser()
parser.add_argument("file")

args = parser.parse_args()
file = args.file

# https://stackoverflow.com/questions/57755392/how-to-recursively-iterate-complex-python-object
def replace_seeds(data, seed):
    if not (isinstance(data, dict) or isinstance(data, list)):
        return
    for key, item in data.items():
        if key=="seed": # seed will always be int
            data[key] = seed
        elif isinstance(item, dict):
            replace_seeds(item, seed)
        elif isinstance(item, list):
            for d in item:
                replace_seeds(d, seed)
    return

data = json.loads(open(file).read())

seed = randint(-2**31, 2**31-1)

replace_seeds(data,seed)

newfile = file.rsplit(".")[0]+"_reseeded."+file.rsplit(".")[1]

open(newfile,"w").write(json.dumps(data))

