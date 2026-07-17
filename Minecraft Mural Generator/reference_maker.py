import os
from PIL import Image

def make_reference(quantized_image: Image.Image, mapped_colors, texture_names):
    colors = [val for (_, val) in quantized_image.getcolors(65536)]

    reference = Image.new("RGBA", (quantized_image.width*16,quantized_image.height*16))
    for x in range(quantized_image.width):
        for y in range(quantized_image.height):
            color = quantized_image.getpixel((x,y))
            if(color==(0,0,0)): # leave empty pixels as background
                continue
            colorid = colors.index(color)

            col_textures = mapped_colors[colorid]
            for i in range(len(col_textures)):
                tex = Image.open(os.path.join("sources", texture_names[col_textures[i]])).crop((0,0,16,16)) # I don't know if it caches them, might be bad for performance
                
                expanded = Image.new("RGBA", reference.size, (0,0,0,0))
                expanded.paste(tex, (16*x, 16*y))
                reference.alpha_composite(expanded)
    
    reference.show()
    reference.save("reference.png")