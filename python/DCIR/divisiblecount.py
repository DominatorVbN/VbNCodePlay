# Python3 code for finding the count of divisible numbers from a user input number in a range.

# Taking input from user for number of test cases..
testCases = int(input("No. of test cases (Press double enter when done)\n"))

# storing the values in a list.
inputs = []
for i in range(0,testCases*3):
    line = int(input())
    if line:
        inputs.append(line)
    else:
        break

# Dividind the list to make sublist of 3 elements.
final = [inputs[i * 3:(i + 1) * 3] for i in range((len(inputs) + 2) // 3 )]

# Checking for the divisible number and increasing count if present.
counts=[]
for i in range(0,len(final)):
    w = final[i]
    a,b,k,count = w[0],w[1],w[2],0
    for j in range(a,b+1):
        if (j%k ==0):
            count+=1
        else:
            continue
    counts.append(count)

# Printing counts of each test case.
for z in range(1,len(counts)+1):
    print("case {} = {}".format(z,counts[z-1]))