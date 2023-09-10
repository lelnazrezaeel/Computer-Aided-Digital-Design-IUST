
module ALU (a, b , s, out);
input [31 : 0] a, b;
input s;
output reg [31 : 0] out;
integer w1, w2;
kmm k0(a, b, w1);
always @*
begin
    w2 = $clog2(a);
    if (s == 0)begin
    out = w1;
    end
    else if (s == 1)begin
    out = w2;
    end
end
endmodule


module bmm(a, b, out);
input [31 : 0] a, b;
output integer out;
reg A, B , Found;
reg i;
always @()
begin
    i = 1;
    A = a;
    B = b;
    while ( i<=a && i<=b )
    begin
    if ( A%i==0 && B%i==0 )
    begin
        Found=i;
    end
    i = i + 1;
    end
    out = Found;
end
endmodule


module kmm(a, b, out);
input [31 : 0] a, b;
output integer out;
integer gcd;
bmm a0(a, b, gcd);
always @()
begin

out = (a * b) / gcd;

end
endmodule
.
.
.
.
.
.
.
.
.
.
.
module GCD  (
   input [31:0] a, b,
   output reg [31:0] res
  );
   reg [31:0] A, B, swap;
   integer done;
   always @()
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

module MUL( 
   output reg [31:0] res, 
   input [31:0] a,
   input [31:0] b
);
    always @(a, b)
        res = a b;

endmodule

module ALU(a, b, select, res);
  input [7:0] a, b;
  input select;
  output [7:0] res; 
  wire [7:0] gcd, mul, lcm;

  reg [7:0] out;

  GCD gcdCal(.a(a), .b(b), .res(gcd));
  mul = a * b; 
  lcm = mul / gcd;

  case(select)
    1'b0: res = $clog2(in);
    1'b1: res = lcm;
  endcase;




endmodule