module compare_intensity(pixel_in, sel, R_intensity, G_intensity, B_intensity);
input [23:0] pixel_in;
output [2:0] sel;
output [7:0] R_intensity, G_intensity, B_intensity;
wire c0, c1, c2;
wire [7:0] R, G, B;

assign R = pixel_in[23:16];
assign G = pixel_in[15:8];
assign B = pixel_in[7:0];

assign c0 = (R>=G)? 1'b1:1'b0;
assign c1 = (R>=B)? 1'b1:1'b0;
assign c2 = (G>=B)? 1'b1:1'b0;

assign sel[0] = c1&c0;
assign sel[1] = c2&(~c0);
assign sel[2] = ~(c2|c1);

assign R_intensity[0] = (R[0]&sel[0]);
assign R_intensity[1] = (R[1]&sel[0]);
assign R_intensity[2] = (R[2]&sel[0]);
assign R_intensity[3] = (R[3]&sel[0]);
assign R_intensity[4] = (R[4]&sel[0]);
assign R_intensity[5] = (R[5]&sel[0]);
assign R_intensity[6] = (R[6]&sel[0]);
assign R_intensity[7] = (R[7]&sel[0]);

assign G_intensity[0] = (G[0]&sel[1]);
assign G_intensity[1] = (G[1]&sel[1]);
assign G_intensity[2] = (G[2]&sel[1]);
assign G_intensity[3] = (G[3]&sel[1]);
assign G_intensity[4] = (G[4]&sel[1]);
assign G_intensity[5] = (G[5]&sel[1]);
assign G_intensity[6] = (G[6]&sel[1]);
assign G_intensity[7] = (G[7]&sel[1]);

assign B_intensity[0] = (B[0]&sel[2]);
assign B_intensity[1] = (B[1]&sel[2]);
assign B_intensity[2] = (B[2]&sel[2]);
assign B_intensity[3] = (B[3]&sel[2]);
assign B_intensity[4] = (B[4]&sel[2]);
assign B_intensity[5] = (B[5]&sel[2]);
assign B_intensity[6] = (B[6]&sel[2]);
assign B_intensity[7] = (B[7]&sel[2]);

endmodule