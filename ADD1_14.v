module ADD1_14( A, ADD, Sum);

input[14:0] A;
input ADD;

output[14:0] Sum;

wire[14:0] P;

and a1 (P[1],  A[0],   ADD);
and a2 (P[2],  A[1],  P[1]);
and a3 (P[3],  A[2],  P[2]);
and a4 (P[4],  A[3],  P[3]);
and a5 (P[5],  A[4],  P[4]);
and a6 (P[6],  A[5],  P[5]);
and a7 (P[7],  A[6],  P[6]);
and a8 (P[8],  A[7],  P[7]);
and a9 (P[9],  A[8],  P[8]);
and a10(P[10], A[9],  P[9]);
and a11(P[11], A[10], P[10]);
and a12(P[12], A[11], P[11]);
and a13(P[13], A[12], P[12]);
and a14(P[14], A[13], P[13]);

xor x1 ( Sum[0],  A[0],   ADD);
xor x2 ( Sum[1],  A[1],  P[1]);
xor x3 ( Sum[2],  A[2],  P[2]);
xor x4 ( Sum[3],  A[3],  P[3]);
xor x5 ( Sum[4],  A[4],  P[4]);
xor x6 ( Sum[5],  A[5],  P[5]);
xor x7 ( Sum[6],  A[6],  P[6]);
xor x8 ( Sum[7],  A[7],  P[7]);
xor x9 ( Sum[8],  A[8],  P[8]);
xor x10( Sum[9],  A[9],  P[9]);
xor x11( Sum[10], A[10], P[10]);
xor x12( Sum[11], A[11], P[11]);
xor x13( Sum[12], A[12], P[12]);
xor x14( Sum[13], A[13], P[13]);
xor x15( Sum[14], A[14], P[14]);

endmodule
