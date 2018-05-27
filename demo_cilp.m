# program: A, B<-A, C<-A,B, D<-A,C
p = [struct('b',[],'h',"A"),struct('b',["A+"],'h',"B"),struct('b',["B+";"A+"],'h',"C"),struct('b',["A+";"C+"],'h',"D")]
# choose beta
b=1
# translate logical program to neural network
[theta1, theta2, outin, amin, inlits, outlits] = cilp(p,b)
# compute least fixpoint of tp
x = iter_tp(theta1, theta2, outin, amin, b)
