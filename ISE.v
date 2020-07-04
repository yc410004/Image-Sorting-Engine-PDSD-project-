`timescale 1ns/10ps

module ISE( clk, reset, image_in_index, pixel_in, busy, out_valid, color_index, image_out_index);
input           clk;
input           reset;
input   [4:0]   image_in_index;
input   [23:0]  pixel_in;
output          busy;
output          out_valid;
output  [1:0]   color_index;
output  [4:0]   image_out_index;


wire [23:0] pixel_in_;
wire [4:0] image_in_index_;
reg [21:0] intensity;
reg [14:0] pixel;
wire [21:0] R_total, G_total, B_total;
wire [14:0] R_count, G_count, B_count;
wire [7:0] R_intensity, G_intensity, B_intensity;
wire [2:0] sel1;
wire [1:0] sel2;

wire load_sort, div_start;
wire reset_add;
wire [23:0] quotient;

assign pixel_in_ = (busy)? 24'd0:pixel_in;
assign image_in_index_ = (busy)? 5'd0:image_in_index;

compare_intensity u0(pixel_in_, sel1, R_intensity, G_intensity, B_intensity);

CLA CLA1(R_total, R_intensity, clk, reset, reset_add);
CLA CLA2(G_total, G_intensity, clk, reset, reset_add);
CLA CLA3(B_total, B_intensity, clk, reset, reset_add);

ADD1 ADD_R(R_count, sel1[0], clk, reset, reset_add);
ADD1 ADD_G(G_count, sel1[1], clk, reset, reset_add);
ADD1 ADD_B(B_count, sel1[2], clk, reset, reset_add);

comp_pixel u1(R_count, G_count, B_count, sel2);

always@(*)
	case(sel2)
	2'b00: pixel = R_count;
	2'b01: pixel = G_count;
	2'b10: pixel = B_count;
	default: pixel = 15'd0;
	endcase
	
always@(*)
	case(sel2)
	2'b00: intensity = R_total;
	2'b01: intensity = G_total;
	2'b10: intensity = B_total;
	default: intensity = 21'd0;
	endcase
	
State s0(clk, reset, image_in_index_, reset_add, div_start, busy);
Divider div(clk, reset, div_start, intensity, pixel, load_sort, quotient, sel2);
BSort7 sort(reset, load_sort, clk, quotient, color_index, image_out_index, out_valid);

endmodule

`include "comp_int.v"
`include "CLA.v"
`include "ADD1.v"
`include "comp_pixel.v"
`include "SDivider.v"
`include "Bsort7.v"
`include "state.v"
