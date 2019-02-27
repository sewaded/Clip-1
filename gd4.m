%Gradient Descent for finding possible optimum locations
%Gradient Descent Version IV upgraded with power(10,-prec)
fgs;
E0=E;
for o1=1:u
    a0=a(o1);
    a(o1)=a(o1)+power(10,-prec);
    fgs;
    pa(o1)=(E-E0)/power(10,-prec);
    a(o1)=a0;
end
for o1=1:k
    b0=b(o1);
    b(o1)=b(o1)+power(10,-prec);
    fgs;
    pb(o1)=(E-E0)/power(10,-prec);
    b(o1)=b0;
end
for o1=1:k
    for o2=1:u
        w0=w(o1,o2);
        w(o1,o2)=w(o1,o2)+power(10,-prec);
        fgs;
        pwr(o1,o2)=(E-E0)/power(10,-prec);
        w(o1,o2)=w0;
        
        w(o1,o2)=w(o1,o2)+1i*power(10,-prec);
        fgs;
        pwi(o1,o2)=(E-E0)/power(10,-prec);
        w(o1,o2)=w0;
    end
end
mo=0;
for o1=1:u
    mo=mo+power(pa(o1),2);
end
for o1=1:k
    mo=mo+power(pb(o1),2);
end
for o1=1:k
    for o2=1:u
        mo=mo+power(pwr(o1,o2),2)+power(pwr(o1,o2),2);
    end
end
mo=power(mo,0.5);
if mo~=0
    a0=a;
    b0=b;
    w0=w;
    E0=E;
    a=a-reverse*pa*(step/mo);
    b=b-reverse*pb*(step/mo);
    w=w-reverse*pwr*(step/mo)-1i*reverse*pwi*(step/mo);
    fgs;
else
    if reverse==1
        Ex(x)=E;
        phinx(:,x)=Phi/power((Phi'*Phi),0.5);
        ax(x,:)=a(:);
        bx(x,:)=b(:);
        wx(x,:,:)=w(:,:);
        x=x+1;
    end
    t=t0;
    reverse=-1*reverse;
    fluc=ones(1,t);
    deltaE=100*ones(1,t);
    step=0.01;
    precmax=3;
end
r=r+1;                  %Observation module
% R(r)=E;                 %Observation module
% G(r)=real(Phin'* V1);   %Observation module
prec=3; %步长数量级，真实数量级是prec-3
while step<power(0.1,prec-3)
    prec=prec+1;
end
for o1=0:t-2
    fluc(t-o1)=fluc(t-o1-1);
end
for o1=0:t-2
    deltaE(t-o1)=deltaE(t-o1-1);
end
deltaE(1)=abs(E-E0);%E值经每次gd优化后的变动值
fluc(1)=((reverse*E)>(reverse*E0));
if fluc(1)==1
%     t=t+1;
    fluc(t)=1;
    deltaE(t)=100;
    step=step/2;
    a=a0;
    b=b0;
    w=w0;
    E=E0;
end
if sum(fluc(1:t))==0
%     step=step*power(1.1,1/(prec-1.99));
    step=step*1.01;
%     fluc(round(t/2))=1;
end
yes=1;
for o1=1:t
    yes=yes*(deltaE(o1)<0.000000000000000001+0.00000001*(reverse==-1));
end
if yes
    if reverse==1
        Ex(x)=E;
        phinx(:,x)=Phi/power((Phi'*Phi),0.5);
        ax(x,:)=a(:);
        bx(x,:)=b(:);
        wx(x,:,:)=w(:,:);
        x=x+1;
    end
    t=t0;
    reverse=-1*reverse;
    fluc=ones(1,t);
    deltaE=100*ones(1,t);
%     stablity=0;
    step=0.01;
%     Prec=zeros(1,100);
    precmax=3;
end
% if sum(fluc(1:t))<=t/4 && fluc(1)==1 && Prec(precmax)+Prec(precmax-1)>50*sum(Prec(1:precmax-2))
%     fluc=ones(1,t);
%     step=1;
%     stablity=0;
%     Prec=zeros(1,100);
%     precmax=3;
%     t=t0;
%     yes=1;
% end

ar(r)=a(1);
br(r)=b(1);