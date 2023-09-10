module final(
	a, 	
	b, 
	c, 
	d, 
	f
);

//define variables
input a, b, c, d;
wire abar, bbar;
output f;
wire [2 : 0] outp1;
wire [7 : 0] outp2;
//implement circuit
not(abar, a);
not(bbar, b);
dec a0(
	.A({abar, a, bbar}),
	.q(outp2),
	.enable(bbar)
);
enc a1(
	.A(outp2),
	.q(outp1),
	.enable(bbar)
);
mux a2(
	.A({1'b1, outp1[0], outp1[1], outp1[2]}),
	.q(f), 
	.selector({c,d})
);

endmodule
