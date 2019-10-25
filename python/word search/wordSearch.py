# Python3 program for searching a word in a matrix of letters in all directions.


def direction(l, row, column, word, length, d1, d2):

    i = 1

    # Checking the word in the particular direction

    def fun(l, row, column, word, i, length, d1, d2):
        str = l[row+d1]
        if (i > length-1): 
            return False
        elif (str[column+d2] != word[i]): 
            return False
        elif(i == length-1): 
            return True
        else: return fun(l, row+d1, column+d2, word, i+1, length, d1, d2)

    # checking direction and whether the word is in the limit or not for particular direction

    if (d1 == -1 and d2 == 0):                                          # For top direction
        if not (row>=length-1): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == 1 and d2 == 0):                                           # For bottom direction
        if not ((row+length)<=len(l)): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == 0 and d2 == 1):                                           # For right direction
        if not ((len(l[0])-length)>=column): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == 0 and d2 == -1):                                          # For left direction
        if not (column>=length-1): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == -1 and d2 == -1):                                         # For topleft direction
        if not ((row>=length-1) and (column>=length-1)):
             return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == -1 and d2 == 1):                                          # For topright direction
        if not ((row>=length-1) and ((len(l[0])-length)>=column)): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == 1 and d2 == -1):                                          # For bottomleft direction
        if not ((row+length)<=len(l) and (column>=length-1)): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

    if (d1 == 1 and d2 == 1):                                           # For bottomright direction
        if not ((row+length)<=len(l) and ((len(l[0])-length)>=column)): 
            return False
        return fun(l, row, column, word, i, length, d1, d2)

# Input from user for number of test cases

testCases = int(input("No. of test cases (Press double enter when done)\n"))

# Storing values in a list

inputs = []
while True:
    line = input()
    if line:
        inputs.append(line)
    else:
        break

# Set direction
direction1 = [-1,1,0,0,-1,-1,1,1]
direction2 = [0,0,1,-1,-1,1,-1,1]

try:
    for loops in range(1,testCases+1):              # First for loop for test cases       
        word= inputs[int (inputs[0]) + 2]           # Word to be searched
        count = 0
        length = len(word)                          # Length of the word
        l = inputs[2 : int (inputs[0]) + 2]         # list from the word to be searched

        for i in range(0,len(l)):                   # Second for loop for rows

            for j in range(0,len(l[i])):            # Third for loop for columns
                if (l[i][j] == word[0]):
                    row,column=i,j

                    for d1,d2 in zip(direction1,direction2):                    # Forth for loop for directions
                        search = direction(l,row,column,word,length,d1,d2)
                        if(search!=False):
                            count+=1
                        else:
                            continue

                else : continue

        print("Count of word in Case {} : {} \n".format(loops,count))
        del inputs[0:int (inputs[0]) + 3]                               # Deleting the test case

except :
    print("wrong input in case {}".format(loops))                       # If something goes wrong
    exit()
