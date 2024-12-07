LDA 0x00                    // Initialize the accumulator to 0
STA (0x00)                  // Save to memory location 0
STA (0x01)                  // Accumulator value will temporarily use memory location 1

loop: LDA (0x01)            // Load the current value of the accumulator
      ADC 0x01              // Increment by 1
      ADC (0x00)            // Add the value in memory location 0x00
      STA (0x01)            // Store the new accumulator value back to memory
      SETC 0x0              // Reset carry so that it doesn't affect next counts
      JNZ loop              // If no overflow, continue counting
      LDA (0x00)            // If we finally see 0, load memory location 0
      ADC 0x01              // Increment it by 1
      SETC 0x0              // Reset carry so that it doesn't affect next counts
      STA (0x00)            // Store the incremented value back to memory
      JMP loop              // Restart the counting process
