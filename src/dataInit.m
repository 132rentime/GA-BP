%��ȡ���ݼ�
%PΪ����������
%FΪ����������
function [P , F] = dataInit

P = xlsread('passengerFlow.xlsx');
F = xlsread('freightFlow.xlsx');

save('Data');
