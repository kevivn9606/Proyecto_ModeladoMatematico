function [ E, A] = databaseUrban()

load('end6_groundTruth.mat')
N = 256;

E           = M(1:1:162,:);
A           = reshape(A' , [nRow nCol nEnd]);
A           = reshape(A(1:1:N,1:1:N,:), [], nEnd).';

% H = zeros(N, N, nEnd);
% for i =1:nEnd
% H(:,:,i) = reshape(A(1,:), N, N);    
% end
end