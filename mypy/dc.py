""" CMSC471 02 hw2 spring 2016
    Tristan Adams, tristana@umbc.edu

    Dog Cat Program

    This acts as the problem file for the Dog Cat game, where one is given
    an initial state and a goal state, and must make one letter swaps from
    the initial word, to get to the goal. This problem supports 3 types of
    cost scaling:
        - steps: Every step has 1 cost
        - scrabble: Like steps, but instead of 1 cost, cost varies based
            on the rules of scrabble
        - frequency: uses the frequency of the next work to total up cost,
            stored in dictionary
"""    

import aima.search as a       # AIMA module for search problems

dict_file = "words34.txt"

dictionary = {}

for line in open(dict_file):
    word, n = line.strip().split('\t')
    dictionary[word] = float(n)

class DC(a.Problem):

    """ 
        Initialize the problem object 
    """
    def __init__(self, initial='dog', goal='cat', cost='steps'):
        self.initial = initial
        self.goal = goal
        self.cost = cost

    """ 
        based on a state, determine all possible actions based on
        dictionary
    """
    def actions(self, state):
        for i in range(0, len(state)):
            for letter in "abcdefghijklmnopqrstuvwxyz":
                temp = list(state)
                temp[i] = letter
                if dictionary.has_key("".join(temp)):
                     yield (i, letter)

    """
        Based on a state and an action, give a result
    """
    def result(self, state, action):
        letters = list(state)
        letters[action[0]] = action[1]
        return "".join(letters)

    """
        Test if the goal has been met yet
    """
    def goal_test(self, state):
        return state == self.goal

    """
       Determine the cost of the path based on cost type, current path cost,
       the current state, an action, and the state resulting from the action
    """
    def path_cost(self, c, state1, action, state2):
        a = action[1]
        if self.cost == 'steps':
            return c + 1
        elif self.cost == 'scrabble':
            if a in 'aeioulnstr':
                return c + 1
            if a in 'dg':
                return c + 2
            if a in 'bcmp':
                return c + 3
            if a in 'fhvwy':
                return c + 4
            if a == 'k':
                return c + 5
            if a in 'jx':
                return c + 6
            if a in 'zq':
                return c + 10
        else:
            c += 1
            return c + dictionary[state2]

    def __repr__(self):
        """ returns a string to represent a dc problem """
        return "DC({}, {})".format(self.initial, self.goal)

    def h(self, node):
        """Heuristic: returns cost of letters different """
        costDiff = 0
        goalAcs = self.actions(self.goal)
        numGAcs = 0
        for gAction in goalAcs:
            numGAcs += 1

        if numGAcs == 0:
            return -1
        
        if(self.cost == "steps"):
            """
            h() for cost of steps. Adds up the number of different letters from
            node.state to goal
            """
            for i in range(0, len(node.state)):
                if node.state[i] != self.goal[i]:
                    costDiff += 1
        elif(self.cost == "scrabble"):
            """
            h() for cost of scrabble. Same as steps, but adds in the cost
            based on scrabble rules
            """
            for i in range(0, len(node.state)):
                if node.state[i] != self.goal[i]:
                    if self.goal[i] in 'aeioulnstr':
                        costDiff += 1
                    if self.goal[i] in 'dg':
                        costDiff += 2
                    if self.goal[i] in 'bcmp':
                        costDiff += 3
                    if self.goal[i] in 'fhvwy':
                        costDiff += 4
                    if self.goal[i] == 'k':
                        costDiff += 5
                    if self.goal[i] in 'jx':
                        costDiff += 6
                    if self.goal[i] in 'zq':
                        costDiff += 10
        else:
            """
            h() for the cost of frequency. Returns the cost of the most
            common word in path according to words34.txt
            """

            ### Method 1: cost of most common word
            """
            nodePath = node.path()
            costDiff = -1
            for i in range(0,len(nodePath)):
                pathState = nodePath[i].state
                if costDiff < dictionary[pathState]:
                    costDiff = dictionary[pathState]
            """
            
            ### Method 2: cost(state) + cost(final) + average cost(actions 
            ### from state
            
            costDiff = 1 + dictionary[node.state]
            costDiff += dictionary[self.goal]
            average = 0
            numActions = 0
            allActions = self.actions(node.state)
            for i in allActions:
                numActions += 1
                temp = list(node.state)
                temp[i[0]] = i[1]
                average += dictionary["".join(temp)]
            average /= numActions
            costDiff += average
            

            ### Method 3: cost of goal
            """
            costDiff = dictionary[node.goal]
            """
        return costDiff
