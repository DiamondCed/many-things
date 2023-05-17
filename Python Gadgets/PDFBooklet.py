import PyPDF2 as pdf
import os
import sys

os.chdir(__file__.rsplit("\\",1)[0])
cwd=os.getcwd()

if len(sys.argv[1])<2 or not sys.argv[1].rsplit(".",1)[1]=="pdf":
    print("not a pdf")
    quit()

try:
    file = open(sys.argv[1],"rb")
except FileNotFoundError:
    print("could not find file")
    quit()

reader = pdf.PdfFileReader(file)
writer = pdf.PdfFileWriter()

pages = [reader.pages[x] for x in range(len(reader.pages))]
#print(pages)
while(not len(pages)%4==0):
    pages.append(None)


page1Box=reader.getPage(0).mediaBox
width=page1Box.getWidth()
height=page1Box.getHeight()

for i in range(int(len(pages)/4)):
              #8, 1, 2, 7 = 8-(2*0), 2*0+1, 2*0+2, 8-(2*0+1)
    for j in [len(pages)-(2*i+1),2*i,2*i+1,len(pages)-(2*i+2)]:
        if(not pages[j]==None):
            writer.addPage(pages[j])
        else:
            writer.addBlankPage(width,height)

output = open(os.path.join(cwd,"booklet_"+sys.argv[1].rsplit("\\",1)[1]),"wb")
writer.write(output)

file.close()
output.close()