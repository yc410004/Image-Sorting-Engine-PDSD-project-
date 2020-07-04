module BSort7(reset, load, clk, in, color_index, image_out_index, out_valid);

input reset, load, clk;
input [23:0] in;
output [1:0] color_index;
output [4:0] image_out_index;
output reg out_valid;

wire compare;
wire [28:0] X, Y;
wire [4:0] _j, _i;
wire [4:0] _k;
wire [5:0] _index;


reg [4:0] i, j, k;
reg [2:0] s;
reg [5:0] index;

reg [2:0] ns;
reg [28:0] out;
reg [28:0] A[31:0];
wire reset_j, en;
wire j30, s4, s5;

assign color_index = out[23:22];
assign image_out_index = out[28:24];
	
		
always@(posedge clk or  posedge reset)
	if(reset)
		s <= 3'd0; 
	else
		s <= ns;

always@(*)
	case (s)
	3'd0:
		ns = (index[5])? 3'd1:3'd0;
	3'd1:
		ns = 3'd2;
	3'd2:
		ns = 3'd3;
	3'd3:
		ns = (j30)? 3'd4:3'd3;
	3'd4:
		ns = (&i)? 3'd5:3'd2;
	3'd5:
		ns = (&k)? 3'd0:3'd5;
	default:
		ns = 3'd0;
	endcase
	
assign j30 = ((&j[4:1])&(~j[0]));	
assign reset_j = ((~s[2])&(s[1]^s[0]));
assign en = (~s[2])&s[1];

always @(posedge clk or posedge reset)
	if (reset)
		j <= 5'd0;
	else
		if (load)
			j <= _j;
		else 
			if (~(|s))
				j <= j;
				else
					if (reset_j)
						j <= 5'd0;
					else
						if (j30)
							j <= 5'd30;
						else 
							j <= _j;
					
					
assign _j = j + 5'd1;
assign _i = i + 5'd1;
assign _k = k + 5'd1;
assign _index = index + 6'd1;
assign s4 = (s[2]&(~s[1])&(~s[0]));
assign s5 = (s[2]&(~s[1])&s[0]);

always @(posedge clk or posedge reset)
	if (reset)
		i <= 5'd0;
	else 
		if (s4)
			i <= _i;
		else
			i <= i;
			
always @(posedge clk or posedge reset)
	if (reset)
		k <= 5'd0;
	else
		if (s5)
			begin
			k <= _k;
			out_valid <= 1'd1;
			end
		else
			begin
			k <= k;
			out_valid <= 1'd0;
			end
				

always @(posedge clk or posedge reset)
	if(reset)
		index <= 6'd0;
	else if(load)
		index <= _index;
	else index <= index;
	
	
always @(posedge clk)
	if (load)
		A[j] <= {j, in};
	else 
		if (en)
			begin
			A[j] <= X;
			A[_j] <= Y;
			end
		else A[j] <= A[j];

assign compare = (A[j][23:0] > A[_j][23:0])? 1'b1:1'b0;
SW u0(A[j], A[_j], compare, X, Y);

always@(posedge clk)
	if (s5)
		out <= A[k];
	else
		out <= 29'd0;

endmodule


module SW(A, B, comp, X, Y);
input [28:0] A, B;
input comp;
output [28:0] X, Y;
assign {X, Y} = (comp)? {B, A}:{A, B};
endmodule