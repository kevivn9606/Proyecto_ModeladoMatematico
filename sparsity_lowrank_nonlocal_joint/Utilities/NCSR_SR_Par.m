function  par  =  NCSR_SR_Par( nSig, scale, psf )
if nSig==0   
    par.t1        =   0.35; 
    par.c1        =   1.55;
    par.lamada    =   7;
    par.n         =   5;
else
    par.t1        =   0.019*nSig^2; 
    par.c1        =   0.21;
    par.lamada    =   1.0;
    par.n         =   3;
end
par.psf       =   psf;
par.scale     =   scale;
par.nSig      =   nSig;
par.iters     =   160;
par.nblk      =   45;   % 12
par.N         =   20;   % 20
par.sigma     =   1.4;    
par.eps       =   0.3;
par.method    =   1;
par.beta      =   0.01;
par.c1        =   1.95;  % 1.55
par.c0        =   0.01;  % 0.49
par.K0        =   3;

