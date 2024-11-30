module instruction_memory (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
                0: data = 8'b010_1_0001;     // ADC 0x01
                1: data = 8'b101_0_0000;     // JNZ (0x00)
                2: data = 8'b011_1_0000;     // NOR 0x00
                3: data = 8'b000_0_1000;     // STA (0x08)
                4: data = 8'b111_0_1000;     // JMP (0x08)
                5: data = 8'b011_0_1111;     // NOR (0x0F)
                6: data = 8'b001_0_1000;     // LDA (0x08)
                7: data = 8'b111_0_1101;     // JMP (0x0D)
                8: data = 8'b100_0_xxxx;     // SETC 0
                9: data = 8'b110_0_0101;     // JNC (0x05)
               13: data = 8'b000_1_xxxx;     // HALT
               default: data = 8'b00;
          endcase
     end

endmodule