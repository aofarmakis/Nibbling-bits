LDA 0x0C                    // Word length (2's complement of accumulator, so don't change)
STA (0x00)                  // Save to memory location 0
LDA 0x08                    // Number to test
STA (0x01)                  // Save to memory location 1
LDA 0x00                    // Flag to determine one-hot encoding
STA (0x02)                  // Save to memory location 2

test0: LDA (0x01)           // Load number to test if it is zero first
       NOR 0x00             // Invert whole number
       ADC 0x01             // If all zeroes, adding 1 will overflow
       JNC first            // If no overflow, continue normal flow
       JMP false            // Otherwise, end program

first: LDA (0x01)           // Load number to test
       ADC (0x01)           // Shift out MSB
       STA (0x01)           // Update number under test
       LDA (0x02)           // Load flag for potential one-hot encoding
       ADC 0x00             // Add to it potential carry (MSB)
       STA (0x02)           // Update flag for potential one-hot encoding
       ADC 0x0E             // Add to it 14 (0x0E in hex)
       JNC varup            // If no overflow, go ahead with word length variable
       JMP false            // Otherwise, we don't have a one-hot encoding

varup: LDA (0x00)           // Load word length variable
       ADC 0x01             // Increment it by 1
       STA (0x00)           // Update word length variable
       JNC first            // Return to normal execution if applicable
       JMP end              // Otherwise, end program

false: LDA 0x00             // Clear accumulator
       STA (0x02)           // Store flag for one-hot encoding as false (0)
       JMP end              // Proceed to end program

end: LDA (0x02)             // Display one-hot encoding flag
     HALT                   // End program