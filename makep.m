function p =makep(spop)
%���¸��ʾ���
%spop          input  ����Ⱥ��
%np            output ���ʾ���
[popsize,citysize] = size(spop);
count= zeros(citysize, citysize); % ��¼���ִ���
spop = [spop spop(:, 1)];
for i =1:popsize
    for j = 1:citysize
        a = spop(i, j);
        b = spop(i, j+1);
        count(a, b) = count(a, b) + 1;
        count(b, a) = count(b, a) + 1;
    end
end
sumcount =sum(count, 2);
p = count ./sumcount;
end