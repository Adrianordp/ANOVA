reseta
load('data.mat')
TT = (T'-1)/4;
TT2 = [TT, sum(TT,2)];
TT2 = [TT2;var(TT2)];

% A (emocional)
% B (saúde)
% C (socialização)
% D (competitividade)
% E (estética)
% F (prazer)
s = size(T);

H = T(:,1:15);
M = T(:,16:end);

f = zeros(15,2);
for i = 1:s(2)
    if i <= 15
        ii = num2str(i);
        eval(['H' ii ' = reshape(T(:,' ii '),6,9);'])
        f(i,1) = check(eval(['H' ii]));
        HH{i} = reshape(T(:,i),6,9);
    else
        ii = num2str(i);
        iii = num2str(i-15);
        eval(['M' iii ' = reshape(T(:,' ii '),6,9);'])
        f(i-15,2) = check(eval(['M' iii]));
        MM{i-15} = reshape(T(:,i),6,9);
    end
end

validH  = find(f(:,1)==1);
validM  = find(f(:,2)==1);
validHL = length(validH);
validML = length(validM);

T  = T';
vH = T(validH,:);
vM = T(validM+15,:);
vT = [vH;vM];
% vT = T;

% nTH = [];
% for i = 1:validHL
% %     nTH = [nTH HH{validH(i)}];
%     nTH = [nTH;HH{validH(i)}];
% end
% nTM = [];
% for i = 1:validML
% %     nTM = [nTM MM{validM(i)}];
%     nTM = [nTM; MM{validM(i)}];
% end
% 
% nT = [nTH; nTM];
% 
% % A = T(1:6:s(1),:); AH = A(:,1:15); AM = A(:,16:end);
% % B = T(2:6:s(1),:); BH = A(:,1:15); BM = A(:,16:end);
% % C = T(3:6:s(1),:); CH = A(:,1:15); CM = A(:,16:end);
% % D = T(4:6:s(1),:); DH = A(:,1:15); DM = A(:,16:end);
% % E = T(5:6:s(1),:); EH = A(:,1:15); EM = A(:,16:end);
% % F = T(6:6:s(1),:); FH = A(:,1:15); FM = A(:,16:end);
% A = nT(1:6:end,:); AH = A(:,1:validHL); AM = A(:,validHL+1:end);
% B = nT(2:6:end,:); BH = A(:,1:validHL); BM = A(:,validHL+1:end);
% C = nT(3:6:end,:); CH = A(:,1:validHL); CM = A(:,validHL+1:end);
% D = nT(4:6:end,:); DH = A(:,1:validHL); DM = A(:,validHL+1:end);
% E = nT(5:6:end,:); EH = A(:,1:validHL); EM = A(:,validHL+1:end);
% F = nT(6:6:end,:); FH = A(:,1:validHL); FM = A(:,validHL+1:end);
A  = vT(:,1:6:end);
B  = vT(:,2:6:end);
C  = vT(:,3:6:end);
D  = vT(:,4:6:end);
E  = vT(:,5:6:end);
F  = vT(:,6:6:end);
AH = A(1:validHL,:);
AM = A(validHL+1:end,:);
BH = B(1:validHL,:);
BM = B(validHL+1:end,:);
CH = C(1:validHL,:);
CM = C(validHL+1:end,:);
DH = D(1:validHL,:);
DM = D(validHL+1:end,:);
EH = E(1:validHL,:);
EM = E(validHL+1:end,:);
FH = F(1:validHL,:);
FM = F(validHL+1:end,:);

mP = mean((A+B+C+D+E+F)/6,2);
mT = mean(mP);

alpha = cronbach(vT);
alphaA = cronbach(A); sA = sum(A,2); mA = mean(sA); vA = var(sA); dA = std(sA);
alphaB = cronbach(B); sB = sum(B,2); mB = mean(sB); vB = var(sB); dB = std(sB);
alphaC = cronbach(C); sC = sum(C,2); mC = mean(sC); vC = var(sC); dC = std(sC);
alphaD = cronbach(D); sD = sum(D,2); mD = mean(sD); vD = var(sD); dD = std(sD);
alphaE = cronbach(E); sE = sum(E,2); mE = mean(sE); vE = var(sE); dE = std(sE);
alphaF = cronbach(F); sF = sum(F,2); mF = mean(sF); vF = var(sF); dF = std(sF);

table = [mA dA min(sA) max(sA)
         mB dB min(sB) max(sB)
         mC dC min(sC) max(sC)
         mD dD min(sD) max(sD)
         mE dE min(sE) max(sE)
         mF dF min(sF) max(sF)];

fprintf('Foram eliminados %d homens e %d mulheres ', 15-validHL,15-validML)
fprintf('por apresentarem resultados \ninconsistentes de acordo com a ')
fprintf('questão 9 do questionário, que se \ntrata de uma questão de ')
fprintf('verificação. Registrou-se um total de %d\n',validHL+validML)
fprintf('formulários válidos.\n\n')
fprintf('alfa de Cronbach de todos os dados: %f\n',alpha)
fprintf('alfa de Cronbach de controle de estresse: %f\n',alphaA)
fprintf('alfa de Cronbach de saúde: %f\n',alphaB)
fprintf('alfa de Cronbach de sociabilidade: %f\n',alphaC)
fprintf('alfa de Cronbach de competitividade: %f\n',alphaD)
fprintf('alfa de Cronbach de estética: %f\n',alphaE)
fprintf('alfa de Cronbach de prazer: %f\n\n',alphaF)

% fprintf('\tMédia \tDesvio-padrão \t   Mínimo \tMáximo\n')
% disp(table)


fprintf('\t\t\tMédia \tDesvio-padrão \tMínimo \tMáximo\n')
fprintf('Controle de estresse \t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(1,:))
fprintf('Saúde \t\t\t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(2,:))
fprintf('Sociabilidade \t\t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(3,:))
fprintf('Competitividade \t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(4,:))
fprintf('Estética \t\t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(5,:))
fprintf('Prazer \t\t\t%.2f\t%.2f\t\t%.2f\t%.2f\n',table(6,:))