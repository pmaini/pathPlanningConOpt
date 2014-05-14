close all
clear all

global numtZone tZone Xod Yod;

params = struct();

UI;
params.Xod = Xod;
params.Yod = Yod;
subpath = struct([]);

%seq is encoded as 10*t_zone number + side number
seq{1,1} = [01,11,21,23,13,31,43,42,32,51,61,02];

seq{1,2} = [01,11,21,23,12,33,43,42,32,51,61,02];

seq{1,3} = [01,11,21,21,12,33,43,42,32,51,61,02];
seq{1,4} = [01,11,21,23,13,31,41,42,32,51,61,02];

seq{1,5} = [01,11,21,23,13,33,43,42,32,51,61,02];

seq{1,6} = [01,11,21,21,12,33,43,42,32,52,61,02];


printStr1 = 'Time: '; 
printStr2 = 'Risk:  ';
% h1 = text(0.5,28,printStr1,'FontSize',10);
% h2 = text(0.5,26,printStr2,'FontSize',8);
printStr1 = 'Time: '; 
printStr2 = 'Risk:  ';
optThetaOld = 78;
optTimeOld = 80;
for index = 4:4%length(seq)
%     for new_index = 1:3
    
   params.index = index;
    TimeTheta = [29 36];%for constraint using prob no as index
    optTime = 30;
    optTheta = 59;
%     optThetaOld = 78;
    condition = (abs(optTime - optTimeOld)<0.0002);
%     delete(h1);
%     delete(h2);
while (~condition)%for index = 1:1%length(seq)
    pause(1);
    seq1 = seq{1,index};%index};

    
    [R U m Incpt] = getSeqData(tZone,seq1);

    params.R = R;
    params.U = U;
    params.m = m;
    params.Incpt = Incpt;

    subpath = getSubpaths(subpath, seq1);

    params.C = [subpath(1:end).tParam];
    params.n = length(seq1) - 2;
    params.problem = 2;
    params.script_param = TimeTheta(params.problem);%constrnt;
%     if (params.index==2)
%         params.problem = 2;
%         params.script_param = optThetaOld;%constrnt;
%     elseif (params.index == 3)
%         params.script_param = optTimeOld;
%     end
%     condition1 = ((TimeTheta(1) - optTimeTheta(2))<0.0002);
%     condition2 = ((TimeTheta(2) - optTimeTheta(1))<0.0002);
    
%     while(~((condition1)&&(condition2)))
%         
%         condition1 = ((TimeTheta(1) - optTimeTheta(2))<0.0002);
%         condition2 = ((TimeTheta(2) - optTimeTheta(1))<0.0002);
%         pause(1);
%         params.problem = 3-params.problem;%problem_no;
%         if (optTimeTheta(3-params.problem) ~= inf)
%             TimeTheta(params.problem) = optTimeTheta(3-params.problem);
%         else
%             TimeTheta(params.problem) = TimeTheta(params.problem) + 5;
%         end
        
        TimeTheta(params.problem) = TimeTheta(params.problem)+0.25;
        
    
        [optTime optTheta Coordnts] = problem_solver(params);
        
        condition = (abs(optTime - optTimeOld)<0.0002);
%         if (condition == 1)
%             optTime = optTime-0.1;
%         end
        optThetaOld = optTheta;
        optTimeOld = optTime;
        
        printStr1 = [printStr1 ' ' num2str(optTime)];
        printStr2 = [printStr2 '  ' num2str(optTheta)];
% %     end
    h1 = text(0.5,28,printStr1,'FontSize',10);
    h2 = text(1,26,printStr2,'FontSize',8);
    
end 
% 
%         printStr1 = [printStr1 ' ' num2str(optTime)];
%         printStr2 = [printStr2 '  ' num2str(optTheta)];
%     h1 = text(0.5,28,printStr1,'FontSize',10);
%     h2 = text(1,26,printStr2,'FontSize',8);
%     end
end
    h1 = text(0.5,28,printStr1,'FontSize',10);
    h2 = text(1,26,printStr2,'FontSize',8);