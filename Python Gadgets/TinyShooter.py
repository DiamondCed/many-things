import msvcrt
import os
import sys
import math
import random


transparents = [0]
arrowChars = ["Λ","<","V",">"]
deathMessage="You Died! R to retry"


def makeBoard(board,width,height):
    os.system("mode con: cols="+str(width*2)+" lines="+str(height+2))
    for i in range(height):
        board.append([])
        for j in range(width):
            if j==0 or j==width-1 or i==0 or i==height-1:
                board[i].append(1)
            else:
                board[i].append(0)

def controls(e):
    if e==b'w':
        if testPos(mainBoard,[mainPos[0],mainPos[1]-1])==1:
            mainPos[1]=mainPos[1]-1
        mainPos[2]=0
    elif e==b'a':
        if testPos(mainBoard,[mainPos[0]-1,mainPos[1]])==1:
            mainPos[0]=mainPos[0]-1
        mainPos[2]=1
    elif e==b's':
        if testPos(mainBoard,[mainPos[0],mainPos[1]+1])==1:
            mainPos[1]=mainPos[1]+1
        mainPos[2]=2
    elif e==b'd':
        if testPos(mainBoard,[mainPos[0]+1,mainPos[1]])==1:
            mainPos[0]=mainPos[0]+1
        mainPos[2]=3
    elif e==b' ':
        dummy=1
        #do nothing
    elif e==b'W':
        arrows.append([mainPos[0],mainPos[1],0])
    elif e==b'A':
        arrows.append([mainPos[0],mainPos[1],1])
    elif e==b'S':
        arrows.append([mainPos[0],mainPos[1],2])
    elif e==b'D':
        arrows.append([mainPos[0],mainPos[1],3])

    
def drawBoard(board,charPos):
    sys.stderr.write("\x1b[2J\x1b[H")
    print("Score: "+str(score))
    for i in range(len(board)):
        for j in range(len(board[0])):
            empty=1
            for k in range(len(arrows)):
                if arrows[k][0]==j and arrows[k][1]==i:
                    print(arrowChars[arrows[k][2]],end=" ")
                    empty=0
                    break
            if empty==1:
                for k in range(len(enemies)):
                    if enemies[k][0]==j and enemies[k][1]==i:
                        if enemies[k][2]==0:
                            print("X",end=" ")
                        else:
                            print("#",end=" ")
                        empty=0
                        break
            if empty==1:
                if charPos[0]==j and charPos[1]==i:
                    print("@",end=" ")
                elif board[i][j]==1:
                    print("\u25A0",end=" ")
                else:
                    print(" ",end=" ")
        print()

def testPos(board,pos,id=-1):
    if board[pos[1]][pos[0]] not in transparents:
        return 0
    if id>=0:
        for i in range(len(enemies)):
            if (pos[0]==enemies[i][0] and pos[1]==enemies[i][1]) and not id==i:
                return 0
    return 1
    
def manageArrows():
    global score
    toRemove=[]
    toRemoveEnemies=[]
    for i in range(len(arrows)):
        if arrows[i][2]==0:
            if testPos(mainBoard,[arrows[i][0],arrows[i][1]-1])==1:
                arrows[i][1]=arrows[i][1]-1
            else:
                toRemove.append(i)
        elif arrows[i][2]==1:
            if testPos(mainBoard,[arrows[i][0]-1,arrows[i][1]])==1:
                arrows[i][0]=arrows[i][0]-1
            else:
                toRemove.append(i)
        elif arrows[i][2]==2:
            if testPos(mainBoard,[arrows[i][0],arrows[i][1]+1])==1:
                arrows[i][1]=arrows[i][1]+1
            else:
                toRemove.append(i)
        elif arrows[i][2]==3:
            if testPos(mainBoard,[arrows[i][0]+1,arrows[i][1]])==1:
                arrows[i][0]=arrows[i][0]+1
            else:
                toRemove.append(i)
        for j in range(len(enemies)):
            if enemies[j][0]==arrows[i][0] and enemies[j][1]==arrows[i][1]:
                toRemove.append(i)
                toRemoveEnemies.append(j)
                score=score+1
    toRemove.sort(reverse=True)
    toRemoveEnemies.sort(reverse=True)
    for i in range(len(toRemove)):
        arrows.remove(arrows[toRemove[i]])
    for i in range(len(toRemoveEnemies)):
        #enemies.remove(enemies[toRemoveEnemies[i]])
        enemies[toRemoveEnemies[i]][2]=1

