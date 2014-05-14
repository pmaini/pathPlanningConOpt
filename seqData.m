function [Ri Ui mi Incpti] = seqData(tZone,edge)
    tz_side=mod(edge,10);
    tz_num=floor(edge/10);

    switch tz_side
        case 1
            Ri = tZone(tz_num).Xt(1);
            Ui = tZone(tz_num).Xt(2);
            dy = tZone(tz_num).Yt(2)-tZone(tz_num).Yt(1);
            dx = tZone(tz_num).Xt(2)-tZone(tz_num).Xt(1);
            mi = dy/dx;
            Incpti = tZone(tz_num).Yt(2) - (mi*tZone(tz_num).Xt(2));
        case 2
            Ri = tZone(tz_num).Xt(2);
            Ui = tZone(tz_num).Xt(3);
            dy = tZone(tz_num).Yt(3)-tZone(tz_num).Yt(2);
            dx = tZone(tz_num).Xt(3)-tZone(tz_num).Xt(2);
            mi = dy/dx;
            Incpti = tZone(tz_num).Yt(3) - (mi*tZone(tz_num).Xt(3));
        case 3
            Ri = tZone(tz_num).Xt(1);
            Ui = tZone(tz_num).Xt(3);            
            dy = tZone(tz_num).Yt(1)-tZone(tz_num).Yt(3);
            dx = tZone(tz_num).Xt(1)-tZone(tz_num).Xt(3);            
            mi = dy/dx;
            Incpti = tZone(tz_num).Yt(1) - (mi*tZone(tz_num).Xt(1));
    end