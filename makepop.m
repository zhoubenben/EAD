function pop= makepop(popsize, citysize, p)
%������Ⱥ
%popsize       input  ��Ⱥ��ģ
%citysize      input  ��������
%p             input  ���ʾ���
%pop           output ��Ⱥ
pop =zeros(popsize, citysize);
for i =1:popsize
    for j = 1:citysize
        if j == 1   % ���������һ������
            pop(i, j) = randi(citysize);
        else        % ʹ�����̶ķ�ѡ����һ������
            cityp = p(pop(i, j-1), :);      % �ҳ���ѡ����
            cityp(pop(i, 1:j-1)) = 0;       % �Ѿ����ʹ��ĸ���Ϊ0
            sumcityp = sum(cityp);          % ��ʼ���̶ķ�
            cityp = cityp ./ sumcityp;
            cityp = cumsum(cityp);
            index = find(cityp >= rand);
            % ��һ������Ⱥ����û�г��жԼ�¼������һ���������
            if isempty(index)
                tempcity = 1:1:citysize;
                tempcity(pop(i, 1:j-1)) = 0;
                tempindex = find(tempcity >0);
                index = tempindex(1);
            end
            pop(i, j) = index(1);
        end
    end
end
end