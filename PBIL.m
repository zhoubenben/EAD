%%%%%%%%%%%%PBIL algorithm
clc
clear
clf
tic           %%%%%%%%%%%��ʼ��ʱ
%%%%%%%%%%%%��������
Pop_Size=40;
Individual_Len=20;%%%%%%%%%ÿ�������ĳ���
Variable_Num=2;
Learning_Rate=0.01;
Iteration_Times=1000;
I=1;
%%%%%%%%%%%%%%%������ʼ��Ⱥ
Binary_X=zeros(Pop_Size,Variable_Num,Individual_Len);
for i=1:1:Pop_Size
    for j=1:1:Variable_Num
        for k=1:1:Individual_Len
            Binary_X(i,j,k)=round(rand());
        end
    end
end
Best_Individual=zeros(1,Iteration_Times);
Probability_Vector=zeros(Iteration_Times,Variable_Num,Individual_Len);
traces=zeros(3,Iteration_Times);%%%%%׷��ÿһ��������ֵ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ÿһ��ִ�����²���
while I<=Iteration_Times    
 %%%%%%%%%%%%%%%%��������ֵ���ɶ�����ת����ʮ����
  Decimal_X=zeros(Pop_Size,Variable_Num);
    for i=1:1:Pop_Size
        for j=1:1:Variable_Num  
            k=Individual_Len;
            t=1;
            while k>=1
               Decimal_X(i,j)=Decimal_X(i,j)+Binary_X(i,j,k)*2^(t-1);
               k=k-1;
               t=t+1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%��ʮ����ӳ�䵽��ռ���
    Solution=zeros(Pop_Size,Variable_Num);
    for i=1:1:Pop_Size
        for j=1:1:Variable_Num
            Solution(i,j)=-2+Decimal_X(i,j)*4/(2^Individual_Len-1);
        end
    end
    %%%%%%%%%%%%%%%%%%������Ӧֵ
    Fitness_Value=zeros(1,Pop_Size);
    for i=1:1:Pop_Size
      %  Fitness_Value(i)=100*(Solution(i,1)^2-Solution(i,2))^2+(1-Solution(i,1))^2;
    %  Fitness_Value(i)=Solution(i,1)*cos(2*pi*Solution(i,2))+Solution(i,2)*sin(2*pi*Solution(i,1));
    %Fitness_Value(i)=Solution(i,1)+Solution(i,2);
   % Fitness_Value(i)=Solution(i,1)^2+Solution(i,2);
   %Fitness_Value(i)=Solution(i,1)*Solution(i,2);
   %Fitness_Value(i)=(Solution(i,1)-Solution(i,2))^2;
    Fitness_Value(i)=Solution(i,1).*cos(2*pi*Solution(i,2))+Solution(i,2).*cos(2*pi*Solution(i,1));
    end
    %%%%%%%%%%%%%%%%%%����Ӧֵ���մ�С�����˳�����򣬲�ѡ�����Ÿ���
    [FitnessValue,index]=sort(Fitness_Value);%%%%%%%����  
    Best_Individual(I)=Fitness_Value(index(Pop_Size));%%%%%%%%ѡ���Ÿ���
    traces(1,I)=Solution(index(Pop_Size),1);
    traces(2,I)=Solution(index(Pop_Size),2);
    traces(3,I)=Fitness_Value(index(Pop_Size));
    %%%%%%%%%%%%%%%%ѡ������Ⱥ��
    Superiority_Polution=zeros(Pop_Size/2,Variable_Num,Individual_Len);
    for i=1:1:Pop_Size/2
        for j=1:1:Variable_Num
            for k=1:1:Individual_Len
                Superiority_Polution(i,j,k)=Binary_X(index(i+Pop_Size/2),j,k);
            end
        end
    end
    %%%%%%%%%%%%%%%������Ⱥ����ͳ�ƻ���λ��ֵ�������¸�������
     Ones_Number=zeros(Variable_Num,Individual_Len);
    for i=1:1:Pop_Size/2
        for j=1:1:Variable_Num
            for k=1:1:Individual_Len
                if Superiority_Polution(i,j,k)==1
                    Ones_Number(j,k)=Ones_Number(j,k)+1;
                end
            end
        end
    end
    for j=1:1:Variable_Num
        for k=1:1:Individual_Len
            Probability_Vector(I,j,k)=Ones_Number(j,k)/(Pop_Size/2);
        end
    end
%%%%%%%%%%%%%%���¸�������       
if I>1
       for j=1:1:Variable_Num
           for k=1:1:Individual_Len
               Probability_Vector(I,j,k)=Learning_Rate.*Binary_X(index(Pop_Size),j,k)+(1-Learning_Rate).*Probability_Vector(I-1,j,k);
           end
       end
end
    %%%%%%%%%%%%%%%%���ݸ��������Խ�ռ����
    for i=1:1:Pop_Size
        for j=1:1:Variable_Num
            for k=1:1:Individual_Len
                r=rand();
                if r<Probability_Vector(I,j,k)
                    Binary_X(i,j,k)=1;
                else
                    Binary_X(i,j,k)=0;
                end
            end
        end
    end
   %%%%%%%%%%%%%%%%%%%%  ִ�����ϲ����͵õ�����һ��Ⱥ��
   I=I+1;
end                   %%%%%%%%%%%%%%������ֹ
toc             %%%%%%%%%%%%%��ʱ��ֹ����ʾ�����������õ�ʱ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ͼ

figure(1)
hold on
xlabel('��������')
ylabel('���Ž�ı仯')
plot(Best_Individual);
title('��������')
grid on
[Best_Polution,xuhao_Iteration]=max(Best_Individual);
bestx1=traces(1,xuhao_Iteration);
bestx2=traces(2,xuhao_Iteration);
bestz=traces(3,xuhao_Iteration);
fprintf(['���Ž�:\nx1=',num2str(bestx1),'\nx2=',num2str(bestx2),'\nf=',num2str(bestz),'\niteration=',num2str(xuhao_Iteration),'\n']);
hold off



