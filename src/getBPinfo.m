%ͨ���о������ʼ��BP����
function [input_train, ps, output_train, ts, inputnum, hiddenmun, outputnum, data_num, lenchrom]=getBPinfo
%input_train               Ӱ�����ز���
%output_target         Ŀ�����
%inputnum                 �������
%hiddenmun              ������
%outputnum              �������
%data_num                 ����������Ӱ������--Ŀ�������
%lenchrom                  Ⱦɫ�峤��

D = load('Data.mat');
preData = D.P;

%��6������ѵ������
input_train  = preData(1:8,1:7);
output_train = preData(1:8,8);
input_train = input_train';
output_train = output_train';

%���ݹ�һ��
[input_train , ps] = mapminmax(input_train , 0 ,1);
[output_train , ts] = mapminmax(output_train , 0 ,1);

%��ȡBP���������Ϣ
hiddenmun=9;
[inputnum,data_num]=size (input_train);
[outputnum, data_num]=size (output_train);
lenchrom=inputnum*hiddenmun++hiddenmun+hiddenmun*outputnum+outputnum;%�Ŵ��㷨���볤��
fprintf('�Ŵ��㷨Ⱦɫ����볤�� : %d\n'  , lenchrom);