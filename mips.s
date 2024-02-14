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

    # print the return value of process_substring which is in $v0
    # temporarily save of $a0 so we can use it for printing
    add $s7, $a0, $zero
    add $a0, $v0, $zero
    li $v0, 1
    syscall
    # print a separator character
    li $v0, 11
    li $a0, '/'
    syscall
    # restore $a0
    add $a0, $s7, $zero

    # after the call to process substring, restore the stack, advance the string pointer by 1, and repeat
    addi $sp, $sp, 4
    addi $a0, $a0, 1
    j main_while_loop

    main_while_end:
    # quit the program
    li $v0, 10
    syscall

# takes string address via stack
# returns calculated value in $v0
# 'A' = 65/0x41
# 'Z' = 90/0x5A
process_substring:
    # load the pointer to the address on the stack into $s0
    lw $s0, 0($sp)
     # init $v0 to 0
    add $v0, $zero, $zero 
# start of loop
ps_while_loop:
    # load the byte at the pointer into $s1
    lb $s1, 0($s0)
    # if character is null then break out of loop
    beq $s1, $zero, ps_end_while
    # if character is uppercase, convert it to lowercase, use $t0 and $t1 for this
    li $t1, 'A'
    bge $s1, $t1, upper_test_2
    j not_upper
upper_test_2:
    li $t1, 'Z'
    ble $s1, $t1, is_upper
    j not_upper
is_upper:
    addi $s1, $s1, 32 
not_upper:
    # if character >= '0' and <= '9'
    li $t1, '0'
    bge $s1, $t1, char_2
    j next_symbol
char_2:
    li $t1, '9'
    ble $s1, $t1, is_num
    j not_num
    #    convert character to a num and add to sum
is_num:
    addi $s1, $s1, -48
    add $v0, $v0, $s1
    j next_symbol
not_num:    
    # else if character >= 'a' and <= 'p'
    li $t1, 'a'
    bge $s1, $t1, letter_2
    j next_symbol