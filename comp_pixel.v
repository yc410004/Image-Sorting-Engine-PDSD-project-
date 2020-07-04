module comp_pixel(R, G, B, sel);
input [14:0] R, G, B;
output [1:0] sel;
wire c0, c1, c2;

assign c0 = (R>=G)? 1'b1:1'b0;
assign c1 = (R>=B)? 1'b1:1'b0;
assign c2 = (G>=B)? 1'b1:1'b0;

assign sel[1] = (~((c1|c2)&(c0|c2)))|((~c1)&(c0));
assign sel[0] = (c2&(~c1))|(c1&(~c0));

endmodule