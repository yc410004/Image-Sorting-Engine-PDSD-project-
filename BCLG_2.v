module BCLG_2 (cout, gout, pout, g, p, cin);

input [1:0] g, p;
input cin;

output[1:0] cout;
output gout, pout;

wire s1, s2, s3, s4, s5, s6, s7, s8, s9;

and a1 (s1,p[0],cin);
or  o1 (cout[1], g[0], s1);
and a2 (s2,p[1],g[0]);
and a3 (s3,p[1],p[0],cin);

or  o4 (gout, g[1], s2, s3);
and a10(pout,p[0],p[1]);

endmodule