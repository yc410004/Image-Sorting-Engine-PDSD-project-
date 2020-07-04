module CLA (SUM, ADD, clk, reset, reset_add);

input [7:0] ADD;
input clk, reset, reset_add;
output[21:0] SUM;
wire  Cin;
reg [21:0] A, B;

assign Cin = 1'b0;

CLA24 CLA0(SUM, A, B, Cin);

always@(posedge clk or posedge reset)
	if(reset)
		begin
		A <= 22'd0;
		B <= 22'd0;
		end
	else if(reset_add)
		begin 
		A <= 22'd0;
		B <= 22'd0;
		end
	else
		begin
		A <= {14'd0, ADD};
		B <= SUM;
		end

endmodule

`include"CLA_24.v"