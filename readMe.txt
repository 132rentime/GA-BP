���ƣ������Ŵ��㷨��BP������
--------------------------------------------------
���ܣ�
          �����Ŵ��㷨���е��Ż�BP�����Ȩֵ����ֵ���Ӷ�������BP�������Ż�Ȩֵ����ֵʱ����ֲ����ŵ�ȱ��

������ 
          �����Ŀ�ı���Ϊ�������ͻ�������Ԥ��

�ļ����ܣ�
1. freightFlow.xlsx  �� ���������ݼ���ǰ7��ΪӰ������������أ���8��Ϊ������
2. passengerFlow.xlsx �� ���������ݼ���ǰ7��ΪӰ������������أ���8��Ϊ������
3. Data.mat������һ���ṹ�壬��ԱPΪ�ӿ��������ݼ�����ԱFΪ���������ݼ�

����������
1. gadecod���������Ⱦɫ����룬���뷽ʽһ�������֣�ʵ������Ͷ����Ʊ��롣
                        ����Ŀ�ж�Ӧ��Ϊʵ�����룬���Ա�����ֵ��Ϊ������ֵ��
2. getBPinfo����ȡBP����Ļ�����Ϣ��
3. gabpEval��������Ӧ��
4. normInit�����ݻ�ȡ������ṹ��Data.mat
5 mainFun�������������ѵ����Ԥ��

GAOTʹ��˵����
��Ϊ��Ŀ���õ���GAOT���߰��еĺ�����������Ҫ��GAOT���߰�����·��
��������Ϊ�����GAOT�ļ�--->��ӵ�·��--->ѡ���ļ��к����ļ���
�����������оͿ��Ե���GAOT���߰��еĺ�����

��ʼ��Ⱥ�����ɺ�����
[pop]=initializega(num,bounds,eevalFN,eevalOps,options)
�����������
 pop--���ɵĳ�ʼ��Ⱥ
�����������
num--��Ⱥ�еĸ�����Ŀ
bounds--������������½�ľ���
eevalFN--��Ӧ�Ⱥ���
eevalOps--���ݸ���Ӧ�Ⱥ����Ĳ���
options--ѡ�������ʽ(���������Ƕ����Ʊ���)[precision F_or_B]
precision--�������ж����Ʊ���ʱָ���ľ���
F_or_B--Ϊ1ʱѡ�񸡵���룬����Ϊ�����Ʊ���,��precisionָ������)

�Ŵ��㷨������
[x,endPop,bPop,traceInfo]=ga(bounds,evalFN,evalOps,startPop,opts,termFN,termOps,selectFN,selectOps,xOverFNs,xOverOps,mutFNs,mutOps)
�����������
x--��õ����Ž�
endPop--���յõ�����Ⱥ
bPop--������Ⱥ��һ�������켣
traceInfo--ÿһ������õ���Ӧ�Ⱥ�ƽ����Ӧ��
�����������
bounds--����������½�ľ���
evalFN--��Ӧ�Ⱥ���
evalOps--���ݸ���Ӧ�Ⱥ����Ĳ���
startPop-��ʼ��Ⱥ
opts[epsilonprob_opsdisplay]--opts(1:2)��ͬ��initializega��options���������������������Ƿ������һ��Ϊ0����[1e-610]
termFN--��ֹ����������,��['maxGenTerm']
termOps--���ݸ���ֹ�����Ĳ���,��[100]
selectFN--ѡ����������,��['normGeomSelect']
selectOps--���ݸ�ѡ�����Ĳ���,��[0.08]
xOverFNs--���溯�����Ʊ��Կո�ֿ�����['arithXoverheuristicXoversimpleXover']
xOverOps--���ݸ����溯���Ĳ�������[20;23;20]
mutFNs--���캯������['boundaryMutationmultiNonUnifMutationnonUnifMutationunifMutation']
mutOps--���ݸ����溯���Ĳ�����,��[400;61003;41003;400]


