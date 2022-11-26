function  patching(parameter)

load 'E:\2022-8-20 TDAE\input.mat' ndata;
mode = 1;

if length(parameter) == 4
    l1 = parameter(1);
    l2 = parameter(2);
    o1 = parameter(3);
    o2 = parameter(4);
    nd_patched = yc_patch( ndata,mode,l1,l2,o1,o2 );
end

if length(parameter) == 6
    l1 = parameter(1);
    l2 = parameter(2);
    l3 = parameter(3);
    o1 = parameter(4);
    o2 = parameter(5);
    o3 = parameter(6);
    nd_patched = yc_patch3d( ndata,mode,l1,l2,l3,o1,o2,o3);
end

nd_patched = single(nd_patched);

save 'E:\2022-8-20 TDAE\input_patched.mat' nd_patched;
clear;
end

