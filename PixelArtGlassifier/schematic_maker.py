from litemapy import Region, BlockState
from PIL import Image

BOTTOM = 0
TOP = 1

def make_schematic(quantized_image: Image.Image, mapped_colors, texture_names, vert_align = BOTTOM):
    colors = [val for (_, val) in quantized_image.getcolors(65536)]
    depth = max(*[len(x) for x in mapped_colors])

    reg = Region(0,0,0,quantized_image.width,depth,quantized_image.height)
    schem = reg.as_schematic(name="Glassified_Image")

    blocks = [BlockState("minecraft:"+"".join(tex.split(".")[:-1])) for tex in texture_names] # assumes the texture name translates to block id 1:1 (which works for the glass I'm using)
    
    for x in range(reg.width):
        for z in range(reg.length):
            color = quantized_image.getpixel((x,z))
            if(color==(0,0,0)): # leave empty pixels as air
                continue
            colorid = colors.index(color)

            col_blocks = mapped_colors[colorid]
            cy = 0
            for y in range(reg.height):
                if(vert_align==TOP and reg.height-y>len(col_blocks)): # add air at the bottom instead of the top
                    continue
                if(cy>=len(col_blocks)): # leave air if column is less than 5 blocks
                    continue
                reg[x,y,z] = blocks[col_blocks[cy]]
                cy+=1
    
    schem.save("glassified_image.litematic")



