`timescale 1ns / 1ps
module vendingmachine(
    input [2:0] x,
    input rst,
    input clk,
    output reg [2:0] change,
    output reg [1:0] drink
    );

	reg current;
	
	always @(posedge clk) begin
		if (rst) 
		begin
			current <= 0;
			change = 3'b000;
			drink = 2'b00;
		end
		else case (current)
			0:
				if (x == 3'b000) 
				begin
					current <= 0;
					change = 3'b000;
					drink = 2'b00;
				end
				else if (x == 3'b001) 
				begin
					current <= 1;
					change = 3'b000;
					drink = 2'b00;
				end
				else if (x == 3'b010)
				begin
					current <= 0;
					change = 3'b000;
					drink = 2'b01;
				end
				else
				begin
					current <= 0;
					change = 3'b001;
					drink = 2'b10;
				end
			1:
				if (x == 3'b000) 
				begin
					current <= 1;
					change = 3'b000;
					drink = 2'b00;
				end
				else if (x == 3'b001) 
				begin
					current <= 0;
					change = 3'b000;
					drink = 2'b01;
				end
				else if (x == 3'b010)
				begin
					current <= 0;
					change = 3'b001;
					drink = 2'b01;
				end
				else
				begin
					current <= 0;
					change = 3'b000;
					drink = 2'b11;
				end			
		endcase
	end

endmodule

