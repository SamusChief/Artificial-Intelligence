""" A subclass of a constraint problem to find a magic square for a
    nxn grid and sum n*(n*n+1)/2. """

from constraint import *

class MS(Problem):

    def __init__(self, n=3, solver=None):

        """N is the size of the magic square, solver is the CSP solver
           that will be used to sove the problem """

        # call the base class init method
        super(MS, self).__init__(solver=solver)

        # set any MS instance variables needed
        self.addVariables(range(0, (n**2)), range(1, (n**2)+1))
        self.addConstraint(AllDifferentConstraint(), range(0, (n**2)))
        diag1 = []
        diag2 = []
        for i in range(0, n):
            diag2.append((n - 1) * (i + 1))
            diag1.append((n + 1) * i)
        self.addConstraint(ExactSumConstraint(n * (n**2 + 1) / 2), diag1)
        self.addConstraint(ExactSumConstraint(n * (n**2 + 1) / 2), diag2)

        for row in range(n):
            self.addConstraint(ExactSumConstraint(n*(n**2+1)/2), [row*n+i for i in range(n)])
        for col in range(n):
            self.addConstraint(ExactSumConstraint(n*(n**2+1)/2), [col+n*i for i in range(n)])
        
