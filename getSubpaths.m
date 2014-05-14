function subpath = getSubpaths(subpath, seq1)

global numtZone tZone;

tZoneStack = zeros();
tos = 1;%points to the last filled slot
tZoneDetCounter = zeros(numtZone,1);%counter telling number of detections of each threat zone
subpathSerial = 0;%current sub path number
serialTZBdet = 0;%serial number of the threat zone  whose boundary has been detected
started = 0;%started
reachedDest = 0;%reached destination

for index = 1:length(seq1)
    subpathSerial = subpathSerial + 1;
    edge = seq1(index);
    serialTZBdet = floor(edge/10);
    switch(serialTZBdet)
        case 0
            if edge==01
                started = 1;
            elseif edge==02
                reachedDest = 1;
                break;
            end
        otherwise
            tZoneDetCounter(serialTZBdet) = tZoneDetCounter(serialTZBdet) + 1;
            flag1 = mod(tZoneDetCounter(serialTZBdet),2);
            if flag1 == 1
                [tZoneStack, tos] = Push2Stack(tZoneStack,tos,serialTZBdet);
            elseif flag1 == 0
                [tZoneStack, tos, value] = Pop4mStack(tZoneStack, tos);
            end
    end
    subpath(subpathSerial).number = subpathSerial;
    subpath(subpathSerial).sptos = tos;
    subpath(subpathSerial).stack = tZoneStack;
    subpath(subpathSerial).tZone = tZoneStack(tos);
    subpath(subpathSerial).detCount = tZoneDetCounter;
end

for index = 1:length(subpath)
    
    if subpath(index).tZone==0
        subpath(index).tParam = 1.0;
    else
        subpath(index).tParam = tZone(subpath(index).tZone).tp;
    end    
end