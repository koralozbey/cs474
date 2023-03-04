'''
Define number of colors.
Define number of vertices.
Define relations such that if two vertices v2 and v5 are connected,
then adding "25" to the relations will be sufficent.
Program only print the True assigned colors for reading simplicity.
Below output is the result of graph H in Homework2 Problem3 for all 
possible solutions in each line.
p12  =  True, p21  =  True, p40  =  True, p30  =  True, p00  =  True,  
p22  =  True, p11  =  True, p40  =  True, p30  =  True, p00  =  True,  
p41  =  True, p31  =  True, p20  =  True, p01  =  True, p12  =  True,  
p42  =  True, p32  =  True, p21  =  True, p10  =  True, p02  =  True,  
p20  =  True, p42  =  True, p32  =  True, p11  =  True, p02  =  True,  
p41  =  True, p31  =  True, p22  =  True, p01  =  True, p10  =  True,
'''
from z3 import *


n_colors = 3
n_vertices = 5
relations = ["01","02","12","13","14","23","24"]

table = [[0 for w in range(n_colors)] for h in range(n_vertices)]

for i in range(n_vertices):
    for n in range(n_colors):
        table[i][n] = Bool(f"p{i}{n}")

s = Solver()

for i in range(n_vertices):
    s.add(Or(table[i]))

    for k in range(n_colors-1):
        for l in range(n_colors - k - 1):
            s.add(Not(And(table[i][k],table[i][k+l+1])))

for r in relations:
    for c in range(n_colors):
        s.add(Not(And(table[int(r[0])][c],table[int(r[1])][c])))


res = s.check()
while (res == sat):
    m = s.model()
    for t in m.decls():
        if is_true(m[t]):
            print(t," = ",m[t],end=', ')
    print(' ')
    #print(m)
    block = []
    for var in m:
        block.append(var() != m[var])
    s.add(Or(block))
    res = s.check()




