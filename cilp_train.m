function [thetan1,thetan2] = cilp_train(p, theta1, theta2, inlits, outlits, b)
# number of clauses
q = size(p,2);
# call lits_to_vectot for the body of each clause. This simple task needs an incredibly complex formula in octave
in = reshape(cell2mat(arrayfun(@(l) lits_to_vector(inlits,l.b),p,"UniformOutput",false)),size(inlits,2),q)'
# dto. for the head of each clause
out = reshape(cell2mat(arrayfun(@(l) lits_to_vector(outlits,["+",l.h]),p,"UniformOutput",false)),size(outlits,2),q)'
# compute restriction vector indicating which output neuron shall be used for learning
# Therefore, sum all rows of out, and take sign in order to obtain 1 iff there is a clause with that head
restriction = sign(ones(size(out,1),1)'*out)
# train
[thetan1,thetan2] = nn_train(in,out,0.0001,b,100000,0.12,theta1, theta2,0,restriction);
endfunction