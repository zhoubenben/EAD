%% ��Ӧ�Ⱥ���fit.m
function fitness=fit(len,m,maxlen,minlen)%%�����ֵ�ֱ���Ⱥ���в�ͬ�����Ӧ�ľ��룬��Ӧ�ȼ�����ָ̭����������ֵ����С����ֵ
    fitness=len;
    for i =1:length(len)
        fitness(i,1)=(1-(len(i,1)-minlen)/(maxlen-minlen+0.0001)).^m;%%Ϊ��ʹ���Ż��ٶȸ��죬����Ͱ�Ŀ�꺯��������ƽ��
    end
end
