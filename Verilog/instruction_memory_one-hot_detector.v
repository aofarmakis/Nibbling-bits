module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00111100;
               01: data = 8'b00000000;
               02: data = 8'b00111000;
               03: data = 8'b00000001;
               04: data = 8'b00110000;
               05: data = 8'b00000010;
               06: data = 8'b00100001;
               07: data = 8'b01110000;
               08: data = 8'b01010001;
               09: data = 8'b11001011;
               10: data = 8'b11111001;
               11: data = 8'b00100001;
               12: data = 8'b01000001;
               13: data = 8'b00000001;
               14: data = 8'b00100010;
               15: data = 8'b01010000;
               16: data = 8'b00000010;
               17: data = 8'b01011110;
               18: data = 8'b11010100;
               19: data = 8'b11111001;
               20: data = 8'b00100000;
               21: data = 8'b01010001;
               22: data = 8'b00000000;
               23: data = 8'b11001011;
               24: data = 8'b11111100;
               25: data = 8'b00110000;
               26: data = 8'b00000010;
               27: data = 8'b11111100;
               28: data = 8'b00100010;
               29: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule