clc;
clear;
close all;
clear data;
color_map=importdata('./RdGy_color_map.txt');
RdGy=color_map(:,1:3);
%% synth 1
load sigmoid.mat;
load sigmoid_nd.mat;
load sigmoid_TDAE.mat;
[time,trace] = size(d);
simpleRate = 250;
xcor = (1:time)/simpleRate;
ycor = (1:trace);
lim = 4;
slim = 1;
map = RdGy;
smap = 'jet';

wlen = [10,10,5];
tic;
TDlcc = lcc(nd,TDdata, wlen);
toc;

figure();
ha = tight_subplot(2,2,[0.1 0.1],[0.1 0.1],[0.1 0.1]);
axes(ha(1));imagesc(ycor,xcor,nd,[-lim lim]);colormap(ha(1),map);xlabel('Trace');ylabel('Time(s)');
axes(ha(2));imagesc(ycor,xcor,TDdata,[-lim lim]);colormap(ha(2),map);xlabel('Trace');ylabel('Time(s)');
axes(ha(3));imagesc(ycor,xcor,nd-TDdata,[-lim lim]);colormap(ha(3),map);xlabel('Trace');ylabel('Time(s)');
axes(ha(4));imagesc(ycor,xcor,TDlcc,[-slim slim]);colormap(ha(4),smap);xlabel('Trace');ylabel('Time(s)');
snrN = SNR(d,TDdata);
disp(['nd snr: ',num2str(snrN)]);
%% synth2 3D
load synth3D.mat;
load synth3D_nd.mat;
load synth3D_nd_TDAE.mat;

TDn = nd - TDdata;

wlen = [5,5,5];
tic;
TDlcc = lcc(nd,TDdata, wlen);
toc;

lim = 0.4;
slim = 1;
map = RdGy;
smap = 'jet';

figure();
ha = tight_subplot(2,2,[0.1 0.1],[0.1 0.1],[0.1 0.1]);
axes(ha(1));seismic_plot_3D(nd);colormap(ha(1),map);colorbar()
caxis([-lim lim]);xlabel('Inline');ylabel('Crossline');zlabel('Time sample');
axes(ha(2));seismic_plot_3D(TDdata);colormap(ha(2),map);colorbar()
caxis([-lim lim]);xlabel('Inline');ylabel('Crossline');zlabel('Time sample');
axes(ha(3));seismic_plot_3D(nd-TDdata);colormap(ha(3),map);colorbar()
caxis([-lim lim]);xlabel('Inline');ylabel('Crossline');zlabel('Time sample');
axes(ha(4));seismic_plot_3D(TDlcc);colormap(ha(4),smap);colorbar()
caxis([-slim slim]);xlabel('Inline');ylabel('Crossline');zlabel('Time sample')
snrN = zq_snr(d,TDdata);
disp(['nd snr: ',num2str(snrN)]);
