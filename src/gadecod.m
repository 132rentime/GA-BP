%BP��������Ӧ��Ȩֵ����ֵ����ͨ���Ŵ��㷨ʵ���������
function [W1,B1,W2,B2,input_train,output_train,A1,A2,SE,fitval]=gadecod(x)
%x                                       input������
%W1                                  output������㵽�����Ȩֵ
%B1                                    output��������Ԫ��ֵ
%W2                                  output�����㵽�����Ȩֵ
%B2                                   output���������Ԫ��ֵ
%input_train                    output����һ��������ѵ������
%output_train                 output����һ����Ŀ�����ѵ������
%A1                                   output��
%A2                                   output��
%SE                                    output��������
%fitval                                output����Ӧ��
[input_train,ps, output_train,ts ,inputnum,hiddenmun,outputnum,data_num,lenchrom]=getBPinfo;
%ǰinputnum*hiddenmun������ΪW1
for i=1:hiddenmun
    for k=1:inputnum
        W1(i, k)=x(inputnum*(i-1)+k);
    end
end

%���ŵ�hiddenmun*outputnum������(����inputnum*hiddenmun����ı���)ΪW2
for i=1:outputnum
    for k=1:hiddenmun
        W2(i,k) =x(hiddenmun*(i-1)+k+inputnum*hiddenmun);
    end
end

%���ŵ�hiddenmun������(����inputnum*hiddenmun+hiddenmun*outputnum����ı���)ΪB1
for i=1:hiddenmun,
    B1(i,1) =x((inputnum*hiddenmun+hiddenmun*outputnum)+i);
end

%���ŵ�outputnum������(����inputnum*hiddenmun+hiddenmun*outputnum+hiddenmun����ı���)ΪB2
for i=1:outputnum
    B2(i,1) =x((inputnum*hiddenmun+hiddenmun*outputnum+hiddenmun)+i);
end

B11=B1;
B22=B2;
for i=1:data_num-1
    B11=[B11 B1];
    B22=[B22 B2];
end
%����hiddenmun��outputnum������
A1=tansig(W1*input_train-B11);
A2=logsig(W2*A1-B22);
%�������ƽ����
SE=sumsqr(output_train-A2);
fitval=1/SE;%�Ŵ��㷨����Ӧֵ
