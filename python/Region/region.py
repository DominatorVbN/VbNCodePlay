# This is the code for finding the region of army and contested area for a perticular problem

class area:

    # Initializing Values
    def __init__(self, row, column, data, case):
        self.num = 0
        self.i = 0
        self.j = 0
        self.region = []
        self.visited = []
        self.groundVisited = []
        self.present = []
        self.Square = []
        self.row = row
        self.column = column
        self.data = data
        self.case = case
        self.regions()
        self.give(self.region)

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

    # Finding reagions
    def regions(self):
        for self.i in range(self.row):

            for self.j in range(self.column):

                if not [self.i,self.j] in self.visited:
                    self.visited.append([self.i,self.j])
                    
                    if self.data[self.i][self.j].isalpha():
                        self.current = [self.i,self.j]
                        self.region.append([])
                        self.addArea()
                        way = self.paths()

                        while(way):
                            if(len(way)>1):
                                self.Square.append([self.i,self.j])
                            self.go(way[0]) 
                            way = self.paths()
                        while(self.Square):
                            a, b = self.Square[0][0], self.Square[0][1]
                            self.i,self.j = a, b
                            way = self.paths()

                            while(way):
                                if(len(way)>1):
                                    self.Square.append([self.i,self.j])
                                self.go(way[0])
                                way = self.paths()

                            self.Square.remove([a,b])

                        self.visited = self.visited+self.groundVisited
                        self.groundVisited = []
                        self.Square = []
                        self.i = self.current[0]
                        self.j = self.current[1]
                        self.num+=1

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
        if(string=="right" and self.j < self.column - 1):
            return self.boolValue(x, y)

        elif(string=="down" and self.i < self.row - 1):
            return self.boolValue(x, y)

        elif(string=="left" and self.j > 0):
            return self.boolValue(x, y)

        elif(string=="up" and self.i > 0):
            return self.boolValue(x, y)
        else:
            return False

    # check for the character in perticular direction
    def boolValue(self, x, y):
        return [bool([self.i+x,self.j+y] not in self.groundVisited)
            ,bool(self.data[self.i+x][self.j+y] != "#" )]
    

    # adding the region value 
    def addArea(self):
        #stores the position in region list
        self.region[self.num].append(data[self.i][self.j])
        self.groundVisited.append([self.i,self.j])

    # Changing direction
    def go(self,direction):
        if(direction==1): 
            self.j = self.j+1 
        elif(direction==2): 
            self.i = self.i+1 
        elif(direction==3): 
            self.j = self.j-1
        elif(direction==4): 
            self.i = self.i-1
        self.addArea()

# Taking Input For test cases
testCases = int(input("Type the no. of test cases(Double enter to exit) : ") or "100")


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
        row = int(inputData[0])                             # Row of test case
        column = int(inputData[1])                          # Column of test case
        data = inputData[2 : int(inputData[0]) + 2]         # Taking first test case for input                       
        print("Case :",loop)
        region = area(row, column, data, loop)              # Starting class
        del inputData[0:row+2]                              # Deleting input

except:

    print("Wrong input in case {}".format(loop))            # If something goes wrong
    exit()