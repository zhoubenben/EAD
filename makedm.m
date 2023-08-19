function dm =makedm(pos)
%�����������
%pos       input  ��������
%dm        output �������
[~, len] =size(pos);
deltax =repmat(pos(1,:)', 1, len) - repmat(pos(1,:), len, 1);
deltay =repmat(pos(2,:)', 1, len) - repmat(pos(2,:), len, 1);
dm =round((deltax .^ 2 + deltay .^ 2) .^ 0.5);
end