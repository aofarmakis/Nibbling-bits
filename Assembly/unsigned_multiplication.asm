LDA 0x0C                    // First number
STA (0x00)                  // Save to memory location 0
LDA 0x08                    // Second number
STA (0x01)                  // Save to memory location 1

check: LDA (0x00)           // Assume the first number is the largest
       STA (0x02)           // Temporarily store it in memory location 2
       NOR 0x00             // Invert it for subtraction (1's complement)
       ADC (0x02)           // Subtract the assumed largest value
       JNC setup            // If no carry, memory location 0 is already the largest, skip the swap

swap:  LDA (0x01)           // Load the value from memory location 1
       STA (0x00)           // Store it in memory location 0
       LDA (0x02)           // Load the value from memory location 2 (original 0)
       STA (0x01)           // Store it in memory location 1

setup: LDA 0x00             // Prepare accumulator for accumulations for multiplication
       STA (0x02)           // Reset old temporary variable for swap
       LDA (0x01)           // Load in the smallest value, which we will assume is our multiplier
       JNZ multi            // If the multiplier isn't 0, continue program flow
       JMP end              // Otherwise, end program

multi: SETC 0x0             // Reset carry
       LDA (0x02)           // Load accumulation of lower half
       ADC (0x00)           // Add the multiplicand
       STA (0x02)           // Store accumulation of lower half
       LDA (0x03)           // Load accumulation of upper half
       ADC 0x00             // Add potential carry from before
       STA (0x03)           // Store accumulation of upper half
       LDA (0x01)           // Load multiplier (iteration variable)
       ADC 0x0F             // Decrement it by 1
       STA (0x01)           // Store multiplier (iteration variable)
       JNZ multi            // If applicable, re-enter loop, otherwise end program

end: LDA (0x02)             // Display lower half of multiplication
     LDA (0x03)             // Display upper half of multiplication
     HALT                   // End program