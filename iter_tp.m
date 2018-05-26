function x = iter_tp(p,b = 1)
  # translate logical program to neural network
  [theta1, theta2, outin, amin] = cilp(p,b)
  # initially, set all input atoms to false, i.e. all inputs to -1
  x = -ones(size(theta1, 1)-1, 1)'
  do 
    oldx=x;
    x=tp(x,theta1, theta2, outin, amin,b)
  until oldx==x
endfunction