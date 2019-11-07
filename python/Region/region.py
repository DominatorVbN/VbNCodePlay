# This is Python3 code for finding the region of army and contested area for a particular problem

class area:

    # Class variables
    num = 0
    i = 0
    j = 0
    region = []
    visited = []
    groundVisited = []
    present = []
    Square = []

    # Initializing Values
    def __init__(self, row, column, data):
        self.row = row
        self.column = column
        self.data = data
        self.regions()
        self.give(area.region)

    # Show the values
    def give(self,region):
        contest = 0
        dct = dict()
        for j in region:
            letter = j[0]
            check = False
            for l in j:
                if (l != "." and l != letter):
                    contest+=1
                    check = False
                    break
                else:
                    check = True
            if check==True:
                dct[letter] = dct.get(letter,0)+1
        for key , value in dct.items():
            if value != 0:
                print(key,":",value)
        print("Contested:",contest)

    # Finding regions
    def regions(self):
        for area.i in range(self.row):

            for area.j in range(self.column):

                if not [area.i,area.j] in area.visited:
                    area.visited.append([area.i,area.j])
                    
                    if self.data[area.i][area.j].isalpha():
                        area.current = [area.i,area.j]
                        area.region.append([])
                        self.addArea()
                        way = self.paths()

                        while(way):
                            if(len(way)>1):
                                area.Square.append([area.i,area.j])
                            self.go(way[0]) 
                            way = self.paths()

                        while(area.Square):
                            a, b = area.Square[0][0], area.Square[0][1]
                            area.i,area.j = a, b
                            way = self.paths()

                            while(way):
                                if(len(way)>1):
                                    area.Square.append([area.i,area.j])
                                self.go(way[0])
                                way = self.paths()

                            area.Square.remove([a,b])

                        area.visited = area.visited+area.groundVisited
                        area.groundVisited = []
                        area.Square = []
                        area.i = area.current[0]
                        area.j = area.current[1]
                        area.num+=1

    # returning the directions for a position
    def paths(self):
        dic = {1:self.position("right", 0, 1),
        2:self.position("down", 1, 0),
        3:self.position("left", 0, -1),
        4:self.position("up", -1, 0)}
        d = [key for key,items in dic.items() if items and items[0] if items[1]]
        if(d):
            return d
        else:
            return False

    # returning the bool values
    def position(self, string, x, y):
        if(string=="right" and area.j < self.column - 1):
            return self.boolValue(x, y)

        elif(string=="down" and area.i < self.row - 1):
            return self.boolValue(x, y)

        elif(string=="left" and area.j > 0):
            return self.boolValue(x, y)

        elif(string=="up" and area.i > 0):
            return self.boolValue(x, y)
        else:
            return False

    # check for the character in particular direction
    def boolValue(self, x, y):
        return [bool([area.i+x,area.j+y] not in area.groundVisited)
            ,bool(self.data[area.i+x][area.j+y] != "#" )]
    

    # adding the region value 
    def addArea(self):
        area.region[area.num].append(data[area.i][area.j])
        area.groundVisited.append([area.i,area.j])

    # Changing direction
    def go(self,direction):
        if(direction==1): 
            area.j = area.j+1 
        elif(direction==2): 
            area.i = area.i+1 
        elif(direction==3): 
            area.j = area.j-1
        elif(direction==4): 
            area.i = area.i-1
        self.addArea()

# Taking Input For test cases
testCases = int(input("Type the no. of test cases(Double enter to exit) : "))


# If you want to add your own file then use this
# inputData = [line.strip() for line in open('YourFileName.txt')]

# Taking input from user
inputData = []
while True:
    line = input()
    if line:
        inputData.append(line)
    else:
        break

# Finding answers
try:
    for loop in range(1,testCases+1):                       # Loop for test cases

        data = inputData[2 : int(inputData[0]) + 2]         # Taking first test case for input
        row = int(inputData[0])                             # Row of test case
        column = int(inputData[1])                          # Column of test case
        print("Case :",loop)
        area(row, column, data)                             # Starting class
        del inputData[0:int(inputData[0])+2]                # Deleting input

except:

    print("Wrong input in case {}".format(loop))            # If something goes wrong
    exit()