from fpdf import FPDF
import os
import csv
import sys
import random
from math import floor

os.chdir(__file__.rsplit("\\",1)[0] if len(__file__.rsplit("\\",1))>1 else os.getcwd())

# Thanks to chatgpt for generating this btw

# Constants for the PDF page size
PAGE_WIDTH = 279.4  # in mm (letter size)
PAGE_HEIGHT = 215.9  # in mm (letter size)
CARD_WIDTH = 89  # in mm (was 88.9)
CARD_HEIGHT = 64  # in mm (was 63.5)
BORDER_SIZE = 5  # in mm (minimum 2 cm) (was min. 2 cm)
EXTRA_BORDER_LEFT = -1  # realign two-sided cards better
MARGIN = CARD_HEIGHT/20
LINE_SIZE_OUTER = 1 # in mm
LINE_SIZE_INNER = 0.2 # in mm # default value

COLORS = [[44,140,228],[255,76,35],[202,199,191],[47,47,47]]

# Generate the actual keys (randomly in this case)
base_list = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,4] # the proportions of colors to shuffle

while True: # this feels like a hack # I just wanted a do while loop ;-;
    keys_list = []
    for i in range(40): # 40 keys in the default game
        keys_list.append({"layout":base_list.copy(),"first":floor(i/20)})
        random.shuffle(keys_list[i]["layout"])
        # layout = shuffled copy of base list
        # first = which of blue or red gets the double-agent tile and gets to start
        # half-and-half split on either team going first
    # check for duplicates
    for i in range(len(keys_list)):
        for j in range(len(keys_list)):
            if(i==j): # don't check an item against itself duh
                continue
            if(keys_list[i]["layout"]==keys_list[j]["layout"]):
                break # basically, if two layouts are found to be equal: stop inner loop
        else:
            break # oh, inner loop broke; break outer loop
    else:
        continue # oh, outer loop broke; that means we need to generate a new set of keys
    break # well, the outer loop didn't break; that must mean the keys are unique and we can carry on
 

# Calculate the number of cards that can fit on a single page
cards_per_row = int((PAGE_WIDTH - 2 * BORDER_SIZE) // CARD_WIDTH)
cards_per_column = int((PAGE_HEIGHT - 2 * BORDER_SIZE) // CARD_HEIGHT)
cards_per_page = cards_per_row * cards_per_column

# Calculate the number of pages required
num_pages = len(keys_list) // cards_per_page
if len(keys_list) % cards_per_page != 0:
    num_pages += 1

# Create a new PDF instance
pdf = FPDF(orientation='L', unit='mm', format='letter')

# Initialize the prefered font
pdf.add_font("footlight", fname="C:\Windows\Fonts\FTLTLT.TTF",uni=True)
pdf.add_font("vivaldi", fname="C:\Windows\Fonts\VIVALDII.TTF",uni=True)
pdf.add_font("script", fname="C:\Windows\Fonts\SCRIPTBL.TTF",uni=True)
pdf.add_font("pristina", fname="C:\Windows\Fonts\PRISTINA.TTF",uni=True)
pdf.add_font("richard", fname="C:\Windows\Fonts\POORICH.TTF",uni=True)
pdf.add_font("parchment", fname="C:\Windows\Fonts\PARCHM.TTF",uni=True)
pdf.add_font("old", fname="C:\Windows\Fonts\OLDENGL.TTF",uni=True)
pdf.add_font("corsiva", fname="C:\Windows\Fonts\MTCORSVA.TTF",uni=True)
pdf.add_font("maiandra", fname="C:\Windows\Fonts\MAIAN.TTF",uni=True)
pdf.add_font("lucidahand", fname="C:\Windows\Fonts\LHANDW.TTF",uni=True)
pdf.add_font("lucidacallig", fname="C:\Windows\Fonts\LCALLIG.TTF",uni=True) # -> Default backing


# (Sorry for the sudden function definition we need it in the next loop)
# Add the backing to the cards by way of an intermediate page
def add_backings():
    pdf.add_page()
    for i in range(cards_per_page):
        
        x = start_x + (i % cards_per_row) * CARD_WIDTH + EXTRA_BORDER_LEFT
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")
        pdf.set_line_width(LINE_SIZE_INNER)
        pdf.rect(x+MARGIN, y+MARGIN, CARD_WIDTH-2*MARGIN, CARD_HEIGHT-2*MARGIN, "D")
        pdf.ellipse(x + 2*MARGIN,y + 2*MARGIN,CARD_WIDTH-4*MARGIN,CARD_HEIGHT-4*MARGIN,"D")
        
        pdf.set_font('lucidacallig', '', 24)
        pdf.set_xy(x, y + (CARD_HEIGHT-2*pdf.font_size)/2)
        pdf.multi_cell(CARD_WIDTH, pdf.font_size , "Codenames\nD&D edition", align='C', border = False)


# Generate the PDF
for page in range(num_pages):
    pdf.add_page()

    # Calculate the starting position for cards on the current page
    start_x = (PAGE_WIDTH - (cards_per_row * CARD_WIDTH)) / 2
    start_y = (PAGE_HEIGHT - (cards_per_column * CARD_HEIGHT)) / 2

    # Generate cards for the current page
    for i in range(cards_per_page):
        card_index = page * cards_per_page + i
            
        if card_index >= len(keys_list):
            break

        # Calculate the position for the current card
        x = start_x + (i % cards_per_row) * CARD_WIDTH + EXTRA_BORDER_LEFT
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        
        # Draw card border
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")
        pdf.set_line_width(LINE_SIZE_INNER)
        pdf.rect(x+MARGIN, y+MARGIN, CARD_WIDTH-2*MARGIN, CARD_HEIGHT-2*MARGIN, "D")
        
        # Board "constants"
        BOARD_WH = 5
        board_x = x+CARD_WIDTH/2-CARD_HEIGHT/2+MARGIN + LINE_SIZE_OUTER # nudge to make space for border
        board_y = y+MARGIN + LINE_SIZE_OUTER
        board_size = CARD_HEIGHT-2*MARGIN - 2*LINE_SIZE_OUTER # squish a bit to see the border properly
        cell_size = board_size/BOARD_WH
        
        # Draw board border
        pdf.set_draw_color(*(COLORS[keys_list[card_index]["first"]])) # set border to be the color of the starting team
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(board_x-LINE_SIZE_OUTER/2, board_y-LINE_SIZE_OUTER/2, board_size+LINE_SIZE_OUTER, board_size+LINE_SIZE_OUTER, "D")
        pdf.set_draw_color(0) # reset border color
        pdf.set_line_width(LINE_SIZE_INNER)
        pdf.rect(board_x - LINE_SIZE_OUTER, board_y - LINE_SIZE_OUTER, board_size + 2*LINE_SIZE_OUTER, board_size + 2*LINE_SIZE_OUTER, "D") # add border to the border # borderception
        
        # Draw board cells
        for j in range(BOARD_WH**2):
            # fill in with the first player color if double card, else with the corresonding color
            pdf.set_fill_color(*(COLORS[keys_list[card_index]["first"] if keys_list[card_index]["layout"][j]==4 else keys_list[card_index]["layout"][j]]))
            pdf.rect(board_x+(j%BOARD_WH)*cell_size,board_y+(j//BOARD_WH)*cell_size,cell_size,cell_size,"DF")
        #pdf.set_fill_color(255) # reset fill color

    add_backings()


    


# Save the PDF file
pdf.output('key_cards.pdf')