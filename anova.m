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

validH  = find(f(:,1)==1);% validH = 1:15;
validM  = find(f(:,2)==1);% validM = 1:15;
validHL = length(validH);
validML = length(validM);

T  = T';
vH = T(validH,1:48);
vM = T(validM+15,1:48);
vT = [vH;vM];
% vT = T;

svT = sum((vT-1)/4);
svTH = sum((vH-1)/4);
svTM = sum((vM-1)/4);
Q = zeros(8,6);
QH = zeros(8,6);
QM = zeros(8,6);
for i = 1:8
    Q(i,:) = svT(6*(i-1)+1:6*i);
    QH(i,:) = svTH(6*(i-1)+1:6*i);
    QM(i,:) = svTM(6*(i-1)+1:6*i);
    f = figure;
    pie(Q(i,find(Q(i,:) > 0)))
    si = num2str(i);
    f.Children.Title.String = ['Gráfico de pizza da questão ' si ' dos questionários válidos.'];
    legend
    if (i == 2)
        f.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Estética' 'Prazer'};
    else
        f.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'};
    end
    f.Children(1).Position = [0.6999    0.6324    0.2973    0.2596];
    f.Position = [101 235 592 312];
    fH = figure;
    pie(QH(i,find(QH(i,:) > 0)))
    si = num2str(i);
    fH.Children.Title.String = ['Gráfico de pizza da questão ' si ' dos questionários válidos masculinos.'];
    legend
    if (i == 2)
        fH.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Estética' 'Prazer'};
    else
        fH.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'};
    end
    fH.Children(1).Position = [0.6999    0.6324    0.2973    0.2596];
    fH.Position = [101 235 592 312];
    fM = figure;
    pie(QM(i,find(QM(i,:) > 0)))
    si = num2str(i);
    fM.Children.Title.String = ['Gráfico de pizza da questão ' si ' dos questionários válidos femininos.'];
    legend
    if (i >= 2)
        fM.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Estética' 'Prazer'};
    else
        fM.Children(1).String = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'};
    end
    fM.Children(1).Position = [0.6999    0.6324    0.2973    0.2596];
    fM.Position = [101 235 592 312];
end
close all

b = figure;
bar(Q,'stacked','DisplayName','Q');
legend('Controle de estresse','Saúde','Sociabilidade','Competitividade','Estética','Prazer')
title('Volume de respostas de cada dimensão para formulários válidos')
b.Children(2).Position = [0.0500    0.1100    0.7750    0.8150];
b.Position = [302 284 803 376];
b.Children(2).YLabel.String = 'Volume de respostas';
b.Children(2).XLabel.String = 'Questões';
grid on

bH = figure;
bar(QH,'stacked','DisplayName','Q');
legend('Controle de estresse','Saúde','Sociabilidade','Competitividade','Estética','Prazer')
title('Volume de respostas de cada dimensão para formulários válidos masculinos')
bH.Children(2).Position = [0.0500    0.1100    0.7750    0.8150];
bH.Position = [302 284 803 376];
bH.Children(2).YLabel.String = 'Volume de respostas';
bH.Children(2).XLabel.String = 'Questões';
grid on

bM = figure;
bar(QM,'stacked','DisplayName','Q');
legend('Controle de estresse','Saúde','Sociabilidade','Competitividade','Estética','Prazer')
title('Volume de respostas de cada dimensão para formulários válidos feminios')
bM.Children(2).Position = [0.0500    0.1100    0.7750    0.8150];
bM.Position = [302 284 803 376];
bM.Children(2).YLabel.String = 'Volume de respostas';
bM.Children(2).XLabel.String = 'Questões';
grid on

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

alphaAH = cronbach(AH); sAH = sum(AH,2); mAH = mean(sAH); vAH = var(sAH); dAH = std(sAH);
alphaBH = cronbach(BH); sBH = sum(BH,2); mBH = mean(sBH); vBH = var(sBH); dBH = std(sBH);
alphaCH = cronbach(CH); sCH = sum(CH,2); mCH = mean(sCH); vCH = var(sCH); dCH = std(sCH);
alphaDH = cronbach(DH); sDH = sum(DH,2); mDH = mean(sDH); vDH = var(sDH); dDH = std(sDH);
alphaEH = cronbach(EH); sEH = sum(EH,2); mEH = mean(sEH); vEH = var(sEH); dEH = std(sEH);
alphaFH = cronbach(FH); sFH = sum(FH,2); mFH = mean(sFH); vFH = var(sFH); dFH = std(sFH);

alphaAM = cronbach(AM); sAM = sum(AM,2); mAM = mean(sAM); vAM = var(sAM); dAM = std(sAM);
alphaBM = cronbach(BM); sBM = sum(BM,2); mBM = mean(sBM); vBM = var(sBM); dBM = std(sBM);
alphaCM = cronbach(CM); sCM = sum(CM,2); mCM = mean(sCM); vCM = var(sCM); dCM = std(sCM);
alphaDM = cronbach(DM); sDM = sum(DM,2); mDM = mean(sDM); vDM = var(sDM); dDM = std(sDM);
alphaEM = cronbach(EM); sEM = sum(EM,2); mEM = mean(sEM); vEM = var(sEM); dEM = std(sEM);
alphaFM = cronbach(FM); sFM = sum(FM,2); mFM = mean(sFM); vFM = var(sFM); dFM = std(sFM);

table = [mA dA min(sA) max(sA)
         mB dB min(sB) max(sB)
         mC dC min(sC) max(sC)
         mD dD min(sD) max(sD)
         mE dE min(sE) max(sE)
         mF dF min(sF) max(sF)];
     
