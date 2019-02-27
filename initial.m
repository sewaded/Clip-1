%please include fgs.m gd4.m gds.m
clc
clear
%wolfe-powel gold-stain newton
format long

% sto=100;

k = 3; % k>=2
% load H70
% H=H70;

% load H37
% H=H37;

% load H16
% H=H16;

% load H8.dat
% H=H8;

% load H5
% H=H5;

load H4.dat
H=H4;

[n1,n] = size(H);
if n==n1
    n1=1;
    while 2^n1<n
        n1=n1+1;
    end
    H1=H;
    H=zeros(2^n1);
    H(1:n,1:n)=H1(1:n,1:n);
    for o1=n+1:2^n1
        H(o1,o1)=12*o1;
    end
    n=2^n1;
end
[V,D]=eig(H);
V1=V(:,1);
u = n1;
reverse=1;
prec=3;
precmax=0;
Prec=zeros(1,100);
x=1; %For recording the final results
t0=12;
t=t0;%Used to recognize fluctuation in order to adjust the "step" parameter

d=2;
a=d*2*(.5*ones(1,u)-rand(1,u));
b=d*2*(.5*ones(1,k)-rand(1,k));
w=d*2*(.5*ones(k,u)-rand(k,u))+1i*2*(.5*ones(k,u)-rand(k,u));
c=zeros(n,1);

h=-1*ones(k,2^k);
for o1=2:2^k
    h(:,o1)=h(:,o1-1);
    h(k,o1)=h(k,o1)+2;
    for o2=k:-1:2
        if h(o2,o1)==3
            h(o2,o1)=-1;
            h(o2-1,o1)=h(o2-1,o1)+2;
        end
    end
    h(1,o1)=h(1,o1)-4*(h(1,o1)==3);
end
Phi=zeros(n,1);%WaveFunction
E=0;%Energy
r=0;
step=1;
fluc=ones(1,t); %For fluctuation recording
deltaE=100*ones(1,t);
maxprec=3;
stablity=0;
stablitycritirion=4;
Phis=zeros(u,2^u);
for o1=2:2^u
    Phis(:,o1)=Phis(:,o1-1);
    Phis(u,o1)=Phis(u,o1)+1;
    for o2=u:-1:2
        if Phis(o2,o1)==2
            Phis(o2,o1)=0;
            Phis(o2-1,o1)=Phis(o2-1,o1)+1;
        end
    end
    Phis(1,o1)=Phis(1,o1)-2*(Phis(1,o1)==2);
end
phis=eye(n);%自选s的矩阵，有待更新
fgs
target=D(1)
gds
% H16 target=-84.007829715393555
% H37 target=-84.021284727538514