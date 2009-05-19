#!/usr/bin/env python

"""
Author: Bodaniel Jeanes <n5687802@student.qut.edu.au>
Date: 22 September, 2006

Algorithm to try to sort sudoku squares into block groupings.
  - Each number printed to console (9x9 grid) represents a square.
     - The number represents the group it should belong to.
"""

""" DRAFT 1:
print "\n" # formatting

for i in range(0,9):
    string = "" # resets each line :-)
    for j in range(0,9):
        string = string + str( ((i+1)/3) * ((j+1)/3) ) + "\t"
    print string + "\n\n"
"""
    
    
# WORKING ALGORITHM:
   
print "\n" # formatting

for k in range (0,3):
    for i in range(0,3):
        string = "" # resets each line :-)
        for j in range(0,9):
            string = string + str( ((i/3)+1)*((j/3)+1)+(3*k) - 1 ) + "\t" 
        print string + "\n\n"