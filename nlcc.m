function cormat = nlcc(wlen)
% This function realizes the nonlinear local correlation coefficient
%
% by Zhangquan Liao
% Nov., 2022

load 'E:\研究生工作\2022-8-20 TDAE\github_fast\data_for_NLC.mat' ndata data;

cormat = lcc(ndata,data,wlen);
temp = abs(cormat);
temp = (temp - min(temp,[],'all')) / (max(temp,[],'all')-min(temp,[],'all'));
cormat = (1+atan(temp*10-5)/atan(max(temp,[],'all')*10-5))/2;

end