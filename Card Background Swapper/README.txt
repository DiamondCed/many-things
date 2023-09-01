Note: These scripts require PIL/pillow to be installed, so you may need to run a quick "pip install pillow"

What is this?
This is just a quick tool to replace the background on cards. It will remove whatever is indicated in the template files and composite in the wanted images instead. If the image is shorter than the card, it will be mirrored vertically. 

To use: 
- create a folder (like the example DECK 1 here)
- within, place folders named "Cards" and "Images"
- put your base cards and images in the respective folders. Names do not matter, just make sure they show up in the same alphanumerical order
- copy/move the script "image-card-fusion.py" into the parent folder (eg. DECK 1), and run it

Changing templates:
If you have a different card type in mind (the default ones are for MtG I believe), you can try looking at the .psd file for some insight into creating the templates. Unfortunately, you will need two templates for the script to run (unless you tweak it), but you can just make it two copies of the same template.

** The templates have to be the same size as the cards, otherwise I expect PIL to throw an error **

What is this other "batch-resize" script?
If you made a batch of cards that don't match the size of your template, fret not! This can remedy the situation.
- Rename an image of the correct size (for instance, your template) to reference.png (or .jpg)
- then place your erroneously sized images in a folder called "Input"
- place both the ref and the folder next to the script
- run the script, and your images are scaled and placed in a new Output folder.