%��Ӧֵ���㺯��
%�Ŵ��㷨����Ӧֵ����
function [sol, val]=gabpEval (sol, options)
%valһthe fittness of this individual
%solһthe individual, returned to allow for Lamarckian  evolution
%options-[current generation]
[input_train,ps , output_train,ts ,inputnum,hiddenmun,outputnum,data_num,lenchrom]=getBPinfo;

for i=1:lenchrom
x(i)=sol(i);
end
[W1,B1,W2,B2,input_train,output_train,A1,A2,SE,val]=gadecod(x);