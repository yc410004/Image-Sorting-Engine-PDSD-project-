module Divider(clk, reset, div_start, intensity, pixel, div_complete, quotient, color);

input [21:0] intensity;
input [14:0] pixel;
input [1:0] color;
input clk, div_start, reset;
output [23:0] quotient;
output reg  div_complete;

reg [35:0] DIVD; 
reg [35:0] DIVN; 
reg [23:0] quotient_;
reg [4:0] div_count;
reg [1:0]cs, ns;
wire valid;

	
always@(*)
	case(cs)
		2'd0:  
			begin
			div_complete = 1'd0;
			ns = (div_start)? 2'd1:2'd0;
			end
		2'd1:
			begin
			div_complete = 1'd0;
			if(valid)
				ns = 2'd2;
			else
				ns = 2'd1;
			end
		2'd2:
			begin
			div_complete = 1'd1;
			ns = 2'd3;
			end
		2'd3: 
			begin
			div_complete = 1'd0;
			ns = (div_start)? 2'd1:2'd3;
			end
		default : 
			begin
			div_complete = 1'd0;
			ns = 2'd0;
			end
	endcase

always@(posedge clk or posedge reset)
	if(reset)
		cs <= 2'd0;
	else
		cs <= ns;
		
assign valid = ~(|div_count);

		
assign quotient = quotient_;
always@(posedge clk or posedge reset) 
	if(reset)
		begin
		DIVD <= 36'd0;
		DIVN <= 36'd0;
		div_count <= 5'd0;
		end
    else if(div_start)
      begin 
		DIVD <= {intensity,14'd0};
		DIVN <= {pixel,21'd0};
        div_count <= 5'd21;                                                                                            
        quotient_ <= {color, 22'd0};
      end
    else if(~valid)
		begin 
		DIVN  <= DIVN >> 1;
        div_count <= div_count - 5'd1;
			if(DIVD >= DIVN)
				begin
					quotient_[div_count] <= 1'b1;
					DIVD <= DIVD - DIVN;
				end
			else
				DIVD <= DIVD;
		end

endmodule
	
