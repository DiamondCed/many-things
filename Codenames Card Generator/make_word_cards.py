from fpdf import FPDF
import os
import csv
import sys
import random

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

# Arbitrary list of words to display on cards # used as example when nothing is loaded
words_list = [
    "Hello",
    "World",
    "Python",
    "Script",
    "PDF",
    "Playing",
    "Cards",
    "OpenAI",
    "GPT-3.5",
    "Chatbot"
    #"","","","","","","","",""
]
# Read word list from argv if it exists
if len(sys.argv)>=2:
    words = open(sys.argv[1],"r")
    words_list = list(csv.reader(words, delimiter=","))
    words.close()
    words_list = [row[0].capitalize() for row in words_list]


    

# Calculate the number of cards that can fit on a single page
cards_per_row = int((PAGE_WIDTH - 2 * BORDER_SIZE) // CARD_WIDTH)
cards_per_column = int((PAGE_HEIGHT - 2 * BORDER_SIZE) // CARD_HEIGHT)
cards_per_page = cards_per_row * cards_per_column

# Calculate the number of pages required
num_pages = (len(words_list) // cards_per_page*2)//2 # to account for double-sided cards
if len(words_list) % cards_per_page*2 != 0:
    num_pages += 2

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
pdf.add_font("corsiva", fname="C:\Windows\Fonts\MTCORSVA.TTF",uni=True) # -> current favourite
pdf.add_font("maiandra", fname="C:\Windows\Fonts\MAIAN.TTF",uni=True)
pdf.add_font("lucidahand", fname="C:\Windows\Fonts\LHANDW.TTF",uni=True)
pdf.add_font("lucidacallig", fname="C:\Windows\Fonts\LCALLIG.TTF",uni=True) # -> 2nd favourite


# (Sorry for the sudden function definition we need it in the next loop)
# Add the backing to the cards by way of an intermediate page
def add_backings():
    pdf.add_page()
    for i in range(cards_per_page):
        
        x = start_x + (i % cards_per_row) * CARD_WIDTH
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")
        pdf.set_line_width(LINE_SIZE_INNER)
        pdf.rect(x+MARGIN, y+MARGIN, CARD_WIDTH-2*MARGIN, CARD_HEIGHT-2*MARGIN, "D")
        pdf.ellipse(x + 2*MARGIN,y + 2*MARGIN,CARD_WIDTH-4*MARGIN,CARD_HEIGHT-4*MARGIN,"D")
        
        pdf.set_font('lucidacallig', '', 24)
        pdf.set_xy(x, y + (CARD_HEIGHT-2*pdf.font_size)/2)
        pdf.multi_cell(CARD_WIDTH, pdf.font_size , "Codenames\nD&D edition", align='C', border = False)

# Shuffle words list so an obvious pattern in front and back of cards doesn't emerge
#random.shuffle(words_list)

# Generate the PDF
for page in range(num_pages):
    pdf.add_page()

    # Set font and font size for card text
    pdf.set_font('corsiva', '', 48)

    # Calculate the starting position for cards on the current page
    start_x = (PAGE_WIDTH - (cards_per_row * CARD_WIDTH)) / 2
    start_y = (PAGE_HEIGHT - (cards_per_column * CARD_HEIGHT)) / 2

    cards_this_page = cards_per_page
    if(page>=num_pages-2): # on last two pages
        cards_this_page = (len(words_list)%(cards_per_page*2))//2

    # Generate cards for the current page
    for i in range(cards_this_page):
        if page>=num_pages-1:
            card_index = (page-1) * cards_per_page + cards_this_page + i
        else:
            card_index = page * cards_per_page + i
            
        if card_index >= len(words_list):
            break

        # Calculate the position for the current card
        if page>=num_pages-1:
            x = -start_x + PAGE_WIDTH - (i % cards_per_row + 1) * CARD_WIDTH + EXTRA_BORDER_LEFT
        else:
            x = start_x + (i % cards_per_row) * CARD_WIDTH + EXTRA_BORDER_LEFT
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        
        # Draw card border
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")
        pdf.set_line_width(LINE_SIZE_INNER)
        pdf.rect(x+MARGIN, y+MARGIN, CARD_WIDTH-2*MARGIN, CARD_HEIGHT-2*MARGIN, "D")

        # Set the cursor position for card text
        pdf.set_xy(x, y + (CARD_HEIGHT - pdf.font_size) / 2)
        #pdf.set_xy(x, y)

        # Write text in the center of the card # CARD_HEIGHT
        pdf.multi_cell(CARD_WIDTH, pdf.font_size , words_list[card_index], align='C', border = False)
        
    #add_backings()


    


# Save the PDF file
pdf.output('word_cards.pdf')