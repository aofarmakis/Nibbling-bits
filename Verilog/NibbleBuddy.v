module NibbleBuddy (reset, clk, instruction, data_in, data_out, address, write, program_counter);

     input reset, clk;
     output [7:0] instruction;
     output [3:0] data_in;
     output [3:0] data_out;
     output [3:0] address;
     output write;
     output [4:0] program_counter;

     nibble_accumulator_harvard_cpu CPU (reset, clk, instruction, data_in, data_out, address, write, program_counter);
     instruction_memory IMem (program_counter, instruction);
     data_memory DMem (reset, clk, address, write, data_out, data_in);

endmodule
