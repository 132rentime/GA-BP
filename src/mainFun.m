%main function
%�Ŵ��㷨
clc ; close all ; clear all;
nntwarn off;%reject  to using matlab ga toolbox
%%
%��ȡBP������Ϣ
 [input_train, ps, output_train, ts, inputnum, hiddenmun, outputnum, data_num, lenchrom]=getBPinfo;


bound=ones(lenchrom,1)* [-2 , 2];
popNum=50;%��Ⱥ��Ŀ
genNum=100;%��������
initPop=initializega(popNum, bound, 'gabpEval');%��Ⱥ��ʼ��

%�Ŵ����㣬��goat������������gabpEval����
[x,endPop ,bPop, trace]=ga (bound , 'gabpEval' , [ ] , initPop,[1e-6 1 1],'maxGenTerm', genNum,...
    'normGeomSelect' , [0.09] , ['arithXover'] , [2] , 'nonUnifMutation',[2 genNum 3]);

%%
%Compare Sum-Squared Error
figure(1);
plot(trace(:,1) , 1./trace(:,2),'r-' , 'lineWidth' , 2);hold on
plot(trace(:,1),1./trace(:,3),'b-.' , 'lineWidth' , 2);
xlabel ('Generation');ylabel ('Sum-Squared Error');
title('Compare Sum-Squared Error');
legend('Best Sum-Squared Error' , 'Avg Sum-Squared Error');
grid on;

%Compare Fittness
figure(2);
plot (trace(:,1),trace(:,2),'r-' , 'lineWidth' , 2);hold on
plot (trace(:,1), trace(:,3),'b-.' , 'lineWidth' , 2);
xlabel('Generation');ylabel('Fitness');
title('Compare Fittness');
legend('Best Fittness' , 'Avg Fittness');
grid on;

%%
%����BP����
 net=newff (minmax(input_train), [hiddenmun , outputnum], {'tansig' 'logsig'},'trainlm');

%��ȡ�Ŵ��㷨�Ľ��ΪBP��������Ӧ��Ȩֵ����ֵ
[W1, B1 ,W2 ,B2, input_train ,output_train, A1, A2 ,SE ,val]=gadecod(x);
net.iw { 1,1}=W1;
net.lw { 2,1}=W2;
net.b{1}=B1;
net.b{2} =B2;
%�����������
net.trainParam.epochs = 5000;
net.trainParam.lr = 0.01;
net.trainParam.goal = 0.00001;
% begin train net 
net = train(net , input_train,output_train);

%%
%Predict
out_predict = sim(net , input_train);
output_pre = mapminmax('reverse' , out_predict ,ts);
output_train = mapminmax('reverse' , output_train ,ts);
figure(2);
year = 2004:2011;
plot(year,output_pre , 'rp' , 'lineWidth' , 2);hold on;
plot(year,output_train , 'b*', 'lineWidth' , 2);
xlabel('Year');ylabel('Flow');
legend('Predict' , 'Reality');
title(['Contrast predict and reality from ' num2str(min(year)) ' to ' num2str(max(year))]);
xlim([2003 , 2012]);

error = sumsqr(output_train -  output_pre);
fprintf('Ԥ������ʵ�ʽ���ľ����2004--2011����%f\n' , error);

%%
%�����4������Ԥ��
d= load('Data.mat');
%Ԥ�������ʱ��data  = d.P
%Ԥ�������ʱ��data  = d.F
data  = d.P;
input_test = data(5:8 , 1:7);
output_test = data(5:8 , 8);
input_test = input_test';
output_test = output_test';
%��һ������
[input_test , tps] = mapminmax(input_test , 0 , 1);
[output_test , tts] = mapminmax(output_test , 0 , 1);

%----------------------------------------------------------
out_predict = sim(net , input_test);
output_pre = mapminmax('reverse' , out_predict ,tts);
output_test = mapminmax('reverse' , output_test ,tts);
figure(3);
year = 2008:2011;
plot(year,output_pre , 'rp' , 'lineWidth' , 2);hold on;
plot(year,output_test , 'b*', 'lineWidth' , 2);
xlabel('Year');ylabel('Flow');
title(['Contrast predict and reality from ' num2str(min(year)) ' to ' num2str(max(year))]);
legend('Predict' , 'Reality');
xlim([2007 , 2012]);

error = sumsqr(output_pre -  output_test) ;
fprintf('Ԥ������ʵ�ʽ���ľ����2008--2011����%f\n' , error);