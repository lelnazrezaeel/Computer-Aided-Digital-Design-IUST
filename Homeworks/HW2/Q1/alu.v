module ALU (input [31:0] inp1,input [31:0] inp2,input [2:0] select,output reg [31:0] res);

reg [31:0] tmp1;
reg [31:0] tmp2;
reg [31:0] swap;
reg done;


wire [31:0] gcd ; 
GCD g0 (inp1,inp2,gcd);
always @(*)
begin 
	case(select) 
		3'b000 : res <= inp1+inp2;
		3'b001 : res <= inp2-inp1;
		3'b010 : res <= inp1*inp2;
 		3'b011 : res <= inp1/inp2;	
		3'b100 : res <=gcd;
		3'b101 : res <=inp1**inp2 ; 
		default : res <= inp1+inp2 ;
		endcase
  
end

endmodule



module GCD (
input [31:0] a, b,
output reg [31:0] res
);
reg [31:0] A, B, swap;
integer done;
always @(*)
begin
done = 0;
A = a; B = b;
while ( !done )
begin
if ( A < B )
begin
swap = A;
A = B;
B = swap;
end
else if ( B != 0 )
A = A - B;
else
done = 1;
end

res = A;
end



endmodule

module ALU_tb;
reg [31:0] a;
reg [31:0] b;
wire [31:0] res;
reg [2:0] s;



localparam period = 20;



ALU a0(a, b,  s,res);



initial 
begin

a = 8;
b = 4;
s = 0;
#period; 



a = 4;
b = 8;
s = 1;
#period;



a = 8;
b = 4;
s = 2;
#period;



a = 8;
b = 4;
s = 3;
#period;



a = 8;
b = 4;
s = 4;
#period;



a = 8;
b = 4;
s = 5;
#period;



end

initial
$monitor("INPUT VALUES: \t a = %b b = %b s = %b \t OUTPUT VALUE: \t res = %b", a, b, s, res);

endmodule
