module queue(
	inout unsigned[7:0] data,
	input read, write
);
reg unsigned[8:0] m [15:0];
integer i ,max;
reg unsigned[7:0] data1, max_data;
reg hitw,hitr;
reg[7:0] data_reg;
always @(*)
	begin
		data1 = data;
		hitw=0;
		hitr=0;
		max=0;			  
		if(write)
			begin
				for (i=0 ; i < 16; i=i+1)
					begin
						if(!hitw)
							if(!mem[i][8]) 
								begin
									m[i][7:0]<=data1;
									m[i][8]<=1'b1;
									hitw=1;
								end
					end
			end
		if(read)
			begin
				for (i=0 ; i < 16; i=i+1)
					begin
						if(!hitr)
							begin	
		 						if(m[i][8])
		 							begin
										max_data=m[i][7:0];
										max=i;				
		 							end	
							end
								else if(m[i][8])
									begin
										if(m[i][7:0]>max_data)
											begin
												max_data=m[i][7:0];
												max=i;
											end
									end
					end
				m[max][8] = 0;
				data_reg = max_data;
			end
	end
	assign data = data_reg;
endmodule

module queue_tb;
	reg enq;
	reg deq;
	wire unsigned [7:0] inw;
	reg unsigned [7:0] in;
	assign inw=in;
	queue uut (
		.write(enq), 
		.read(deq), 
		.data(inw)
	);
	initial begin
		enq = 0;
		deq = 0;
		in = 0;
		#10;
		enq = 1;
		deq = 0;
		in = 2;
		#10;
		enq = 1;
		deq = 0;
		in = 5;
		#10;
		enq = 1;
		deq = 1;
		in = 10;
		#10;
		enq = 1;
		deq = 0;
		in = 0;
		#10;
	end
endmodule