tableH = [mAH dAH min(sAH) max(sAH)
          mBH dBH min(sBH) max(sBH)
          mCH dCH min(sCH) max(sCH)
          mDH dDH min(sDH) max(sDH)
          mEH dEH min(sEH) max(sEH)
          mFH dFH min(sFH) max(sFH)];
     
tableM = [mAM dAM min(sAM) max(sAM)
          mBM dBM min(sBM) max(sBM)
          mCM dCM min(sCM) max(sCM)
          mDM dDM min(sDM) max(sDM)
          mEM dEM min(sEM) max(sEM)
          mFM dFM min(sFM) max(sFM)];

fprintf('Foram eliminados %d homens e %d mulheres ', 15-validHL,15-validML)
fprintf('por apresentarem resultados \ninconsistentes de acordo com a ')
fprintf('questão 9 do questionário, que se \ntrata de uma questão de ')
fprintf('verificação. Registrou-se um total de %d\n',validHL+validML)
fprintf('formulários válidos.\n\n')
fprintf('alfa de Cronbach de todos os dados:\t%f\n',alpha)
fprintf('alfa de Cronbach de controle de estresse:\t%f\n',alphaA)
fprintf('alfa de Cronbach de saúde:\t%f\n',alphaB)
fprintf('alfa de Cronbach de sociabilidade:\t%f\n',alphaC)
fprintf('alfa de Cronbach de competitividade:\t%f\n',alphaD)
fprintf('alfa de Cronbach de estética:\t%f\n',alphaE)
fprintf('alfa de Cronbach de prazer:\t%f\n\n',alphaF)

% fprintf('\tMédia \tDesvio-padrão \t   Mínimo \tMáximo\n')
% disp(table)

fprintf('HOMENS (%d) e MULHERES (%d). n = %d\n',validHL,validML,validHL+validML)
fprintf('\tMédia \tDesvio-padrão \tMínimo \tMáximo\n')
fprintf('Controle de estresse \t%.2f\t%.2f\t%.2f\t%.2f\n',table(1,:))
fprintf('Saúde \t%.2f\t%.2f\t%.2f\t%.2f\n',table(2,:))
fprintf('Sociabilidade \t%.2f\t%.2f\t%.2f\t%.2f\n',table(3,:))
fprintf('Competitividade \t%.2f\t%.2f\t%.2f\t%.2f\n',table(4,:))
fprintf('Estética \t%.2f\t%.2f\t%.2f\t%.2f\n',table(5,:))
fprintf('Prazer \t%.2f\t%.2f\t%.2f\t%.2f\n',table(6,:))

fprintf('HOMENS. n = %d\n',validHL)
fprintf('\tMédia \tDesvio-padrão \tMínimo \tMáximo\n')
fprintf('Controle de estresse \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(1,:))
fprintf('Saúde \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(2,:))
fprintf('Sociabilidade \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(3,:))
fprintf('Competitividade \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(4,:))
fprintf('Estética \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(5,:))
fprintf('Prazer \t%.2f\t%.2f\t%.2f\t%.2f\n',tableH(6,:))

fprintf('MULHERES. n = %d\n',validML)
fprintf('\tMédia \tDesvio-padrão \tMínimo \tMáximo\n')
fprintf('Controle de estresse \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(1,:))
fprintf('Saúde \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(2,:))
fprintf('Sociabilidade \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(3,:))
fprintf('Competitividade \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(4,:))
fprintf('Estética \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(5,:))
fprintf('Prazer \t%.2f\t%.2f\t%.2f\t%.2f\n',tableM(6,:))

bpT = figure;
boxplot([sA sB sC sD sE sF])
bpT.Children.Title.String = 'Gráfico de caixa do conjunto completo para cada dimensão.';
% bpT.Children.XTickLabel = {'A' 'B' 'C' 'D' 'E' 'F'}';
bpT.Children.XTickLabel = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'}';
bpT.Children.XGrid = 'on';
bpT.Children.YGrid = 'on';
bpT.Children.YLabel.String = 'Pontuação';
bpT.Children.XLabel.String = 'Dimensão';
bpT.Position = [106 240 857 312];
bpT.Children.YLim = [5 45];

bpH = figure;
boxplot([sAH sBH sCH sDH sEH sFH])
bpH.Children.Title.String = 'Gráfico de caixa do grupo masculino para cada dimensão.';
% bpH.Children.XTickLabel = {'A' 'B' 'C' 'D' 'E' 'F'}';
bpH.Children.XTickLabel = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'}';
bpH.Children.XGrid = 'on';
bpH.Children.YGrid = 'on';
bpH.Children.YGrid = 'on';
bpH.Children.YLabel.String = 'Pontuação';
bpH.Children.XLabel.String = 'Dimensão';
bpH.Position = [106 240 857 312];
bpH.Children.YLim = [5 45];

bpM = figure;
grid on
boxplot([sAM sBM sCM sDM sEM sFM])
bpM.Children.Title.String = 'Gráfico de caixa do grupo feminino para cada dimensão.';
% bpM.Children.XTickLabel = {'A' 'B' 'C' 'D' 'E' 'F'}';
bpM.Children.XTickLabel = {'Controle de estresse' 'Saúde' 'Sociabilidade' 'Competitividade' 'Estética' 'Prazer'}';
bpM.Children.XGrid = 'on';
bpM.Children.YGrid = 'on';
bpM.Children.YLabel.String = 'Pontuação';
bpM.Children.XLabel.String = 'Dimensão';
bpM.Position = [106 240 857 312];
bpM.Children.YLim = [5 45];
