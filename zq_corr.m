function coeff = zq_corr(X,Y)
% This function realizes the cross correlation coefficient
% The input can be of any dimension
% 
% by Zhangquan Liao
% Nov., 2022

if ndims(X)~=ndims(Y)
    error('The dimensions of both inputs should be the same!');
    return;
end

X_hat = mean(X,'all');
Y_hat = mean(Y,'all');
X_1 = X - X_hat;
Y_1 = Y - Y_hat;
A = sum(X_1.*Y_1,'all');
B = sqrt(sum(X_1.*X_1,'all')*sum(Y_1.*Y_1,'all'));
coeff = A/B;

end