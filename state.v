module State(clk, reset, image_index, reset_add, div_start, busy);

input clk, reset;
input [4:0] image_index;
output reset_add, div_start, busy;

wire [14:0] count_pixel;
reg [2:0] ns;
reg [2:0] cs;
wire reset_ADD1, ADD;
wire pixel_end;
wire image_end;

always@(*)
	case(cs)
		3'd0 : ns = 3'd1;
		3'd1 : if(pixel_end)
					if(image_end)
						ns = 3'd4;
					else
						ns = 3'd2;
			   else
				ns = 3'd1;
		3'd2 : ns = 3'd3;
		3'd3 : ns = 3'd0;
		3'd4 : ns = 3'd5;
		3'd5 : ns = 3'd5;
		default : ns = 3'd1;
	endcase


always@(posedge clk or posedge reset)
	if(reset)
		cs <= 3'd0; 
	else
		cs <= ns;
		
assign busy = (cs[2]|cs[1]|(~cs[0]))? 1'd1: 1'd0;		
assign reset_add = ~(|cs);			
assign image_end = (pixel_end&(&image_index))? 1'd1: 1'd0;
or (reset_ADD1, reset_add, reset);
assign ADD = ~((cs[2]|cs[0])&(cs[2]|cs[1])&(cs[1]|cs[0]));

ADD1 add(count_pixel, ADD, clk, reset, reset_ADD1); 

assign pixel_end = (&count_pixel[13:0])? 1'b1: 1'b0; 
assign div_start = ((count_pixel[14])&(~count_pixel[0]))? 1'b1: 1'b0; 

endmodule