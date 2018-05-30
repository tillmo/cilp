function outlits = lits_to_vector(lits,clause)
  outlits = zeros(size(lits,2),1)';
  for i = 1:size(lits,2)
    lit = lits(i);
    for l = clause'
       if (lit==l(2))
         if(l(1)=="+")
           outlits(i) = 1;
         elseif(l(1)=="-")
           outlits(i) = -1;
         endif
       endif
   endfor
  endfor   
 endfunction