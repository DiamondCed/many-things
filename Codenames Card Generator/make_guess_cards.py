from fpdf import FPDF
import os

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

# Card paths
PATHS = [
    "guess_cards/blue1.png",
    "guess_cards/blue2.png",
    "guess_cards/red1.png",
    "guess_cards/red2.png",
    "guess_cards/white1.png",
    "guess_cards/white2.png",
    "guess_cards/black.png",
    "guess_cards/black.png",
    "guess_cards/doubleblue.png",
    "guess_cards/doublered.png"
]

# Card types # 8 blue, 8 red, 7 white, 1 black, 1 double
TYPES = [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,4]

# Calculate the number of cards that can fit on a single page
cards_per_row = int((PAGE_WIDTH - 2 * BORDER_SIZE) // CARD_WIDTH)
cards_per_column = int((PAGE_HEIGHT - 2 * BORDER_SIZE) // CARD_HEIGHT)
cards_per_page = cards_per_row * cards_per_column

# Calculate the number of pages required # double the pages will actually be made because 2-sided cards
num_pages = len(TYPES) // cards_per_page
if len(TYPES) % cards_per_page != 0:
    num_pages += 1

# Create a new PDF instance
pdf = FPDF(orientation='L', unit='mm', format='letter')

# Generate the PDF
for page in range(num_pages):
    # Find out how many cards are actually on this page
    cards_this_page = cards_per_page
    if(page>=num_pages-1): # on last pages
        cards_this_page = len(TYPES)%(cards_per_page)

    # Calculate the starting position for cards on the current page aka the margins
    start_x = (PAGE_WIDTH - (cards_per_row * CARD_WIDTH)) / 2
    start_y = (PAGE_HEIGHT - (cards_per_column * CARD_HEIGHT)) / 2

    # FRONT PAGE
    pdf.add_page()

    # Generate cards for the current page
    for i in range(cards_this_page):
        card_index = page * cards_per_page + i
            
        if card_index >= len(TYPES):
            break

        # Calculate the position for the current card
        x = start_x + (i % cards_per_row) * CARD_WIDTH + EXTRA_BORDER_LEFT
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        
        # Place image
        pdf.image(PATHS[TYPES[card_index]*2],x,y,CARD_WIDTH,CARD_HEIGHT)
        
        # Draw card border
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")


        
    
    # BACK PAGE
    pdf.add_page()
    
    for i in range(cards_this_page):
        card_index = page * cards_per_page + i
            
        if card_index >= len(TYPES):
            break

        # Calculate the position for the current card
        x = -start_x + PAGE_WIDTH - (i % cards_per_row + 1) * CARD_WIDTH + EXTRA_BORDER_LEFT
        y = start_y + (i // cards_per_row) * CARD_HEIGHT
        
        # Place image
        pdf.image(PATHS[TYPES[card_index]*2+1],x,y,CARD_WIDTH,CARD_HEIGHT)
        
        # Draw card border
        pdf.set_line_width(LINE_SIZE_OUTER)
        pdf.rect(x, y, CARD_WIDTH, CARD_HEIGHT, "D")
        


    


# Save the PDF file
pdf.output('guess_cards.pdf')