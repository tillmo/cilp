## connectionist inductive logic learning and programming (CILP)

# A program 
# B; B ∧C∧ ∼ D → A; E ∧ F → A
# is represented as
#p1 = [struct('b',[],'h',"B"),struct('b',["B+";"C+";"D-"],'h',"A"),struct('b',["E+";"F+"],'h',"A")]
# another example:
#p2 = [struct('b',[],'h',"A"),struct('b',["A+"],'h',"B"),struct('b',["B+";"A+"],'h',"C"),struct('b',["A+";"C+"],'h',"D")]
function [theta1, theta2, outin, amin] = cilp(p,b = 1)
  # number of clauses in p
  q = size(p,2);
  # k(l) = number of literals in body of clause l
  [k,_] = arrayfun(@(l) size(l.b),p);
  # heads of clauses
  h = arrayfun(@(l) l.h,p);
  # all head literals
  hlits = unique(h)
  # all body literals
  blits = "+-";
  for l = p
    blits = [blits,reshape(l.b,1,2*size(l.b))];
  endfor  
  blits = unique(blits)(3:end)
  # for each head literat, number of clauses with that head literal
  mu = arrayfun(@(l) length(strfind(h,l)),hlits);
  # maximum of all k(l) and mu(l)
  m = max(max(k),max(mu))
  # threshold for discriminating true and false
  amin = ((m-1)/(m+1))^0.5 # ^0.5 increases the value, but keeps it < 1
  # neural network conncetion weight
  w = 2.0/b*(log(1+amin)-log(1-amin))/(m*(amin-1)+amin+1)
  # threshold for neurons in hidden layer
  theta_hidden = (1+amin)*(k-1)/2.0*w;
  # threshold for neurons in output layer
  theta_out = (1+amin)*(1-mu)/2.0*w;
  # conncetions between input layer and hidden layer
  theta1 = [];
  for i = 1:q
    l = p(i);
    for j = 1:size(blits,2)
       lit = blits(j);
       for kk = 1:size(l.b,1)
         if (lit==l.b(kk,1))
           if (l.b(kk,2)=="+")
             theta1(i,j) = w;
           elseif (l.b(kk,2)=="-")
             theta1(i,j) = -w;
           endif
         endif
       endfor
   endfor
  endfor
  # add thresholds as weights
  theta1 = [-theta_hidden',theta1]';
  # conncetions between hidden layer and output layer
  theta2 = [];
  for i = 1:q
    l = p(i);
    for j = 1:size(hlits,2)
       lit = hlits(j);
       if (lit==l.h)
         theta2(i,j) = w;
       endif
   endfor
  endfor   
  # add thresholds as weights
  theta2 = [-theta_out',theta2']';
  # connection of output neurons to input neurons
  outin = [];
  for i = 1:size(blits,2)
    blit = blits(i);
    for j = 1:size(hlits,2)
       hlit = hlits(j);
       if (blit==hlit)
         outin(i,j) = 1;
       else  
         outin(i,j) = 0;
       endif
   endfor
  endfor   
 endfunction