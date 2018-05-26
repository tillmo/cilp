function out = tp(x,theta1, theta2, outin, amin,b = 1)
  # propagate input through network
  x1=nn_predict(x,theta1,theta2,b);
  # transform output vector into input vector
  x2 = (outin*x1')';
  # threshold amin distinguishes between true and false
  x3 = (x2 > amin) * 2 - 1;
  # use old input, and overwrite it with new output whenever it fits
  overwrite = sum(outin',1);
  stay = 1-overwrite;
  out = (diag(stay)*x'+diag(overwrite)*x3')';
endfunction