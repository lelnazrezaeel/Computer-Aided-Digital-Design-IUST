`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:41 05/06/2022 
// Design Name: 
// Module Name:    detector 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module detector(
        input wire i,
        input wire clk,
        output o
    );

localparam [2:0] 
    lambda = 0,
    got1 = 1,
    got10 = 2,
    got101 = 3,
    got1011 = 4;

reg [2:0] current;

initial begin
    current = lambda;
end

always @(posedge clk) begin
    case (current)
        lambda: begin
            if(i == 0) current <= lambda;
            else current <= got1;
        end 
        got1: begin
            if(i == 1) current <= got1;
            else current <= got10;
        end
        got10: begin
            if(i == 1) current <= got101;
            else current <= lambda;
        end
        got101: begin
            if(i == 1) current <= got1011;
            else current <= got10;
        end
        got1011: begin
            if(i == 1) current <= got1;
            else current <= got10;
        end
        default: current <= lambda;
    endcase
end

assign o = (current == got1011) ? 1 : 0;

endmodule
