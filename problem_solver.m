function [Time Theta Coordnts] = problem_solver(params)

Xod = params.Xod;
Yod = params.Yod;
R = params.R;
U = params.U;
m = params.m;
Incpt = params.Incpt;
C = params.C;
n = params.n;
problem = params.problem;
script_param = params.script_param;

one1 = ones(1,n+1);

switch (problem)
    case 1
        cObj = C;
        cCons = one1;
        Time = script_param;
    case 2
        cObj = one1;
        cCons = C;
        Theta = script_param;        
end

cvx_begin

variable Vect(2,n)

minimize(sum(cObj.*norms([Vect(1,:) Xod(2);Vect(2,:) Yod(2)] - [Xod(1) Vect(1,:); Yod(1) Vect(2,:)],2)))

subject to

    R <= Vect(1,:)' <= U    
    Vect(2,:)' == m.*Vect(1,:)' + Incpt
    

    sum(cCons.*norms([Vect(1,:) Xod(2);Vect(2,:) Yod(2)] - [Xod(1) Vect(1,:); Yod(1) Vect(2,:)],2)) <= script_param
    
cvx_end

switch (params.index)
    case 1
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'r');
    case 2 
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'b');
    case 3 
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'m');
    case 4
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'r');
    case 5 
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'b');
    case 6 
        plot([Xod(1) Vect(1,:) Xod(2)],[Yod(1) Vect(2,:) Yod(2)],'m');
end

switch (problem)
    case 1
        Theta = cvx_optval;
    case 2
        Time = cvx_optval;
end

Coordnts = Vect;