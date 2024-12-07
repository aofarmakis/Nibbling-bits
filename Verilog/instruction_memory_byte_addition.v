module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00110101;
               01: data = 8'b00000000;
               02: data = 8'b00110100;
               03: data = 8'b00000001;
               04: data = 8'b00110001;
               05: data = 8'b00000010;
               06: data = 8'b00111111;
               07: data = 8'b00000011;
               08: data = 8'b1000xxxx;
               09: data = 8'b00100000;
               10: data = 8'b01000001;
               11: data = 8'b00000100;
               12: data = 8'b00100010;
               13: data = 8'b01000011;
               14: data = 8'b00000101;
               15: data = 8'b00110000;
               16: data = 8'b01010000;
               17: data = 8'b00000110;
               18: data = 8'b00100100;
               19: data = 8'b00100101;
               20: data = 8'b00100110;
               21: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule