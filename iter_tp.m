# iterate neural tp function until fixpoint is reached
function x = iter_tp(theta1, theta2, outin, amin, b = 1, start = 0)
  # initially, set all input literals to false, i.e. all inputs to -1
  if (start ==0)
    x = -ones(size(theta1, 1)-1, 1)'
  else 
    x = start
  end  
  count = 1;
  do 
    oldx=x;
    count += 1;
    # iterate tp
    x=tp(x,theta1, theta2, outin, amin,b)
  # until fixpoint is reached  
  until oldx==x || count > 1000
endfunction