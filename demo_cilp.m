# program: A, B<-A, C<-A,B, D<-A,C
p = [struct('b',[],'h',"A"),struct('b',["+A"],'h',"B"),struct('b',["+B";"+A"],'h',"C"),struct('b',["+A";"+C"],'h',"D")]
# choose beta
b=1
# translate logical program to neural network
[theta1, theta2, outin, amin, inlits, outlits] = cilp(p,b)
# compute least fixpoint of tp
x1 = iter_tp(theta1, theta2, outin, amin, b)
# learning
clause = ["+D";"+B";"-A"]
in = lits_to_vector(inlits,clause)
out = lits_to_vector(outlits,clause)
[thetan1,thetan2] = nn_train(in,out,0.0001,b,100000,0.12,theta1, theta2)
# now use the trained network
x2 = iter_tp(thetan1, thetan2, outin, amin, b)

