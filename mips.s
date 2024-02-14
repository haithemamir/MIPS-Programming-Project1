## X = 03006740
# N = 26 + (X % 11) = 26
# M = N - 10 = 16
# 0-9, a-p and A-P

# phase 1: write the subroutine to process a single string
# pass in a hard coded string IE 123hello and make sure that subroutine
# calculates the correct value

# phase2: read a string from the user and break it up based on the /

# phase3: pass each broken up string into the subroutine from phase 1

.data
    str: .space 1002

.text 
.globl main

main:
    # get user input string
    li $v0, 8 # read string
    la $a0, str
    li $a1, 1001
    syscall

 # loop until the null terminator
main_while_loop:
    lb $t3, 0($a0)
    beq $t3, $zero, main_while_end
