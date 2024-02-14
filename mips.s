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

    # save the pointer to the start of the string on the stack
    # move stack pointer to make room on stack for string address
    sub $sp, $sp, 4
    # store the address on the stack
    sw $a0, 0($sp)

    # increment string pointer by 1 and search for a / and replace with a null terminator
slash_loop:    
    addi $a0, $a0, 1
    li $t3, '/'
    lb $t4, 0($a0)
    beq $t3, $t4, add_null_term
    li $t3, 10 #newline character
    lb $t4, 0($a0)
    beq $t3 $t4, add_null_term
    j slash_loop


add_null_term:
    # once we reach here, we are at the '/' or a newline so replace it with a null terminator
    sb $zero, 0($a0)

    # at this point the pointer to the start of the string is on the top of the stack
    # and we have changed the / to a null terminator
    jal process_substring
