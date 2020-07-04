module HA(G, P, S, A, B);

input A, B;
output S, P, G;
wire G_;

and (G, A, B);
or	(P, A, B);
not (G_, G);
and (S, G_, P);

endmodule