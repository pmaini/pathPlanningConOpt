function [tZoneStack tos value] = Pop4mStack(tZoneStack, tos)
    if tos>1
        value = tZoneStack(tos);
        tZoneStack(tos) = [];
        tos = tos - 1;
    elseif tos==1
        msgbox('tos = 1: pop operation not allowed');
    end