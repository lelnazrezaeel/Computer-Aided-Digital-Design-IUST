`timescale 1ns / 1ps
module parking_system( 
                input clk,reset_n,
 input sensor_entrance, sensor_exit, 
 input [1:0] password_1, password_2
    );
 parameter IDLE = 3'b000, WAIT_PASSWORD = 3'b001, WRONG_PASS = 3'b010, RIGHT_PASS = 3'b011,STOP = 3'b100;
 // Moore FSM : output just depends on the current state
 reg[2:0] current_state, next_state;
 
 // Next state
 always @(posedge clk or negedge reset_n)
 begin
 if(~reset_n) 
 current_state = IDLE;
 else
 current_state = next_state;
 end
 
 // change state
// fpga4student.com FPGA projects, Verilog projects, VHDL projects
 always @(*)
 begin
 case(current_state)
 IDLE: begin
         if(sensor_entrance == 1)
 next_state = WAIT_PASSWORD;
 else
 next_state = IDLE;
 end
 WAIT_PASSWORD: begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = WRONG_PASS;
 end

 WRONG_PASS: begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = WRONG_PASS;
 end
 RIGHT_PASS: begin
 if(sensor_entrance==1 && sensor_exit == 1)
 next_state = STOP;
 else if(sensor_exit == 1)
 next_state = IDLE;
 else
 next_state = RIGHT_PASS;
 end
 STOP: begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = STOP;
 end
 default: next_state = IDLE;
 endcase
 end
 

endmodule
