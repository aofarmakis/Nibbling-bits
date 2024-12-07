// XNOR -> (A ^ B)' =  (((A + B)' + A)' + ((A + B)' + B)')'
// XOR  ->  A ^ B   = ((((A + B)' + A)' + ((A + B)' + B)')')'

LDA 0x05       // Set up first number
STA (0x00)     // Save to memory location 0
LDA 0x03       // Set up second number
STA (0x01)     // Save to memory location 1

NOR (0x00)     // Produce (A + B)'
STA (0x02)     // Save temporarily to memory location 2
NOR (0x00)     // Produce ((A + B)' + A)'
STA (0x03)     // Save temporarily to memory location 3
LDA (0x02)     // Reload (A + B)'
NOR (0x01)     // Produce ((A + B)' + B)'
NOR (0x03)     // Produce XNOR using accumulator and memory location 3
STA (0x02)     // Store XNOR at memory location 2
NOR (0x02)     // Produce XOR by inverting with self
STA (0x03)     // Store XOR

LDA (0x02)     // Display XNOR
LDA (0x03)     // Display XOR
HALT           // End program