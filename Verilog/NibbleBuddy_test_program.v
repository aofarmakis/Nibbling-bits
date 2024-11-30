module NibbleBuddy_test_program ();

     reg reset, clk;
     wire [7:0] instruction;
     wire [3:0] data_in;
     wire [3:0] data_out;
     wire [3:0] address;
     wire write;
     wire [4:0] program_counter;

     NibbleBuddy processor (reset, clk, instruction, data_in, data_out, address, write, program_counter);

     initial begin
          reset = 1'b1;
          clk = 1'b1;
          #5;
          reset = 1'b0;
          #5;
          clk = 1'b0;
          repeat (50) begin
               #10;
               clk = 1'b1;
               #10;
               clk = 1'b0;
          end
     end

endmodule