%Test IBCost
%-------------------------------Initial Parameters-----------------
k=6;
h=1;
b=5;
N=20;
w=100;
Lambda=10;
Lr=1;
Lw=[2,3,4,5,7,8];
Ow=[1200,500,2000,1000,3500,4500];
Pw=[84,85,83,83.5,82.5,82];
Or=200;
BigM=[120,100,150,110,180,210];
qw=[0.96,0.96,0.94,0.95,0.95,0.94];   %Perfect Rate
qr=0.95;                              %Target Perfect Rate

x1 = [15,14,50,0,0,10];
x2 = [1,1,0,1,0,1];
x3 = [10,50,5];
x = [x1,x2,x3];
y = [x1,x3];
%[BCostW,ICostW,BCostR,ICostR] = IBCost(x,k,N,Lambda,Lr,Lw,h,b);
%[BCostW1,ICostW1,BCostR1,ICostR1] = IBCostOne(x,k,N,Lambda,Lr,Lw,h,b);
%[BCostW2,ICostW2,BCostR2,ICostR2] = IBCostTwo(x,k,N,Lambda,Lr,Lw,h,b);
%[BCostW,ICostW,BCostR,ICostR] = IBCostFour(y,k,N,Lambda,Lr,Lw);
%[BCostW,ICostW,BCostR,ICostR] = IBCostFive(x,k,N,Lambda,Lr,Lw);
%[BCostW1,ICostW1,ICostW2,BCostR,ICostR] = IBCostSix(x,k,N,Lambda,Lr,Lw);

%Get the expected inventory and backorder level
[BCostW,ICostW,BCostR,ICostR] = IBCostSeven(x,k,N,Lambda,Lr,Lw);

%Get the expected cost
BCost_Retailer = BCostR*N*b;
ICost_Retailer = ICostR*N*h;
ICost_Warehouse = x(2*k+2)*ICostW;  
BCost_Warehosue = x(2*k+2)*BCostW*b;

TotalP=0;
for j = 1:k;
    P = N*Lambda/sum(x(1:k))*Ow(j)*x(k+j)/x(2*k+2);
    TotalP = TotalP + P;
end

Obj = h*(N*ICostR+x(2*k+2)*ICostW)+b*(N*BCostR+x(2*k+2)*BCostW)+N*Lambda*Or/x(2*k+2)+TotalP;
