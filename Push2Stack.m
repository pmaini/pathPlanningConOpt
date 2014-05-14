function [tZoneStack tos] = Push2Stack(tZoneStack, tos, value)
    tZoneStack = [tZoneStack value];
    tos = tos + 1;