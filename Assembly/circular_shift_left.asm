LDA 0x09       // Set up number to be shifted left circularly
STA (0x00)     // Save to memory location 0
LDA 0x02       // Set up shift amount
STA (0x01)     // Save to memory location 1

start: JNZ compute     // If not zero, start computing
       JMP end         // Otherwise, end program

compute: SETC 0x0      // Reset carry
         LDA (0x00)    // Load number
         ADC (0x00)    // Add to self (so far logical shift left)
         ADC 0x00      // Add the carry for the circular shift
         STA (0x00)    // Update number that was shifted
         LDA (0x01)    // Load shift amount variable
         ADC 0x0F      // Decrement it by 1
         STA (0x01)    // Update the shift amount
         JNZ compute   // If not zero, continue computing

end: LDA (0x00)        // Display final result
     HALT              // End program