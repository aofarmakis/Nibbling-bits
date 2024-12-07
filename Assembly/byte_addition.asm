// First number:  Memory locations 0 (low nibble) and 1 (high nibble)
// Second number: Memory locations 2 (low nibble) and 3 (high nibble)
// Sum:           Memory locations 4 (low nibble) and 5 (high nibble)
// Carry:         Memory location 6

LDA 0x05       // Set up first number (low nibble)
STA (0x00)     // Save to memory location 0
LDA 0x04       // Set up first number (high nibble)
STA (0x01)     // Save to memory location 1
LDA 0x01       // Set up second number (low nibble)
STA (0x02)     // Save to memory location 2
LDA 0x0F       // Set up second number (high nibble)
STA (0x03)     // Save to memory location 3

SETC 0x0       // Reset carry for normal addition first
LDA (0x00)     // Load first number's low nibble
ADC (0x01)     // Add to it second number's low nibble
STA (0x04)     // Store partial result (low nibble of sum)
LDA (0x02)     // Load first number's high nibble
ADC (0x03)     // Add to it second number's high nibble
STA (0x05)     // Store partial result (high nibble of sum)
LDA 0x00       // Clear accumulator
ADC 0x00       // Add to it potential carry
STA (0x06)     // Store partial result (carry)

LDA (0x04)     // Display low nibble of sum
LDA (0x05)     // Display high nibble of sum
LDA (0x06)     // Display carry
HALT           // End program