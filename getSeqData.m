function [R U m Incpt] = getSeqData(tZone,seq1)

R = [];
U = [];
m = [];
Incpt = [];

for index = 2:length(seq1)-1    
    [Ri Ui mi Incpti] = seqData(tZone,seq1(index));
    R = [R ;Ri];
    U = [U ;Ui];
    m = [m ;mi];
    Incpt = [Incpt ;Incpti];
end