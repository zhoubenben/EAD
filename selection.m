function spop= selection(pop, sn, fitness)
%ѡ��
%pop       input  ��Ⱥ
%sn        input  ����Ⱥ���ģ
%fitness   input  ��Ⱥ��Ӧ��ֵ
%spop      output ����Ⱥ��
[~, index] =sort(fitness);
index =index(1: sn);
spop =pop(index, :);
end