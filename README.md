# MIPS-Programming-Project1
# Description:
# Assume your Howard ID as a decimal integer is X. Let N = 26 + (X % 11) where % is the modulo
# operation, and M = N – 10.
# You will write a MIPS program that reads a string of up to 1000 characters (excluding the trailing carriage return and null character) from user input.
 # With single slash (/) as the delimiter, split the input string into multiple substrings (with the slash removed). If there is no slash in the input, the whole input string is considered a substring referred to below.
 # For each substring, Pick the characters from '0' to '9' and from 'a' to β and from 'A' to Δ. β stands for the Mth lower case letter and Δ stands for the M-th upper case letter in the English alphabet, where M is as defined at the beginning of the description. Consider each such character as a base-N digit and calculate the sum. The sum is "-" if there are no such characters. In a base-N number, both 'a' and 'A' correspond to the decimal integer of 10, both 'b' and 'B' to 11, and so on, and both β and Δ correspond to N – 1.
# Output the calculated sum. If there are multiple substrings, the output for the substrings should be separated by two spaces with a single slash in between, for example, "2 / 3 / 4". The program must exit after processing one single user input. The processing of the whole input string must be done in a subprogram labelled as process_whole_string. The main program must call process_whole_string and pass the string address into it via the register $a0. The subprogram parses the string and prints the output as described above. No return value is necessary from the subprogram. When processing each substring, process_whole_string must call another subprogram labelled as process_substring, where the substring address is passed into process_substring via the stack, and the sum of the substring isreturned to Subprogram A via the register $v0.
# Sample test cases (assuming the Howard ID is 12345678):
# 12345678 % 11 = 4, therefore the base is 26 + 4 = 30, β is 't' and Δ is 'T'.
# Input: C
# Output: 12
# Input: 0/1/2/A/b/T/t/Z/?
# Output: 0 / 1 / 2 / 10 / 11 / 29 / 29 / - / -
# Input: a0 / 123 / 0Ab9
# Output: 10 / 6 / 30
# Input: 1 0 / xyz!/2.3.4/ @!A t$ //
# Output: 1 / - / 9 / 39 / - / -
# Requirements: 
# The program must be able to run correctly under QtSpim.
# The program must be named as mips.s.
# The output must have the exact format as specified above. No other messages or promptsshould be printed except the numbers and the error messages.
# The subprograms must be labelled properly as required.
# All development must be done with Github. A brand new Github repo dedicated to this project
must be used.
# Specifically, there MUST BE ONE COMMIT for EVERY (or fewer for the last) five lines of new or modified MIPS code (excluding empty lines, and lines with only comment/directives/labels). More frequent commit is fine. With each commit, the commit message must explain the purpose of the added/changed code. Commits must be made while the program is being developed. Commits done afterwards are NOT ACCETPABLE.
# Submissions not fully meeting the above requirements will lose significant portion (≥ 70%) of the credits.
# Syntax error or program terminating abnormally without output will result in zero credits. If the program freezes during execution, a large number of points will be deducted. Therefore, make sure to test your program thoroughly before submission.
