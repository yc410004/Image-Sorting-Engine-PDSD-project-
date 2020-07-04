module HA_(S, A, B);

input A, B;
output S;
wire G_;

and (G, A, B);
or	(P, A, B);
not (G_, G);
and (S, G_, P);

endmodule