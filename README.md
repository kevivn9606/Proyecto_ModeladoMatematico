# Proyecto_ModeladoMatematico
Proyecto final de la clase modelado matemático

El codigo total se encuentra en el folder principal Proyecto_ModeladoMatematico el cual consiste de dos partes contenidas en los subfolders:
- NCSR
- sparsity_lowrank_nonlocal_join_for_Superresolution

NCSR es el codigo relacionado al paper:

Weisheng Dong, Lei Zhang, Guangming Shi, and Xin Li.,"Nonlocally centralized sparse representation for image restoration", IEEE Trans. on Image Processing, vol. 22, no. 4, pp. 1620-1630, Apr. 2013.

El codigo puede ser ejecutado desde el script NCSR_IR\Superresolution_Main_Orig. Sobre este codigo se realiza la comparacion del metodo propuesto.


sparsity_lowrank_nonlocal_join_for_Superresolution es el codigo relacionado al metodo propuesto. En este codigo se plantea un problema de minimizacion incluyendo una
centralizacion no local de los codigos escasos y una minimizacion del rango de los datos para realizar super-resolucion de imagenes. El codigo fue desarrollado en base a
los siguientes papers

1. Weisheng Dong, Lei Zhang, Guangming Shi, and Xin Li.,"Nonlocally centralized sparse representation for image restoration", IEEE Trans. on Image Processing, vol. 22, no. 4, pp. 1620-1630, Apr. 2013.

2. LIU, Yang, et al. Rank minimization for snapshot compressive imaging. IEEE transactions on pattern analysis and machine intelligence, 2018.
 
El codigo puede ser ejecutado desde el script NCSR_Superresolution_ADMM. La solucion al problema de minimizacion resultante fue obtenida por medio del algoritmo
ADMM. 
