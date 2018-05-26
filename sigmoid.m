## -*- texinfo -*-
##
## @deftypefn {Function File} {@var{y} =} sigmoid (@var{x}, @var{derivative})
##
## Computes the sigmoid of @var{x} or the sigmoid derivative of @var{x} if
## @var{derivative} is set to true
##
## @end deftypefn
function y = sigmoid(x, b=1, derivative=false)
	if (derivative) 
		y = b/2*(1.0 - x .^2);
	else
		y = 2.0 ./ (1.0 + exp(-x*b))-1.0;
	endif
endfunction
%!assert(sigmoid(0), 0.5)
%!assert(sigmoid([0]), [0.5])
%!assert(sigmoid(1), 0.73105, 0.00001)
%!assert(sigmoid([0, 1]), [0.5, 0.73105], 0.00001)
%!assert(sigmoid([0 1; 0 1]), [0.5, 0.73105; 0.5, 0.73105], 0.00001)
%!assert(sigmoid(0.2, true), 0.16, 0.00001)
