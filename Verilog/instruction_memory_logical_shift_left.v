module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00111001;
               01: data = 8'b00000000;
               02: data = 8'b00110010;
               03: data = 8'b00000001;
               04: data = 8'b10100110;
               05: data = 8'b11101111;
               06: data = 8'b1000xxxx;
               07: data = 8'b00100000;
               08: data = 8'b01000000;
               09: data = 8'b1000xxxx;
               10: data = 8'b00000000;
               11: data = 8'b00100001;
               12: data = 8'b01011111;
               13: data = 8'b00000001;
               14: data = 8'b10100110;
               15: data = 8'b00100000;
               16: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule