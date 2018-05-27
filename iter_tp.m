# iterate neural tp function until fixpoint is reached
function x = iter_tp(p,b = 1)
  # translate logical program to neural network
  [theta1, theta2, outin, amin, inlits, outlits] = cilp(p,b)
  # initially, set all input literals to false, i.e. all inputs to -1
  x = -ones(size(theta1, 1)-1, 1)'
  do 
    oldx=x;
    # iterate tp
    x=tp(x,theta1, theta2, outin, amin,b)
  # until fixpoint is reached  
  until oldx==x
endfunction