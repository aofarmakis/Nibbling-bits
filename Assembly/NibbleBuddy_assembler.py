# Usage: in the terminal, write "python NibbleBuddy_assembler.py [file name or path]"

import sys
import os

# Converts decimal to an 8-bit unsigned binary value
def dec2bin8(d, linenum):
    try:
        if d < 0 or d > 31:
            raise ValueError("Address out of range (0-31).")
        binary = format(d, '05b')
    except ValueError as e:
        print(f"Error on line {linenum}: {e}")
        sys.exit()
    return binary

# Converts decimal to a 4-bit unsigned binary value
def dec2bin4(d, linenum):
    try:
        if d < 0 or d > 15:
            raise ValueError("Value out of range (0-15).")
        binary = format(d, '04b')
    except ValueError as e:
        print(f"Error on line {linenum}: {e}")
        sys.exit()
    return binary

# Parses numbers in decimal or hexadecimal
def parse_number(value, linenum):
    try:
        if value.startswith("0x"):  # Hexadecimal
            return int(value, 16)
        else:  # Decimal
            return int(value)
    except ValueError:
        print(f"Error on line {linenum}: Invalid number format '{value}'.")
        sys.exit()

# Tokenizes the input assembly file
def tokenize(file):
    tokens = []
    with open(file, 'r') as f:
        for linenum, line in enumerate(f, 1):
            # Remove comments starting with ';' or '//'
            line = line.split(';')[0].split('//')[0]
            line = line.strip()  # Remove leading/trailing whitespace
            
            if line:  # Skip blank lines
                tokens.append((linenum, line.lower().split()))
    return tokens

# Pass 1: Label mapping
def pass1(tokens):
    labels = {}
    address = 0
    label_count = 0  # Track label enumeration for offset adjustment
    for linenum, line in tokens:
        if line[0].endswith(':'):  # Label definition
            label = line[0][:-1]
            if label in labels:
                print(f"Error on line {linenum}: Label '{label}' already defined.")
                sys.exit()
            labels[label] = address + label_count  # Increment by enumerated value
            label_count += 1  # Increment label enumeration
        else:
            address += 1  # Increment address for each instruction
    return labels

# Pass 2: Convert instructions to binary
def pass2(tokens, labels):
    machine_code = []
    address_counter = 0  # Tracks current instruction address

    for linenum, line in tokens:
        # Handle labels: remove the label and process the rest of the line
        label = None
        if line[0].endswith(':'):  # This is a label
            label = line[0]  # Keep the label as is (preserve case)
            line = line[1:]  # Skip the label part (we process the rest)
            if not line:  # If there's nothing after the label, continue
                continue

        # Capitalize only the instruction (first word in line) and leave operands and labels as they are
        instruction = line[0].upper()  # Capitalize the instruction keyword
        operands = line[1:]  # The operands (remain as they are)
        binary = ""

        # Encode each instruction
        if instruction == "HALT":
            binary = "0001XXXX"
        elif instruction == "STA":
            if line[1].startswith("(") and line[1].endswith(")"):  # Direct addressing mode
                value = parse_number(line[1][1:-1], linenum)  # Strip parentheses and parse number
            else:
                print(f"Error on line {linenum}: 'STA' requires direct addressing mode using parentheses.")
                sys.exit()
            binary = "0000" + dec2bin4(value, linenum)
        elif instruction in ["LDA", "ADC", "NOR"]:
            opcode_map = {"LDA": "001", "ADC": "010", "NOR": "011"}
            opcode = opcode_map[instruction]
            if line[1].startswith("(") and line[1].endswith(")"):  # Direct addressing mode
                mode = "0"
                value = parse_number(line[1][1:-1], linenum)  # Strip parentheses and parse number
            else:  # Immediate addressing mode
                mode = "1"
                value = parse_number(line[1], linenum)
            binary = opcode + mode + dec2bin4(value, linenum)
        elif instruction == "SETC":
            value = parse_number(line[1], linenum)  # Parse the operand as a number
            if value == 1:  # Set the carry flag
                carry = "1"
            elif value == 0:  # Reset the carry flag
                carry = "0"
            else:
                print(f"Error on line {linenum}: 'SETC' accepts only 1 (0x1) or 0 (0x0).")
                sys.exit()
            binary = "100" + carry + "XXXX"
        elif instruction in ["JNZ", "JNC", "JMP"]:
            opcode_map = {"JNZ": "101", "JNC": "110", "JMP": "111"}
            if line[1].startswith("(") and line[1].endswith(")"):  # Direct address
                address = parse_number(line[1][1:-1], linenum)
            elif line[1] in labels:  # Label-based jump
                address = labels[line[1]]
            else:
                print(f"Error on line {linenum}: Invalid jump address or label '{line[1]}'.")
                sys.exit()
            binary = opcode_map[instruction] + dec2bin8(address, linenum)
        else:
            print(f"Error on line {linenum}: Unknown instruction '{instruction}'.")
            sys.exit()

        # Replace 'X' with 'x' in the binary string
        binary = binary.replace('X', 'x')
        machine_code.append(binary)
        address_counter += 1  # Increment for each instruction

    return machine_code

# Main function
def main(argv):
    if len(argv) < 2:
        print("Usage: python assembler.py <assembly_file>")
        sys.exit()

    input_file = argv[1]

    # Tokenize the input file
    tokens = tokenize(input_file)

    # Execute Pass 1 to map labels
    labels = pass1(tokens)

    # Execute Pass 2 to generate machine code
    machine_code = pass2(tokens, labels)

    # Ask the user whether to output to terminal or file
    choice = input("Output to terminal (T) or file (F)? ").strip().lower()
    if choice == 't':
        for address, code in enumerate(machine_code):
            print(f"{address:02}: {code}")
    elif choice == 'f':
        output_file = os.path.splitext(input_file)[0] + "_output.txt"
        with open(output_file, 'w') as f:
            for address, code in enumerate(machine_code):
                f.write(f"{address:02}: {code}\n")
        print(f"Machine code written to {output_file}")
    else:
        print("Invalid choice. Exiting.")

# Entry point
if __name__ == "__main__":
    main(sys.argv)
