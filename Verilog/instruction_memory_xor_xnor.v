module instruction_memory_fibonacci (address, data);

     input [4:0] address;
     output reg [7:0] data;

     always @(address) begin
          case(address)
               00: data = 8'b00110101;
               01: data = 8'b00000000;
               02: data = 8'b00110011;
               03: data = 8'b00000001;
               04: data = 8'b01100000;
               05: data = 8'b00000010;
               06: data = 8'b01100000;
               07: data = 8'b00000011;
               08: data = 8'b00100010;
               09: data = 8'b01100001;
               10: data = 8'b01100011;
               11: data = 8'b00000010;
               12: data = 8'b01100010;
               13: data = 8'b00000011;
               14: data = 8'b00100010;
               15: data = 8'b00100011;
               16: data = 8'b0001xxxx;
               default: data = 8'b00;
          endcase
     end

endmodule