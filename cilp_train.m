function [thetan1,thetan2] = cilp_train(p, theta1, theta2, inlits, outlits, b)
q = size(p,2);
in = reshape(cell2mat(arrayfun(@(l) lits_to_vector(inlits,l.b),p,"UniformOutput",false)),size(inlits,2),q)'
out = reshape(cell2mat(arrayfun(@(l) lits_to_vector(outlits,["+",l.h]),p,"UniformOutput",false)),size(outlits,2),q)'
restriction = sign(ones(size(out,1),1)'*out)
[thetan1,thetan2] = nn_train(in,out,0.0001,b,100000,0.12,theta1, theta2,0,restriction);
endfunction