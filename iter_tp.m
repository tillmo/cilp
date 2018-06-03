# iterate neural tp function until fixpoint is reached
function x = iter_tp(theta1, theta2, outin, amin, b = 1)
  # initially, set all input literals to false, i.e. all inputs to -1
  x = -ones(size(theta1, 1)-1, 1)'
  count = 1;
  do 
    oldx=x;
    count += 1;
    # iterate tp
    x=tp(x,theta1, theta2, outin, amin,b)
  # until fixpoint is reached  
  until oldx==x || count > 1000
endfunction