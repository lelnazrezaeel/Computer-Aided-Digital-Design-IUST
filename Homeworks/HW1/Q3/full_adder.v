module full_adder(
	cin, 
	num1, 
	num2, 
	sum, 
	cout
);

//define variables
input cin, num1, num2;
output sum, cout;
wire outp1, outp2, outp3;

//implement full adder
xor (outp1, num1, num2);
and (outp2, num1, num2);
and (outp3, outp1, cin);
xor (sum, outp1, cin);
or (cout, outp3, outp2);

endmodule
