import re

def validateInt(P):
    pattern = '[^\a-f0-9]'
    
    return re.search(pattern, P) == None or P == ""
    
def validateHex(P):
    pattern = '[^{A-Fa-f0-9{+}{\-}{*}{/}{\(}{\)}{%}}]'
    
    return re.search(pattern, P) == None or P == ""
    
def toUnicode(chr):
    return("\\u"+(str(hex(ord(chr)))+"~")[2:-1])

def evaluateHex(expression):
    components=list(expression)
    temp=[]
    eq=""
    curr=""
    result=""
    patternA = '[{A-Fa-f0-9}]'
    for i in range(len(components)):
        if re.search(patternA,components[i]):
            curr=curr+components[i]
        else:
            if not curr=="":
                temp.append("0x"+curr)
                eq=eq+"0x"+curr
                curr=""
            temp.append(components[i])
            eq=eq+components[i]
    if not curr=="":
        temp.append("0x"+curr)
        eq=eq+"0x"+curr
    try:
        result = "="+hex(int(eval(eq))).upper().replace("X","x")
    except:
        pass
        #print(traceback.format_exc())
    if eq=="":
        result = "="
    
    return result