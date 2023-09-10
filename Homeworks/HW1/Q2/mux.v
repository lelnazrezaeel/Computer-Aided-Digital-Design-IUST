module mux(
	A, 
	q, 
	selector
);

//define variables
input [3 : 0] A;
input [1 : 0] selector;
wire [1 : 0] selectorbar;
output q;
wire [3 : 0] outp;

//not selectors
not(selectorbar[0], selector[0]);
not(selectorbar[1], selector[1]);

//implement mux
and(outp[0], A[0], selectorbar[1], selectorbar[0]);
and(outp[1], A[1], selectorbar[1], selector[0]);
and(outp[2], A[2], selector[1], selectorbar[0]);
and(outp[3], A[3], selector[1], selector[0]);
or(q, outp[0], outp[1], outp[2], outp[3]);

endmodule
