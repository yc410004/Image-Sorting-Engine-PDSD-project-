module RFA(G, P, S, A, B, Cin);

input A, B, Cin;
output G, P, S;
wire gtemp, ptemp, stemp;

HA   HA1(G, P, stemp, A, B);
HA_  HA2(S, stemp, Cin);

endmodule

`include"HA.v"
`include"HA_.v"