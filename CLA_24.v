module CLA24(Sum, A, B, Cin);

input[21:0] A,B;
input	Cin;

output[21:0] Sum;

wire [21:0] gtemp, ptemp, ctemp1;
wire [5:0]  gouta, pouta, ctemp2;

RFA r1 (gtemp[0],  ptemp[0],  Sum[0],  A[0],  B[0],  Cin);
RFA r2 (gtemp[1],  ptemp[1],  Sum[1],  A[1],  B[1],  ctemp1[1]);
RFA r3 (gtemp[2],  ptemp[2],  Sum[2],  A[2],  B[2],  ctemp1[2]);
RFA r4 (gtemp[3],  ptemp[3],  Sum[3],  A[3],  B[3],  ctemp1[3]);
RFA r5 (gtemp[4],  ptemp[4],  Sum[4],  A[4],  B[4],  ctemp2[1]);
RFA r6 (gtemp[5],  ptemp[5],  Sum[5],  A[5],  B[5],  ctemp1[5]);
RFA r7 (gtemp[6],  ptemp[6],  Sum[6],  A[6],  B[6],  ctemp1[6]);
RFA r8 (gtemp[7],  ptemp[7],  Sum[7],  A[7],  B[7],  ctemp1[7]);
RFA r9 (gtemp[8],  ptemp[8],  Sum[8],  A[8],  B[8],  ctemp2[2]);
RFA r10(gtemp[9],  ptemp[9],  Sum[9],  A[9],  B[9],  ctemp1[9]);
RFA r11(gtemp[10], ptemp[10], Sum[10], A[10], B[10], ctemp1[10]);
RFA r12(gtemp[11], ptemp[11], Sum[11], A[11], B[11], ctemp1[11]);
RFA r13(gtemp[12], ptemp[12], Sum[12], A[12], B[12], ctemp2[3]);
RFA r14(gtemp[13], ptemp[13], Sum[13], A[13], B[13], ctemp1[13]);
RFA r15(gtemp[14], ptemp[14], Sum[14], A[14], B[14], ctemp1[14]);
RFA r16(gtemp[15], ptemp[15], Sum[15], A[15], B[15], ctemp1[15]);
RFA r17(gtemp[16], ptemp[16], Sum[16], A[16], B[16], ctemp2[4]);
RFA r18(gtemp[17], ptemp[17], Sum[17], A[17], B[17], ctemp1[17]);
RFA r19(gtemp[18], ptemp[18], Sum[18], A[18], B[18], ctemp1[18]);
RFA r20(gtemp[19], ptemp[19], Sum[19], A[19], B[19], ctemp1[19]);
RFA r21(gtemp[20], ptemp[20], Sum[20], A[20], B[20], ctemp2[5]);
RFA r22(gtemp[21], ptemp[21], Sum[21], A[21], B[21], ctemp1[21]);


BCLG_4 b1(ctemp1[3:0],   gouta[0], pouta[0], gtemp[3:0],   ptemp[3:0],   Cin);
BCLG_4 b2(ctemp1[7:4],   gouta[1], pouta[1], gtemp[7:4],   ptemp[7:4],   ctemp2[1]);
BCLG_4 b3(ctemp1[11:8],  gouta[2], pouta[2], gtemp[11:8],  ptemp[11:8],  ctemp2[2]);
BCLG_4 b4(ctemp1[15:12], gouta[3], pouta[3], gtemp[15:12], ptemp[15:12], ctemp2[3]);
BCLG_4 b5(ctemp1[19:16], gouta[4], pouta[4], gtemp[19:16], ptemp[19:16], ctemp2[4]);
BCLG_2 b6(ctemp1[21:20], gouta[5], pouta[5], gtemp[21:20], ptemp[21:20], ctemp2[5]);

BCLG_6 b7(ctemp2, gouta, pouta, Cin);

endmodule

`include"RFA.v"
`include"BCLG_4.v"
`include"BCLG_6.v"
`include"BCLG_2.v"