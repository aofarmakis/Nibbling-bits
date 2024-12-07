module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00111100;
               01: data = 8'b00000000;
               02: data = 8'b00111000;
               03: data = 8'b00000001;
               04: data = 8'b00100000;
               05: data = 8'b00000010;
               06: data = 8'b01110000;
               07: data = 8'b01000010;
               08: data = 8'b11001101;
               09: data = 8'b00100001;
               10: data = 8'b00000000;
               11: data = 8'b00100010;
               12: data = 8'b00000001;
               13: data = 8'b00110000;
               14: data = 8'b00000010;
               15: data = 8'b00100001;
               16: data = 8'b10110010;
               17: data = 8'b11111101;
               18: data = 8'b1000xxxx;
               19: data = 8'b00100010;
               20: data = 8'b01000000;
               21: data = 8'b00000010;
               22: data = 8'b00100011;
               23: data = 8'b01010000;
               24: data = 8'b00000011;
               25: data = 8'b00100001;
               26: data = 8'b01011111;
               27: data = 8'b00000001;
               28: data = 8'b10110010;
               29: data = 8'b00100010;
               30: data = 8'b00100011;
               31: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule