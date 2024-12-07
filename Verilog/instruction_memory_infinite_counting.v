module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00110000;
               01: data = 8'b00000000;
               02: data = 8'b00000001;
               03: data = 8'b00100001;
               04: data = 8'b01010001;
               05: data = 8'b01000000;
               06: data = 8'b00000001;
               07: data = 8'b1000xxxx;
               08: data = 8'b10100011;
               09: data = 8'b00100000;
               10: data = 8'b01010001;
               11: data = 8'b1000xxxx;
               12: data = 8'b00000000;
               13: data = 8'b11100011;
               default: data = 8'b00;
          endcase
     end

endmodule