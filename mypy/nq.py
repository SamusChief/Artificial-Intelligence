""" A subclass of a constraint problem to solve an n-queens problem of
    a given size with a given solver """

from constraint import *

class NQ(Problem):

    def __init__(self, n=8, solver=None):

        """N is the size of the board, solver is the CSP solver
           that will be used to sove the problem """

        # call the base class init method
        super(NQ, self).__init__(solver=solver)

        # set any NQ instance variables needed
        columns = range(n)
        rows = range(n)
        # define CSP variables with their domains
        self.addVariables(columns, rows)
        # add CSP constraints 
        for c1 in columns:
            for c2 in columns:
                if c1 < c2:
                    self.addConstraint(lambda r1, r2, c1=c1, c2=c2:
                                           abs(r1 - r2) != abs(c1-c2) and r1 != r2, (c1, c2))
