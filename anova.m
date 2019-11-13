reseta
load('data.mat')
% A (emocional)
% B (saúde)
% C (socialização)
% D (competitividade)
% E (estética)
% F (prazer)
s = size(T);

H = T(:,1:15);
M = T(:,16:end);

for i = 1:s(2)
    if i <= 15
        eval(['H' num2str(i) ' = reshape(T(:,' num2str(i) '),6,9);'])
    else
        eval(['M' num2str(i-15) ' = reshape(T(:,' num2str(i) '),6,9);'])
    end
end
A = T(1:6:s(1),:); AH = A(:,1:15); AM = A(:,16:end);
B = T(2:6:s(1),:); BH = A(:,1:15); BM = A(:,16:end);
C = T(3:6:s(1),:); CH = A(:,1:15); CM = A(:,16:end);
D = T(4:6:s(1),:); DH = A(:,1:15); DM = A(:,16:end);
E = T(5:6:s(1),:); EH = A(:,1:15); EM = A(:,16:end);
F = T(6:6:s(1),:); FH = A(:,1:15); FM = A(:,16:end);