# program: A, B<-A, C<-A,B, D<-A,C
p = [struct('b',[],'h',"A"),struct('b',["+A"],'h',"B"),struct('b',["+B";"+A"],'h',"C"),struct('b',["+A";"+C"],'h',"D")]
# p = [struct('b',[],'h',"A"),struct('b',["+A"],'h',"B"),struct('b',["+A";"+B"],'h',"C"),struct('b',["+C"],'h',"D"),struct('b',["+D"],'h',"E"),struct('b',["+E"],'h',"F"),struct('b',["+F"],'h',"G"),struct('b',["+G"],'h',"H"),struct('b',["+H"],'h',"I"),struct('b',["+I"],'h',"J"),struct('b',["+J"],'h',"K"),struct('b',["+K"],'h',"L"),struct('b',["+L"],'h',"M"),struct('b',["+M"],'h',"N"),struct('b',["+N"],'h',"O"),struct('b',["+O"],'h',"P"),struct('b',["+P"],'h',"Q"),struct('b',["+Q"],'h',"R"),struct('b',["+R"],'h',"S"),struct('b',["+S"],'h',"T"),struct('b',["+T"],'h',"U"),struct('b',["+U"],'h',"V"),struct('b',["+V"],'h',"W"),struct('b',["+W"],'h',"X"),struct('b',["+X"],'h',"Y"),struct('b',["+Y"],'h',"Z")]
# choose beta
b=1
# translate logical program to neural network
[theta1, theta2, outin, amin, inlits, outlits] = cilp(p,b)
# compute least fixpoint of tp
x1 = iter_tp(theta1, theta2, outin, amin, b)
# learning
clause =struct('b',["+B";"+A"],'h',"D")
[thetan1,thetan2] = cilp_train(clause, theta1, theta2, inlits, outlits, b)
# now use the trained network
x2 = iter_tp(thetan1, thetan2, outin, amin, b)

