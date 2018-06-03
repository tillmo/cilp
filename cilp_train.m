function [thetan1,thetan2] = cilp_train(clause, theta1, theta2, inlits, outlits, b)
in = lits_to_vector(inlits,clause.b)
out = lits_to_vector(outlits,["+",clause.h])
[thetan1,thetan2] = nn_train(in,out,0.0001,b,100000,0.12,theta1, theta2,0,out);
endfunction