def manageEnemies():
    global score
    global dead
    toRemove=[]
    toRemoveArrows=[]
    for i in range(len(enemies)):
        if not enemies[i][2]==1:
            directions=[]
            if enemies[i][1]>mainPos[1]:
                directions.append(0)
            if enemies[i][0]>mainPos[0]:
                directions.append(1)
            if enemies[i][1]<mainPos[1]:
                directions.append(2)
            if enemies[i][0]<mainPos[0]:
                directions.append(3)
            if len(directions)>0:
                selected=directions[random.randint(0,len(directions)-1)]
                if selected==0:
                    if testPos(mainBoard,[enemies[i][0],enemies[i][1]-1],i)==1:
                        enemies[i][1]=enemies[i][1]-1
                elif selected==1:
                    if testPos(mainBoard,[enemies[i][0]-1,enemies[i][1]],i)==1:
                        enemies[i][0]=enemies[i][0]-1
                elif selected==2:
                    if testPos(mainBoard,[enemies[i][0],enemies[i][1]+1],i)==1:
                        enemies[i][1]=enemies[i][1]+1
                elif selected==3:
                    if testPos(mainBoard,[enemies[i][0]+1,enemies[i][1]],i)==1:
                        enemies[i][0]=enemies[i][0]+1
            for j in range(len(arrows)):
                if arrows[j][0]==enemies[i][0] and arrows[j][1]==enemies[i][1]:
                    toRemove.append(i)
                    toRemoveArrows.append(j)
                    score=score+1
            if mainPos[0]==enemies[i][0] and mainPos[1]==enemies[i][1]:
                dead=True
    toRemove.sort(reverse=True)
    toRemoveArrows.sort(reverse=True)
    for i in range(len(toRemove)):
        #enemies.remove(enemies[toRemove[i]])
        enemies[toRemove[i]][2]=1
    for i in range(len(toRemoveArrows)):
        arrows.remove(arrows[toRemoveArrows[i]])
    
def spawnEnemies(board):
    max=10
    if (len(enemies)<max and random.randint(0,4)==0) or (len(enemies)==0 and random.randint(0,0)==0):
        x=random.randint(0,len(board[0])-1)
        y=random.randint(0,len(board)-1)
        if board[y][x] in transparents and abs(mainPos[0]-x+mainPos[1]-y)>5:
            enemies.append([x,y,0])
            
def removeDeadEnemies():
    for i in sorted(range(len(enemies)),reverse=True):
        if enemies[i][2]==1:
            enemies.remove(enemies[i])

def printDeathScreen(board):
    sys.stderr.write("\x1b[2J\x1b[H")
    print("Score: "+str(score)+" "*math.floor(len(board[0])-len("Score: "+str(score))-len(deathMessage)/2)+deathMessage)
    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j]==1:
                print("\u25A0",end=" ")
            else:
                print(" ",end=" ")
        print()

loop=True
while(loop):
    mainBoard = []
    mainPos = [1,1,0]
    score=0
    arrows=[]
    enemies=[]
    dead=False
    
    makeBoard(mainBoard,30,20)
    drawBoard(mainBoard,mainPos) 
    while(dead==False):
        controls(msvcrt.getch())
        spawnEnemies(mainBoard)
        manageArrows()
        manageEnemies()
        drawBoard(mainBoard,mainPos)
        removeDeadEnemies()
    printDeathScreen(mainBoard)
    loop=False
    if(msvcrt.getch() in [b'r',b'R']):
        loop=True