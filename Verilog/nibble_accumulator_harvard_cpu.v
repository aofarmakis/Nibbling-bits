module nibble_accumulator_harvard_cpu (reset, clk, instruction, data_in, data_out, address_out, write_to_memory, program_counter);

     input reset, clk;
     input [7:0] instruction;
     input [3:0] data_in;
     output [3:0] data_out;
     output [3:0] address_out;
     output write_to_memory;
     output reg [4:0] program_counter;

     wire [3:0] operand;
     wire zero;

     reg [3:0] accumulator;
     reg carry;

     assign address_out = instruction[3:0];
     assign data_out = accumulator;
     assign write_to_memory = (instruction[7:4] == 4'b0000);             // STA instruction here if we don't have HALT
     assign operand = (instruction[4]) ? instruction[3:0] : data_in;     // Data from data memory or literal number
     assign zero = (accumulator == 4'd0);

     always @(posedge clk) begin
          if (reset) begin
               program_counter <= 5'h00;
               accumulator <= 8'h00;
               carry <= 1'b0;
          end
          else begin
               program_counter <= program_counter + 5'h01;
               case (instruction[7:5])
                    3'b000: if (instruction[4]) program_counter <= program_counter;     // HALT (if the statement is true), otherwise STA (if the statement is false)
                    3'b001: accumulator <= operand;                                     // LDA
                    3'b010: {carry, accumulator} <= accumulator + operand + carry;      // ADC
                    3'b011: accumulator <= ~(accumulator | operand);                    // NOR
                    3'b100: carry <= instruction[4];                                    // SETC
                    3'b101: if (!zero) program_counter <= instruction[4:0];             // JNZ
                    3'b110: if (!carry) program_counter <= instruction[4:0];            // JNC
                    3'b111: program_counter <= instruction[4:0];                        // JMP
               endcase
          end
     end

endmodule