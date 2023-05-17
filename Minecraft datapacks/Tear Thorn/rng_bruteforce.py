def rng(prev,deloop):
    temp=prev
    prev=prev**2
    prev=prev//100
    temp=temp//1000
    prev=prev%10000
    prev=prev+deloop
    prev=prev%10000
    return(prev)
    
best=0
value=None
init=4314
start=None
end=None

amt=50
print("["+amt*"-"+"]")
print("[",end="",flush=True)
for i in range(amt*100):
    if(i%100==0):
        print("-",end="",flush=True)
    attempts=0
    seen=[]
    last=rng(init,i)
    while not (attempts>10000 or any(seen.count(element) > 1 for element in seen)):
        seen.append(last)
        last=rng(last,i)
        #print(attempts)
        attempts=attempts+1
    seen.append(last)
    leng=0
    try:
        leng=seen.index(last,seen.index(last)+1)-seen.index(last)
        if(leng>best):
            value=i
            best=leng
            start=seen.index(last)
            end=seen.index(last,seen.index(last)+1)
        
    except BaseException:
        print("fail("+str(len(seen))+") "+str(seen)+"\n")
    
print(str(value)+" -> "+str(best)+" ["+str(start)+", "+str(end)+"]")
input()