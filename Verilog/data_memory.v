module data_memory (reset, clk, address, write, data_in, data_out);

     input reset, clk;
     input write;
     input [3:0] address;
     input [3:0] data_in;
     output [3:0] data_out;

     reg [3:0] memory [15:0];

     assign data_out = (!write) ? memory[address] : 4'b0000;

     integer i;
     always @(posedge clk) begin
          if (reset) begin
               for (i = 0; i < 16; i = i + 1) begin
                    memory[i] <= 0;
               end
          end
          else if (write) memory[address] <= data_in;
     end

endmodule