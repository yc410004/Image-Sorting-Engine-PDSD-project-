module BCLG_6 (cout, g, p, cin);

input [5:0] g, p;
input cin;

output[5:0] cout;

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;

and a1 (s1,p[0],cin);
or  o1 (cout[1], g[0], s1);

and a2 (s2,p[1],g[0]);
and a3 (s3,p[1],p[0],cin);
or  o2 (cout[2], g[1], s2, s3);

and a4 (s4,p[2],g[1]);
and a5 (s5,p[2],p[1],g[0]);
and a6 (s6,p[2],p[1],p[0],cin);
or  o3 (cout[3], g[2], s4, s5, s6);

and a7 (s7,p[3],g[2]);
and a8 (s8,p[3],p[2],g[1]);
and a9 (s9,p[3],p[2],p[1],g[0]);
and a10 (s10,p[3],p[2],p[1],p[0],cin);
or  o4 (cout[4], g[3], s7, s8, s9, s10);

and a11(s11,p[4],g[3]);
and a12(s12,p[4],p[3],g[2]);
and a13(s13,p[4],p[3],p[2],g[1]);
and a14(s14,p[4],p[3],p[2],p[1],g[0]);
and a15(s15,p[4],p[3],p[2],p[1],p[0],cin);
or  o5 (cout[5], g[4], s11, s12, s13, s14, s15);


endmodule