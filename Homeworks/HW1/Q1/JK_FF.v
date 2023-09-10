module JK_FF(
	j, 
	k, 
	clk, 
	q, 
	qnot
);

input j, k, clk;
output q, qnot;

wire out1;
wire out2; 

nand(out1, j, clk, qnot);
nand(out2, k, clk, q);
nand(q, qnot, out1);
nand(qnot, q, out2);

endmodule