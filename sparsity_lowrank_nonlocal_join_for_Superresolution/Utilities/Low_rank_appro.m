function   [dim, wei, U_arr]  =  Low_rank_appro(nim, par, blk_arr, U_arr, it, flag)
b            =   par.win;
[h, w, ch]    =   size(nim);
N            =   h-b+1;
M            =   w-b+1;
r            =   [1:N];
c            =   [1:M]; 

X            =   Im2Patch( nim, par );
Ys           =   zeros( size(X) );        
W            =   zeros( size(X) );
L            =   size(blk_arr,2);
T            =   4; 
for  i  =  1 : L
    B          =   X(:, blk_arr(:, i));
    if it==1 || mod(it, T)==0
        % [tmp_y, tmp_w, U_arr(:,i)]   =   Weighted_SVT( double(B), par.c1, par.nSig^2, flag, par.c0 );
        [tmp_y, tmp_w, U_arr(:,i)]   =   Weighted_SVT( double(B), par.c11, 5, flag, par.c0 );
    else
        % [tmp_y, tmp_w]   =   Weighted_SVT_fast( double(B), par.c1, par.nSig^2, U_arr(:,i), flag, par.c0 );
        % [tmp_y, tmp_w]   =   Weighted_SVT_fast( double(B), par.c11, 5, U_arr(:,i), flag, par.c0 );
        [tmp_y, tmp_w, U_arr(:,i)]   =   Weighted_SVT( double(B), par.c11, 5, flag, par.c0 );
    end
    Ys(:, blk_arr(:,i))   =   Ys(:, blk_arr(:,i)) + tmp_y;
    W(:, blk_arr(:,i))    =   W(:, blk_arr(:,i)) + tmp_w;
end

dim     =  zeros(h,w);
wei     =  zeros(h,w);
k       =   0;
for i  = 1:b
    for j  = 1:b
        k    =  k+1;
        dim(r-1+i,c-1+j)  =  dim(r-1+i,c-1+j) + reshape( Ys(k,:)', [N M]);
        wei(r-1+i,c-1+j)  =  wei(r-1+i,c-1+j) + reshape( W(k,:)', [N M]);
    end
end
return;



function  [X, W, U]   =   Weighted_SVT( Y, c11, nsig2, flag, c0 )
c11                =   c11*sqrt(2);
[U0,Sigma0,V0]    =   svd(full(Y),'econ');  
Sigma0            =   diag(Sigma0);
if flag==1
    S                 =   max( Sigma0.^2/size(Y, 2), 0 );
    thr               =   c11*nsig2./ ( sqrt(S) + eps );
    S                 =   soft(Sigma0, thr);
else  % use nuclear norm
    S                 =   soft(Sigma0, c0*nsig2);
end
r                 =   sum( S>0 );
U                 =   U0(:,1:r);
V                 =   V0(:,1:r);
X                 =   U*diag(S(1:r))*V';

% Weighted the reconstructed patches using the weights computed using the
% matrix ranks slightly improve the final results (less than 0.2 dB)
if r==size(Y,1)
    wei           =   1/size(Y,1);   % 1;
else
    wei           =   (size(Y,1)-r)/size(Y,1);  % 1;
end
W                 =   wei*ones( size(X) );
X                 =   X*wei;
U                 =   U0(:);
return;


%--------------------------------------------------------------------------
%- This function uses the PCA matrixes obtained in the previous iterations
%- to save computational complexity
%--------------------------------------------------------------------------
function  [X, W]   =   Weighted_SVT_fast( Y, c11, nsig2, U0, flag, c0 )
c11                =   c11*sqrt(2);
n                 =   sqrt(length(U0));
U0                =   reshape(U0, n, n);
A                 =   U0'*Y;
Sigma0            =   sqrt( sum(A.^2, 2) );
V0                =   (diag(1./Sigma0)*A)';

if flag==1
    S                 =   max( Sigma0.^2/size(Y, 2) - 0*nsig2, 0 );
    thr               =   c11*nsig2./ ( sqrt(S) + eps );
    S                 =   soft(Sigma0, thr);
else  
    S                 =   soft(Sigma0, c0*nsig2);
end
r                 =     sum( S>0 );
P                 =     find(S);
X                 =     U0(:,P)*diag(S(P))*V0(:,P)';
if r==size(Y,1)
    wei           =     1/size(Y,1);  % 1;
else
    wei           =     (size(Y,1)-r)/size(Y,1);  %  1;
end
W                 =     wei*ones( size(X) );
X                 =     X*wei;
return;
