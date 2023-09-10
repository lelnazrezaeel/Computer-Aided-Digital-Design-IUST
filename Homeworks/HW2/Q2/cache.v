module cache_el (	input [31:0] addres,	output reg [31:0] data,output reg hit);
	
	reg [144:0]  cache_4k [11:0];
	reg [15:0] tag;
	reg [11:0] index;
	reg [1:0] byteofset;
	reg [1:0] blockofset;	
				
			 
	always @(*)
		begin	
		byteofset <= addres[1:0];
		blockofset  <= addres [3:2];
		index <= addres[15:4];		
		tag <= addres[31:16];
		data =0;
		hit =0; 
		if(cache_4k[index][143:128] == tag && cache_4k[index][144] == 1 )
			begin
				hit =1;
				case(blockofset)
					0'b00:data <= cache_4k[index][31:0] ;
					0'b01: data <= cache_4k[index][63:32]	;
					0'b10: data <= cache_4k[index][95:64]	;
					0'b11 : data <= cache_4k[index][127:96] ;				
					endcase
		end	
		end
		
		initial
			begin
				cache_4k[8][31:0] = 10;
				cache_4k [8] [128+16] =1 ;
				cache_4k [8] [127+16:128]= 14;
				
				cache_4k[24][63:32] = 5;
				cache_4k [24] [128+16] =0 ;
				cache_4k [24] [127+16:128]= 3;
				
			end	 
			
	
	endmodule 
	
	
	module cacheel_tb;
	reg [31:0] address;
	 wire [31:0] data;
	 wire hit;
	 localparam period = 20;
	 cache_el cach (address,data,hit);
	 
	 initial
		 begin	
			 address [1:0] <=0;
			 address [3:2] <=0; 
			 address [15:4] <=8;
			 address [31:16] <= 14;
			 #period;
			 address [1:0] <=1;
			 address [3:2] <=1;
			 address [15:4] <=24;
			 address [31:16] <= 3;
			 #period;
			 
			 
			 
			 end
		
		   initial
			$monitor("address: \t addres = %b \t OUTPUT VALUE: \t data = %b hit = %b  ", address, data, hit);
								   
		endmodule 
