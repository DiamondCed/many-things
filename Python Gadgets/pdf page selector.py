import PyPDF2 as pdf
import os
import sys

os.chdir(__file__.rsplit("\\",1)[0])
cwd=os.getcwd()

if len(sys.argv)<2 or not sys.argv[1].rsplit(".",1)[1]=="pdf":
    print("file 1 not a pdf")
    quit()
    
if len(sys.argv)<3 or not sys.argv[2].rsplit(".",1)[1]=="pdf":
    print("file 2 not a pdf")
    quit()

try:
    file1 = open(sys.argv[1],"rb")
    file2 = open(sys.argv[2],"rb")
except FileNotFoundError:
    print("could not find file")
    quit()

reader1 = pdf.PdfFileReader(file1)
reader2 = pdf.PdfFileReader(file2)
writer = pdf.PdfFileWriter()

pages1 = [reader1.pages[x] for x in range(len(reader1.pages))]
pages2 = [reader2.pages[x] for x in range(len(reader2.pages))]

for i in range(max(len(pages1),len(pages2))):
    if(i>=len(pages1)):
        writer.addPage(pages2[i])
        continue
    elif(i>=len(pages2)):
        writer.addPage(pages1[i])
        continue
    sel = None
    while not sel in ["a","A","b","B"]:
        sel = input("Page "+str(i)+": From A or B?")
        if(sel=='A' or sel=="a"):
            writer.addPage(pages1[i])
        elif(sel=='B' or sel=="b"):
            writer.addPage(pages2[i])

output = open(os.path.join(cwd,"edited_"+sys.argv[1].rsplit("\\",1)[1]),"wb")
writer.write(output)

file1.close()
file2.close()
output.close()