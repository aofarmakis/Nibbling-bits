LDA 0x05               // Iterations to run recursion
STA (0x00)             // Save to memory location 0
LDA 0x00               // First term
STA (0x01)             // Save to memory location 1
LDA 0x01               // Second term
STA (0x02)             // Save to memory location 2

start: LDA (0x00)      // Load iterations variable
       JNZ compute     // If not zero, start computing
       JMP end         // Otherwise, end program

compute: LDA (0x01)    // Load first term
         SETC 0x0      // Reset carry
         ADC (0x02)    // Add second term
         STA (0x03)    // Store sum termporarily
         LDA (0x02)    // Load old second term
         STA (0x01)    // Overwrite it with old first term
         LDA (0x03)    // Load old first term
         STA (0x02)    // Overwrite it with the sum from before
         LDA (0x00)    // Load iterations variable
         SETC 0x0      // Reset carry
         ADC 0x0F      // Decrement it by 1
         STA (0x00)    // Store the new iterations variable
         JNZ compute   // If not zero, continue computing
         JMP end       // Otherwise, end program

end: LDA (0x01)        // Display first term (modulo 16)
     LDA (0x02)        // Display second term (modulo 16)
     HALT              // End program