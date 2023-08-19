function [ZTK1,ZTK2,ZTK3,ZTK4,ZTK5,ZTK6,ZTK7,ZTK8,ZTK9,ZTK10]=ZCSJ(A1,GKT,TJ)
%%输入运输时间数据
%A=xlsread('配矿方案.xlsx');
%B=xlsread('空载运行时间.xlsx');
%C=xlsread('重载运行时间.xlsx');
%Z=[1;1;1;1;1;1;1;1];%装载时间
%X=[1;1;1;1;1;1;1;1];%卸载时间
%P=B(:,3)+C(:,3)+Z;%卡车从斜坡道行驶至溜井装矿并返回至斜坡道时间
%D=B(:,1)+C(:,1)+X;%卡车从斜坡道行驶至矿仓卸矿并返回
%randIndex=randperm(82);
B1=GKT(1:8,1:4); C1=GKT(1:8,5:8); B2=GKT(9:16,1:4); C2=GKT(9:16,5:8);
B3=GKT(17:24,1:4); C3=GKT(17:24,5:8); B4=GKT(25:32,1:4); C4=GKT(25:32,5:8);
B5=GKT(33:40,1:4); C5=GKT(33:40,5:8); B6=GKT(41:48,1:4); C6=GKT(41:48,5:8);
B7=GKT(49:56,1:4); C7=GKT(49:56,5:8); B8=GKT(57:64,1:4); C8=GKT(57:64,5:8);
B9=GKT(65:72,1:4); C9=GKT(65:72,5:8); B10=GKT(73:80,1:4); C10=GKT(73:80,5:8);
%A1=A(randIndex);%随机产生运输任务序列
%%分配运输任务给卡车，共10辆卡车
K1=A1(1:9); K2=A1(10:18); K3=A1(19:26); K4=A1(27:34); K5=A1(35:42);
K6=A1(43:50); K7=A1(51:58); K8=A1(59:66); K9=A1(67:74); K10=A1(75:82);
%%
%%第1辆卡车的斜坡道重车运行时间节点
%卡车1重车进入斜坡道的时间节点
ZTK11=zeros(1,9);%产生空矩阵，用于存放卡车1的重车进入斜坡道的时间节点
ZTK11(1)=B1(K1(1),4)+1+C1(K1(1),3); ZTK11(2)=B1(K1(1),4)+3+C1(K1(1),4)+B1(K1(2),4)+C1(K1(2),3); ZTK11(3)=B1(K1(1),4)+C1(K1(1),4)+5+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),3);
ZTK11(4)=B1(K1(1),4)+C1(K1(1),4)+7+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),3);
ZTK11(5)=B1(K1(1),4)+C1(K1(1),4)+9+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),4)+B1(K1(5),4)+C1(K1(5),3);
ZTK11(6)=B1(K1(1),4)+C1(K1(1),4)+11+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),4)+B1(K1(5),4)+C1(K1(5),4)+B1(K1(6),4)+C1(K1(6),3);
ZTK11(7)=B1(K1(1),4)+C1(K1(1),4)+13+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),4)+B1(K1(5),4)+C1(K1(5),4)+B1(K1(6),4)+C1(K1(6),4)+B1(K1(7),4)+C1(K1(7),3);
ZTK11(8)=B1(K1(1),4)+C1(K1(1),4)+15+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),4)+B1(K1(5),4)+C1(K1(5),4)+B1(K1(6),4)+C1(K1(6),4)+B1(K1(7),4)+C1(K1(7),4)+B1(K1(8),4)+C1(K1(8),3);
ZTK11(9)=B1(K1(1),4)+C1(K1(1),4)+17+B1(K1(2),4)+C1(K1(2),4)+B1(K1(3),4)+C1(K1(3),4)+B1(K1(4),4)+C1(K1(4),4)+B1(K1(5),4)+C1(K1(5),4)+B1(K1(6),4)+C1(K1(6),4)+B1(K1(7),4)+C1(K1(7),4)+B1(K1(8),4)+C1(K1(8),4)+B1(K1(9),4)+C1(K1(9),3);
%卡车1重车驶离斜坡道的时间节点
ZTK12=zeros(1,9);%产生空矩阵，用于存放卡车1重车驶离斜坡道的时间节点
ZTK12(1)=ZTK11(1)+C1(K1(1),2); ZTK12(2)=ZTK11(2)+C1(K1(2),2); ZTK12(3)=ZTK11(3)+C1(K1(3),2);
ZTK12(4)=ZTK11(4)+C1(K1(4),2);
ZTK12(5)=ZTK11(5)+C1(K1(5),2);
ZTK12(6)=ZTK11(6)+C1(K1(6),2);
ZTK12(7)=ZTK11(7)+C1(K1(7),2);
ZTK12(8)=ZTK11(8)+C1(K1(8),2);
ZTK12(9)=ZTK11(9)+C1(K1(9),2);
ZTK1=[ZTK11' ZTK12'];
%%
%第2辆卡车的斜坡道重车运行时间节点
%卡车2重车进入斜坡道的时间节点
ZTK21=zeros(1,9);%产生空矩阵，用于存放卡车2的重车进入斜坡道的时间节点
ZTK21(1)=B2(K2(1),4)+1+C2(K2(1),3); ZTK21(2)=B2(K2(1),4)+3+C2(K2(1),4)+B2(K2(2),4)+C2(K2(2),3); ZTK21(3)=B2(K2(1),4)+C2(K2(1),4)+5+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),3);
ZTK21(4)=B2(K2(1),4)+C2(K2(1),4)+7+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),3);
ZTK21(5)=B2(K2(1),4)+C2(K2(1),4)+9+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),4)+B2(K2(5),4)+C2(K2(5),3);
ZTK21(6)=B2(K2(1),4)+C2(K2(1),4)+11+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),4)+B2(K2(5),4)+C2(K2(5),4)+B2(K2(6),4)+C2(K2(6),3);
ZTK21(7)=B2(K2(1),4)+C2(K2(1),4)+13+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),4)+B2(K2(5),4)+C2(K2(5),4)+B2(K2(6),4)+C2(K2(6),4)+B2(K2(7),4)+C2(K2(7),3);
ZTK21(8)=B2(K2(1),4)+C2(K2(1),4)+15+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),4)+B2(K2(5),4)+C2(K2(5),4)+B2(K2(6),4)+C2(K2(6),4)+B2(K2(7),4)+C2(K2(7),4)+B2(K2(8),4)+C2(K2(8),3);
ZTK21(9)=B2(K2(1),4)+C2(K2(1),4)+17+B2(K2(2),4)+C2(K2(2),4)+B2(K2(3),4)+C2(K2(3),4)+B2(K2(4),4)+C2(K2(4),4)+B2(K2(5),4)+C2(K2(5),4)+B2(K2(6),4)+C2(K2(6),4)+B2(K2(7),4)+C2(K2(7),4)+B2(K2(8),4)+C2(K2(8),4)+B2(K2(9),4)+C2(K2(9),3);
%卡车2重车驶离斜坡道的时间节点
ZTK22=zeros(1,9);%产生空矩阵，用于存放卡车2重车驶离斜坡道的时间节点
ZTK22(1)=ZTK21(1)+C2(K2(1),2); ZTK22(2)=ZTK21(2)+C2(K2(2),2); ZTK22(3)=ZTK21(3)+C2(K2(3),2);
ZTK22(4)=ZTK21(4)+C2(K2(4),2);
ZTK22(5)=ZTK21(5)+C2(K2(5),2);
ZTK22(6)=ZTK21(6)+C2(K2(6),2);
ZTK22(7)=ZTK21(7)+C2(K2(7),2);
ZTK22(8)=ZTK21(8)+C2(K2(8),2);
ZTK22(9)=ZTK21(9)+C2(K2(9),2);
%添加间隔时间
TJ2=ones(1,9).*TJ;%间隔时间矩阵
ZTK21=ZTK21+TJ2;
ZTK22=ZTK22+TJ2;
ZTK2=[ZTK21' ZTK22'];
%%
%第3辆卡车的斜坡道重车运行时间节点
%卡车3重车进入斜坡道的时间节点
ZTK31=zeros(1,8);%产生空矩阵，用于存放卡车3的重车进入斜坡道的时间节点
ZTK31(1)=B3(K3(1),4)+1+C3(K3(1),3); ZTK31(2)=B3(K3(1),4)+3+C3(K3(1),4)+B3(K3(2),4)+C3(K3(2),3); ZTK31(3)=B3(K3(1),4)+C3(K3(1),4)+5+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),3);
ZTK31(4)=B3(K3(1),4)+C3(K3(1),4)+7+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),4)+B3(K3(4),4)+C3(K3(4),3);
ZTK31(5)=B3(K3(1),4)+C3(K3(1),4)+9+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),4)+B3(K3(4),4)+C3(K3(4),4)+B3(K3(5),4)+C3(K3(5),3);
ZTK31(6)=B3(K3(1),4)+C3(K3(1),4)+11+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),4)+B3(K3(4),4)+C3(K3(4),4)+B3(K3(5),4)+C3(K3(5),4)+B3(K3(6),4)+C3(K3(6),3);
ZTK31(7)=B3(K3(1),4)+C3(K3(1),4)+13+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),4)+B3(K3(4),4)+C3(K3(4),4)+B3(K3(5),4)+C3(K3(5),4)+B3(K3(6),4)+C3(K3(6),4)+B3(K3(7),4)+C3(K3(7),3);
ZTK31(8)=B3(K3(1),4)+C3(K3(1),4)+15+B3(K3(2),4)+C3(K3(2),4)+B3(K3(3),4)+C3(K3(3),4)+B3(K3(4),4)+C3(K3(4),4)+B3(K3(5),4)+C3(K3(5),4)+B3(K3(6),4)+C3(K3(6),4)+B3(K3(7),4)+C3(K3(7),4)+B3(K3(8),4)+C3(K3(8),3);
%卡车3重车驶离斜坡道的时间节点
ZTK32=zeros(1,8);%产生空矩阵，用于存放卡车3重车驶离斜坡道的时间节点
ZTK32(1)=ZTK31(1)+C3(K3(1),2); ZTK32(2)=ZTK31(2)+C3(K3(2),2); ZTK32(3)=ZTK31(3)+C3(K3(3),2);
ZTK32(4)=ZTK31(4)+C3(K3(4),2);
ZTK32(5)=ZTK31(5)+C3(K3(5),2);
ZTK32(6)=ZTK31(6)+C3(K3(6),2);
ZTK32(7)=ZTK31(7)+C3(K3(7),2);
ZTK32(8)=ZTK31(8)+C3(K3(8),2);
%添加间隔时间
TJ3=2.*ones(1,8).*TJ;%间隔时间矩阵
ZTK31=ZTK31+TJ3;
ZTK32=ZTK32+TJ3;
ZTK3=[ZTK31' ZTK32'];
%%
%第4辆卡车的斜坡道重车运行时间节点
%卡车4重车进入斜坡道的时间节点
ZTK41=zeros(1,8);%产生空矩阵，用于存放卡车4的重车进入斜坡道的时间节点
ZTK41(1)=B4(K4(1),4)+1+C4(K4(1),3); ZTK41(2)=B4(K4(1),4)+3+C4(K4(1),4)+B4(K4(2),4)+C4(K4(2),3); ZTK41(3)=B4(K4(1),4)+C4(K4(1),4)+5+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),3);
ZTK41(4)=B4(K4(1),4)+C4(K4(1),4)+7+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),4)+B4(K4(4),4)+C4(K4(4),3);
ZTK41(5)=B4(K4(1),4)+C4(K4(1),4)+9+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),4)+B4(K4(4),4)+C4(K4(4),4)+B4(K4(5),4)+C4(K4(5),3);
ZTK41(6)=B4(K4(1),4)+C4(K4(1),4)+11+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),4)+B4(K4(4),4)+C4(K4(4),4)+B4(K4(5),4)+C4(K4(5),4)+B4(K4(6),4)+C4(K4(6),3);
ZTK41(7)=B4(K4(1),4)+C4(K4(1),4)+13+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),4)+B4(K4(4),4)+C4(K4(4),4)+B4(K4(5),4)+C4(K4(5),4)+B4(K4(6),4)+C4(K4(6),4)+B4(K4(7),4)+C4(K4(7),3);
ZTK41(8)=B4(K4(1),4)+C4(K4(1),4)+15+B4(K4(2),4)+C4(K4(2),4)+B4(K4(3),4)+C4(K4(3),4)+B4(K4(4),4)+C4(K4(4),4)+B4(K4(5),4)+C4(K4(5),4)+B4(K4(6),4)+C4(K4(6),4)+B4(K4(7),4)+C4(K4(7),4)+B4(K4(8),4)+C4(K4(8),3);
%卡车4重车驶离斜坡道的时间节点
ZTK42=zeros(1,8);%产生空矩阵，用于存放卡车4重车驶离斜坡道的时间节点
ZTK42(1)=ZTK41(1)+C4(K4(1),2); ZTK42(2)=ZTK41(2)+C4(K4(2),2); ZTK42(3)=ZTK41(3)+C4(K4(3),2);
ZTK42(4)=ZTK41(4)+C4(K4(4),2);
ZTK42(5)=ZTK41(5)+C4(K4(5),2);
ZTK42(6)=ZTK41(6)+C4(K4(6),2);
ZTK42(7)=ZTK41(7)+C4(K4(7),2);
ZTK42(8)=ZTK41(8)+C4(K4(8),2);
%添加间隔时间
TJ4=3.*ones(1,8).*TJ;%间隔时间矩阵
ZTK41=ZTK41+TJ4;
ZTK42=ZTK42+TJ4;
ZTK4=[ZTK41' ZTK42'];
%%
%第5辆卡车的斜坡道重车运行时间节点
%卡车5重车进入斜坡道的时间节点
ZTK51=zeros(1,8);%产生空矩阵，用于存放卡车5的重车进入斜坡道的时间节点
ZTK51(1)=B5(K5(1),4)+1+C5(K5(1),3); ZTK51(2)=B5(K5(1),4)+3+C5(K5(1),4)+B5(K5(2),4)+C5(K5(2),3); ZTK51(3)=B5(K5(1),4)+C5(K5(1),4)+5+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),1);
ZTK51(4)=B5(K5(1),4)+C5(K5(1),4)+7+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),4)+C5(K5(3),4)+B5(K5(4),4)+C5(K5(4),3);
ZTK51(5)=B5(K5(1),4)+C5(K5(1),4)+9+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),4)+C5(K5(3),4)+B5(K5(4),4)+C5(K5(4),4)+B5(K5(5),4)+C5(K5(5),3);
ZTK51(6)=B5(K5(1),4)+C5(K5(1),4)+11+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),4)+C5(K5(3),4)+B5(K5(4),4)+C5(K5(4),4)+B5(K5(5),4)+C5(K5(5),4)+B5(K5(6),4)+C5(K5(6),3);
ZTK51(7)=B5(K5(1),4)+C5(K5(1),4)+13+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),4)+C5(K5(3),4)+B5(K5(4),4)+C5(K5(4),4)+B5(K5(5),4)+C5(K5(5),4)+B5(K5(6),4)+C5(K5(6),4)+B5(K5(7),4)+C5(K5(7),3);
ZTK51(8)=B5(K5(1),4)+C5(K5(1),4)+15+B5(K5(2),4)+C5(K5(2),4)+B5(K5(3),4)+C5(K5(3),4)+B5(K5(4),4)+C5(K5(4),4)+B5(K5(5),4)+C5(K5(5),4)+B5(K5(6),4)+C5(K5(6),4)+B5(K5(7),4)+C5(K5(7),4)+B5(K5(8),4)+C5(K5(8),3);
%卡车5重车驶离斜坡道的时间节点
ZTK52=zeros(1,8);%产生空矩阵，用于存放卡车5重车驶离斜坡道的时间节点
ZTK52(1)=ZTK51(1)+C5(K5(1),2); ZTK52(2)=ZTK51(2)+C5(K5(2),2); ZTK52(3)=ZTK51(3)+C5(K5(3),2);
ZTK52(4)=ZTK51(4)+C5(K5(4),2);
ZTK52(5)=ZTK51(5)+C5(K5(5),2);
ZTK52(6)=ZTK51(6)+C5(K5(6),2);
ZTK52(7)=ZTK51(7)+C5(K5(7),2);
ZTK52(8)=ZTK51(8)+C5(K5(8),2);
%添加间隔时间
TJ5=4.*ones(1,8).*TJ;%间隔时间矩阵
ZTK51=ZTK51+TJ5;
ZTK52=ZTK52+TJ5;
ZTK5=[ZTK51' ZTK52'];
%%
%第6辆卡车的斜坡道重车运行时间节点
%卡车6重车进入斜坡道的时间节点
ZTK61=zeros(1,8);%产生空矩阵，用于存放卡车6的重车进入斜坡道的时间节点
ZTK61(1)=B6(K6(1),4)+1+C6(K6(1),3); ZTK61(2)=B6(K6(1),4)+3+C6(K6(1),4)+B6(K6(2),4)+C6(K6(2),3); ZTK61(3)=B6(K6(1),4)+C6(K6(1),4)+5+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),3);
ZTK61(4)=B6(K6(1),4)+C6(K6(1),4)+7+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),4)+B6(K6(4),4)+C6(K6(4),3);
ZTK61(5)=B6(K6(1),4)+C6(K6(1),4)+9+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),4)+B6(K6(4),4)+C6(K6(4),4)+B6(K6(5),4)+C6(K6(5),3);
ZTK61(6)=B6(K6(1),4)+C6(K6(1),4)+11+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),4)+B6(K6(4),4)+C6(K6(4),4)+B6(K6(5),4)+C6(K6(5),4)+B6(K6(6),4)+C6(K6(6),3);
ZTK61(7)=B6(K6(1),4)+C6(K6(1),4)+13+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),4)+B6(K6(4),4)+C6(K6(4),4)+B6(K6(5),4)+C6(K6(5),4)+B6(K6(6),4)+C6(K6(6),4)+B6(K6(7),4)+C6(K6(7),3);
ZTK61(8)=B6(K6(1),4)+C6(K6(1),4)+15+B6(K6(2),4)+C6(K6(2),4)+B6(K6(3),4)+C6(K6(3),4)+B6(K6(4),4)+C6(K6(4),4)+B6(K6(5),4)+C6(K6(5),4)+B6(K6(6),4)+C6(K6(6),4)+B6(K6(7),4)+C6(K6(7),4)+B6(K6(8),4)+C6(K6(8),3);
%卡车6重车驶离斜坡道的时间节点
ZTK62=zeros(1,8);%产生空矩阵，用于存放卡车6重车驶离斜坡道的时间节点
ZTK62(1)=ZTK61(1)+C6(K6(1),2); ZTK62(2)=ZTK61(2)+C6(K6(2),2); ZTK62(3)=ZTK61(3)+C6(K6(3),2);
ZTK62(4)=ZTK61(4)+C6(K6(4),2);
ZTK62(5)=ZTK61(5)+C6(K6(5),2);
ZTK62(6)=ZTK61(6)+C6(K6(6),2);
ZTK62(7)=ZTK61(7)+C6(K6(7),2);
ZTK62(8)=ZTK61(8)+C6(K6(8),2);
%添加间隔时间
TJ6=5.*ones(1,8).*TJ;%间隔时间矩阵
ZTK61=ZTK61+TJ6;
ZTK62=ZTK62+TJ6;
ZTK6=[ZTK61' ZTK62'];
%%
%第7辆卡车的斜坡道重车运行时间节点
%卡车7重车进入斜坡道的时间节点
ZTK71=zeros(1,8);%产生空矩阵，用于存放卡车7的重车进入斜坡道的时间节点
ZTK71(1)=B7(K7(1),4)+1+C7(K7(1),3); ZTK71(2)=B7(K7(1),4)+3+C7(K7(1),4)+B7(K7(2),4)+C7(K7(2),3); ZTK71(3)=B7(K7(1),4)+C7(K7(1),4)+5+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),3);
ZTK71(4)=B7(K7(1),4)+C7(K7(1),4)+7+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),4)+B7(K7(4),4)+C7(K7(4),3);
ZTK71(5)=B7(K7(1),4)+C7(K7(1),4)+9+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),4)+B7(K7(4),4)+C7(K7(4),4)+B7(K7(5),4)+C7(K7(5),3);
ZTK71(6)=B7(K7(1),4)+C7(K7(1),4)+11+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),4)+B7(K7(4),4)+C7(K7(4),4)+B7(K7(5),4)+C7(K7(5),4)+B7(K7(6),4)+C7(K7(6),3);
ZTK71(7)=B7(K7(1),4)+C7(K7(1),4)+13+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),4)+B7(K7(4),4)+C7(K7(4),4)+B7(K7(5),4)+C7(K7(5),4)+B7(K7(6),4)+C7(K7(6),4)+B7(K7(7),4)+C7(K7(7),3);
ZTK71(8)=B7(K7(1),4)+C7(K7(1),4)+15+B7(K7(2),4)+C7(K7(2),4)+B7(K7(3),4)+C7(K7(3),4)+B7(K7(4),4)+C7(K7(4),4)+B7(K7(5),4)+C7(K7(5),4)+B7(K7(6),4)+C7(K7(6),4)+B7(K7(7),4)+C7(K7(7),4)+B7(K7(8),4)+C7(K8(1),3);
%卡车7重车驶离斜坡道的时间节点
ZTK72=zeros(1,8);%产生空矩阵，用于存放卡车7重车驶离斜坡道的时间节点
ZTK72(1)=ZTK71(1)+C7(K7(1),2); ZTK72(2)=ZTK71(2)+C7(K7(2),2); ZTK72(3)=ZTK71(3)+C7(K7(3),2);
ZTK72(4)=ZTK71(4)+C7(K7(4),2);
ZTK72(5)=ZTK71(5)+C7(K7(5),2);
ZTK72(6)=ZTK71(6)+C7(K7(6),2);
ZTK72(7)=ZTK71(7)+C7(K7(7),2);
ZTK72(8)=ZTK71(8)+C7(K7(8),2);
%添加间隔时间
TJ7=6.*ones(1,8).*TJ;%间隔时间矩阵
ZTK71=ZTK71+TJ7;
ZTK72=ZTK72+TJ7;
ZTK7=[ZTK71' ZTK72'];
%%
%第8辆卡车的斜坡道重车运行时间节点
%卡车8重车进入斜坡道的时间节点
ZTK81=zeros(1,8);%产生空矩阵，用于存放卡车8的重车进入斜坡道的时间节点
ZTK81(1)=B8(K8(1),4)+1+C8(K8(1),3); ZTK81(2)=B8(K8(1),4)+3+C8(K8(1),4)+B8(K8(2),4)+C8(K8(2),3); ZTK81(3)=B8(K8(1),4)+C8(K8(1),4)+5+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(2),3);
ZTK81(4)=B8(K8(1),4)+C8(K8(1),4)+7+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(3),4)+B8(K8(4),4)+C8(K8(4),3);
ZTK81(5)=B8(K8(1),4)+C8(K8(1),4)+9+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(3),4)+B8(K8(4),4)+C8(K8(4),4)+B8(K8(5),4)+C8(K8(5),3);
ZTK81(6)=B8(K8(1),4)+C8(K8(1),4)+11+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(3),4)+B8(K8(4),4)+C8(K8(4),4)+B8(K8(5),4)+C8(K8(5),4)+B8(K8(6),4)+C8(K8(6),3);
ZTK81(7)=B8(K8(1),4)+C8(K8(1),4)+13+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(3),4)+B8(K8(4),4)+C8(K8(4),4)+B8(K8(5),4)+C8(K8(5),4)+B8(K8(6),4)+C8(K8(6),4)+B8(K8(7),4)+C8(K8(7),3);
ZTK81(8)=B8(K8(1),4)+C8(K8(1),4)+15+B8(K8(2),4)+C8(K8(2),4)+B8(K8(3),4)+C8(K8(3),4)+B8(K8(4),4)+C8(K8(4),4)+B8(K8(5),4)+C8(K8(5),4)+B8(K8(6),4)+C8(K8(6),4)+B8(K8(7),4)+C8(K8(7),4)+B8(K8(8),4)+C8(K8(8),3);
%卡车8重车驶离斜坡道的时间节点
ZTK82=zeros(1,8);%产生空矩阵，用于存放卡车8重车驶离斜坡道的时间节点
ZTK82(1)=ZTK81(1)+C8(K8(1),2); ZTK82(2)=ZTK81(2)+C8(K8(2),2); ZTK82(3)=ZTK81(3)+C8(K8(3),2);
ZTK82(4)=ZTK81(4)+C8(K8(4),2);
ZTK82(5)=ZTK81(5)+C8(K8(5),2);
ZTK82(6)=ZTK81(6)+C8(K8(6),2);
ZTK82(7)=ZTK81(7)+C8(K8(7),2);
ZTK82(8)=ZTK81(8)+C8(K8(8),2);
%添加间隔时间
TJ8=7.*ones(1,8).*TJ;%间隔时间矩阵
ZTK81=ZTK81+TJ8;
ZTK82=ZTK82+TJ8;
ZTK8=[ZTK81' ZTK82'];
%%
%第9辆卡车的斜坡道重车运行时间节点
%卡车9重车进入斜坡道的时间节点
ZTK91=zeros(1,8);%产生空矩阵，用于存放卡车9的重车进入斜坡道的时间节点
ZTK91(1)=B9(K9(1),4)+1+C9(K9(1),3); ZTK91(2)=B9(K9(1),4)+2+C9(K9(1),4)+B9(K9(2),4)+C9(K9(2),3); ZTK91(3)=B9(K9(1),4)+C9(K9(1),4)+4+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),3);
ZTK91(4)=B9(K9(1),4)+C9(K9(1),4)+8+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),4)+B9(K9(4),4)+C9(K9(4),3);
ZTK91(5)=B9(K9(1),4)+C9(K9(1),4)+8+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),4)+B9(K9(4),4)+C9(K9(4),4)+B9(K9(5),4)+C9(K9(5),3);
ZTK91(6)=B9(K9(1),4)+C9(K9(1),4)+10+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),4)+B9(K9(4),4)+C9(K9(4),4)+B9(K9(5),4)+C9(K9(5),4)+B9(K9(6),4)+C9(K9(6),3);
ZTK91(7)=B9(K9(1),4)+C9(K9(1),4)+12+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),4)+B9(K9(4),4)+C9(K9(4),4)+B9(K9(5),4)+C9(K9(5),4)+B9(K9(6),4)+C9(K9(6),4)+B9(K9(7),4)+C9(K9(7),3);
ZTK91(8)=B9(K9(1),4)+C9(K9(1),4)+14+B9(K9(2),4)+C9(K9(2),4)+B9(K9(3),4)+C9(K9(3),4)+B9(K9(4),4)+C9(K9(4),4)+B9(K9(5),4)+C9(K9(5),4)+B9(K9(6),4)+C9(K9(6),4)+B9(K9(7),4)+C9(K9(7),4)+B9(K9(8),4)+C9(K9(8),3);
%卡车9重车驶离斜坡道的时间节点
ZTK92=zeros(1,8);%产生空矩阵，用于存放卡车9重车驶离斜坡道的时间节点
ZTK92(1)=ZTK91(1)+C9(K9(1),2); ZTK92(2)=ZTK91(2)+C9(K9(2),2); ZTK92(3)=ZTK91(3)+C9(K9(3),2);
ZTK92(4)=ZTK91(4)+C9(K9(4),2);
ZTK92(5)=ZTK91(5)+C9(K9(5),2);
ZTK92(6)=ZTK91(6)+C9(K9(6),2);
ZTK92(7)=ZTK91(7)+C9(K9(7),2);
ZTK92(8)=ZTK91(8)+C9(K9(8),2);
%添加间隔时间
TJ9=8.*ones(1,8).*TJ;%间隔时间矩阵
ZTK91=ZTK91+TJ9;
ZTK92=ZTK92+TJ9;
ZTK9=[ZTK91' ZTK92'];
%%
%第10辆卡车的斜坡道重车运行时间节点
%卡车10重车进入斜坡道的时间节点
ZTK101=zeros(1,8);%产生空矩阵，用于存放卡车10的重车进入斜坡道的时间节点
ZTK101(1)=B10(K10(1),4)+1+C10(K10(1),3); ZTK101(2)=B10(K10(1),4)+2+C10(K10(1),4)+B10(K10(2),4)+C10(K10(2),3); ZTK101(3)=B10(K10(1),4)+C10(K10(1),4)+4+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),3);
ZTK101(4)=B10(K10(1),4)+C10(K10(1),4)+8+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),4)+B10(K10(4),4)+C10(K10(4),3);
ZTK101(5)=B10(K10(1),4)+C10(K10(1),4)+8+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),4)+B10(K10(4),4)+C10(K10(4),4)+B10(K10(5),4)+C10(K10(5),3);
ZTK101(6)=B10(K10(1),4)+C10(K10(1),4)+10+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),4)+B10(K10(4),4)+C10(K10(4),4)+B10(K10(5),4)+C10(K10(5),4)+B10(K10(6),4)+C10(K10(6),3);
ZTK101(7)=B10(K10(1),4)+C10(K10(1),4)+12+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),4)+B10(K10(4),4)+C10(K10(4),4)+B10(K10(5),4)+C10(K10(5),4)+B10(K10(6),4)+C10(K10(6),4)+B10(K10(7),4)+C10(K10(7),3);
ZTK101(8)=B10(K10(1),4)+C10(K10(1),4)+14+B10(K10(2),4)+C10(K10(2),4)+B10(K10(3),4)+C10(K10(3),4)+B10(K10(4),4)+C10(K10(4),4)+B10(K10(5),4)+C10(K10(5),4)+B10(K10(6),4)+C10(K10(6),4)+B10(K10(7),4)+C10(K10(7),4)+B10(K10(8),4)+C10(K10(8),3);
%卡车10重车驶离斜坡道的时间节点
ZTK102=zeros(1,8);%产生空矩阵，用于存放卡车10重车驶离斜坡道的时间节点
ZTK102(1)=ZTK101(1)+C10(K10(1),2); ZTK102(2)=ZTK101(2)+C10(K10(2),2); ZTK102(3)=ZTK101(3)+C10(K10(3),2);
ZTK102(4)=ZTK101(4)+C10(K10(4),2);
ZTK102(5)=ZTK101(5)+C10(K10(5),2);
ZTK102(6)=ZTK101(6)+C10(K10(6),2);
ZTK102(7)=ZTK101(7)+C10(K10(7),2);
ZTK102(8)=ZTK101(8)+C10(K10(8),2);
%添加间隔时间
TJ10=9.*ones(1,8).*TJ;%间隔时间矩阵
ZTK101=ZTK101+TJ10;
ZTK102=ZTK102+TJ10;
ZTK10=[ZTK101' ZTK102'];