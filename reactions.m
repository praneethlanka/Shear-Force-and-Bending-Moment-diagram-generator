function [load,reactionsmag,nl]=reactions(rd1,rd2)
syms r1 r2 momenteqn loadeqn ;
nl=input('Number of Loads on the span?');
load=zeros(nl,2);
reactionsmag=zeros(2,2);
ml=0;
for i=1:nl
    load(i,1)=input('Load?');
    load(i,2)=input('Distance?');
    ml=ml+load(i,1)*load(i,2);
end
momenteqn=r1*rd1+r2*rd2==ml;
MagL=sum(load,1);
Magloadeqn=MagL(1,1);
loadeqn=r1+r2==Magloadeqn;
reaction=solve(momenteqn,loadeqn);
reactionsmag(1,2)=rd1;
reactionsmag(2,2)=rd2;
reactionsmag(2,1)=reaction.r2;
reactionsmag(1,1)=reaction.r1;
end