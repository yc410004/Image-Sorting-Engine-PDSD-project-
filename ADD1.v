module ADD1(SUM, ADD, clk, reset, reset_add);

input ADD;
input clk, reset, reset_add;

output[14:0] SUM;
reg [14:0] A;
reg B;

ADD1_14 ADD1(A, B, SUM);

always@(posedge clk or posedge reset)
	if(reset)
		begin
		A <= 15'd0;
		B <= 1'd0;
		end
	else if(reset_add)
		begin
		A <= 15'd0;
		B <= 1'd0;
		end
	else
		begin
		A <= SUM;
		B <= ADD;
		end

endmodule

`include"ADD1_14.v"