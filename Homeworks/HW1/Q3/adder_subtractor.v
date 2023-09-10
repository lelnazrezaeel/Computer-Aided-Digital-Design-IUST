module adder_subtractor(
	num1, 
	num2, 
	selector, 
	sum, 
	cout
);

//define variables
input [3 : 0] num1;
input [3 : 0] num2;
input selector;
output [3 : 0] sum;
output cout;
wire [3 : 0] outp1;
wire [3 : 0] outp2;

//implement adder/subtractor
xor (outp1[0], selector, num2[0]);
xor (outp1[1], selector, num2[1]);
xor (outp1[2], selector, num2[2]);
xor (outp1[3], selector, num2[3]);
full_adder a0(selector, num1[0], outp1[0], sum[0], outp2[0]);
full_adder a1(outp2[0], num1[1], outp1[1], sum[1], outp2[1]);
full_adder a2(outp2[1], num1[2], outp1[2], sum[2], outp2[2]);
full_adder a3(outp2[2], num1[3], outp1[3], sum[3], cout);

endmodule
