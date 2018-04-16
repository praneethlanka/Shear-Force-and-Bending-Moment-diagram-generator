syms i Ra Rb w W n distance length eqn1 eqn2 dRa dRb netforce moment;
w=zeros(1,3);
n=input('Give the number of weight''s');
for i=1:n
    fprintf("%d\n",i);
    w(i)=input('W');
end
W=sum(w);
fprintf("Enter the length of the span");
length=input('L');
fprintf("Enter the distance of the load from the left support");
dW=input('D1');
dRa=0;
dRb=length;
netforce=zeros(length/0.01+1,1);
moment=netforce;
eqn1=Ra+Rb==W;
eqn2=W*dW-length*Rb==0;
sol=solve(eqn1,eqn2);
Ra=sol.Ra;
Rb=sol.Rb;
i=1;
for x=0:0.01:length
    if x==dRa
        moment(i,1)=0;
        netforce(i,1)=Ra;
    end
    if x>dRa && x<dW
        netforce(i,1)=Ra;
        moment(i,1)=x*dRa;
    end
    if x==dW
        moment(i,1)=x*dRa;
        netforce(i,1)=-W+Ra;
    end
    if x<dRb && x>dW
        netforce(i,1)=-W+Ra;
        moment(i,1)=x*Ra-W*(x-dW);
    end
    if x==dRb
        netforce(i,1)=-W+Ra+Rb;
        moment(i,1)=x*Ra-W*(x-dW);
    end
    i=i+1;
end
x=0:0.01:length;
subplot(1,2,1)
plot(x,netforce);
axis('equal')
subplot(1,2,2)
x=0:0.01:length;
plot(x,moment);