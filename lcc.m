function cormat=lcc(ndata,data, wlen)
% This function realizes the local correlation coefficient
% The input can be of 2D/3D dimension
%
% by Zhangquan Liao
% Nov., 2022

if ndims(ndata)~=ndims(data)
    error('The dimensions of the first and second inputs should be the same!');
    return;
end

if ndims(ndata)==2
    wlen1=wlen(1);
    wlen2=wlen(2);
    % wlen=5;
    [m,n]=size(ndata);
    cormat=zeros(m,n);
    temp1=zeros(m+wlen1-1,n+wlen2-1);
    temp2=temp1;
    start1 = (wlen1-1)/2;
    start2 = (wlen2-1)/2;
    temp1((wlen1-1)/2+1:(wlen1-1)/2+m,(wlen2-1)/2+1:(wlen2-1)/2+n)=data;
    temp2((wlen1-1)/2+1:(wlen1-1)/2+m,(wlen2-1)/2+1:(wlen2-1)/2+n)=ndata-data;
    
    k1=0;
    for i=(start1+1):(start1+m)
        k2=0;
        k1=k1+1;
        for j=(start2+1):(start2+n)
            k2=k2+1;
            w1 = temp1(i-start1:i+start1,j-start2:j+start2);
            w2 = temp2(i-start1:i+start1,j-start2:j+start2);
            cormat(k1,k2) = zq_corr(w1,w2);
        end
    end
end

if ndims(ndata)==3
    wlen1=wlen(1);
    wlen2=wlen(2);
    wlen3=wlen(3);
    % wlen=5;
    [m,n,o]=size(ndata);
    cormat=zeros(m,n,o);
    temp1=zeros(m+wlen1-1,n+wlen2-1,o+wlen3-1);
    temp2=temp1;
    start1 = (wlen1-1)/2;
    start2 = (wlen2-1)/2;
    start3 = (wlen3-1)/2;
    temp1(start1+1:start1+m,start2+1:start2+n,start3+1:start3+o)=data;
    temp2(start1+1:start1+m,start2+1:start2+n,start3+1:start3+o)=ndata-data;
    
    k1=0;
    for i=(start1+1):(start1+m)
        k2=0;
        k1=k1+1;
        for j=(start2+1):(start2+n)
            k3=0;
            k2=k2+1;
            for k=(start3+1):(start2+o)
                k3=k3+1;
                w1 = temp1(i-start1:i+start1,j-start2:j+start2,k-start3:k+start3);
                w2 = temp2(i-start1:i+start1,j-start2:j+start2,k-start3:k+start3);
                cormat(k1,k2,k3) = zq_corr(w1,w2);
            end
        end
    end
end

end