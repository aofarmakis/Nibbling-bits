module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00110101;
               01: data = 8'b00000000;
               02: data = 8'b00110000;
               03: data = 8'b00000001;
               04: data = 8'b00110001;
               05: data = 8'b00000010;
               06: data = 8'b00100000;
               07: data = 8'b10101001;
               08: data = 8'b11110111;
               09: data = 8'b00100001;
               10: data = 8'b1000xxxx;
               11: data = 8'b01000010;
               12: data = 8'b00000011;
               13: data = 8'b00100010;
               14: data = 8'b00000001;
               15: data = 8'b00100011;
               16: data = 8'b00000010;
               17: data = 8'b00100000;
               18: data = 8'b1000xxxx;
               19: data = 8'b01011111;
               20: data = 8'b00000000;
               21: data = 8'b10101001;
               22: data = 8'b11110111;
               23: data = 8'b00100001;
               24: data = 8'b00100010;
               25: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule