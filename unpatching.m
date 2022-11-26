function  unpatching(parameter)

load 'E:\2022-8-20 TDAE\input.mat' ndata;
load 'E:\2022-8-20 TDAE\output_patched.mat' d_patched;
mode = 1;

if length(parameter) == 4
    [n1,n2] = size(ndata);
    clear nd;
    l1 = parameter(1);
    l2 = parameter(2);
    o1 = parameter(3);
    o2 = parameter(4);
    data = yc_patch_inv( d_patched,mode,n1,n2,l1,l2,o1,o2 );
end

if length(parameter) == 6
    [n1,n2,n3] = size(ndata);
    clear nd;
    l1 = parameter(1);
    l2 = parameter(2);
    l3 = parameter(3);
    o1 = parameter(4);
    o2 = parameter(5);
    o3 = parameter(6);
    data = yc_patch3d_inv( d_patched,mode,n1,n2,n3,l1,l2,l3,o1,o2,o3 );
end

data = single(data);

save 'E:\2022-8-20 TDAE\output.mat' data;
clear;
end

