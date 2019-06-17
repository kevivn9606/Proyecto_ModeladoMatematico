# Proyecto_ModeladoMatematico
Proyecto final de la clase modelado matemático

El codigo total se encuentra en el folder principal Proyecto_ModeladoMatematico el cual consiste de dos partes contenidas en los subfolders:
- NCSR
- sparsity_lowrank_nonlocal_join_for_Superresolution

NCSR es el codigo relacionado al paper:

Weisheng Dong, Lei Zhang, Guangming Shi, and Xin Li.,"Nonlocally centralized sparse representation for image restoration", IEEE Trans. on Image Processing, vol. 22, no. 4, pp. 1620-1630, Apr. 2013.

El codigo puede ser ejecutado desde el script NCSR_IR\Superresolution_Main_Orig.m. Sobre este codigo se realiza la comparacion del metodo propuesto.


sparsity_lowrank_nonlocal_join_for_Superresolution es el codigo relacionado al metodo propuesto. En este codigo se plantea un problema de minimizacion incluyendo una
centralizacion no local de los codigos escasos y una minimizacion del rango de los datos para realizar super-resolucion de imagenes. El codigo fue desarrollado en base a
los siguientes papers

1. Weisheng Dong, Lei Zhang, Guangming Shi, and Xin Li.,"Nonlocally centralized sparse representation for image restoration", IEEE Trans. on Image Processing, vol. 22, no. 4, pp. 1620-1630, Apr. 2013.

2. LIU, Yang, et al. Rank minimization for snapshot compressive imaging. IEEE transactions on pattern analysis and machine intelligence, 2018.
 
El codigo puede ser ejecutado desde el script Superresolution_Main.m. La solucion al problema de minimizacion resultante fue obtenida por medio del algoritmo
ADMM. 

El codigo disponible en el folder sparsity_lowrank_nonlocal_join_for_Superresolution es una extension del codigo desarrollado por los autores: Weisheng Dong, Lei Zhang, Guangming Shi, and Xin Li en el trabajo "Nonlocally centralized sparse representation for image restoration". Este trabajo del estado del arte porpone incluir una regularizacion non-local para relajar el problema de optimizacion resultante. El codigo sparsity_lowrank_nonlocal_join_for_Superresolution correspondiente al trabajo propuesto incluye una regularizacion adicional de minimizacion del rango en base al trabajo Rank minimization for snapshot compressive imaging.  Los aportes principales sobre el codigo base consisten en:

1. Se realizaron pruebas con nuevas imagenes.

2. Se realizaron simulaciones para fijar los parametros de regularizacion adecuados (se corrierron varias simulaciones para diferentes valores de parametros).

3. (Aporte principal) inclusion de un termino de regularizacion para la minimizacion del rango. Para ello tuvo que implementarse un nuevo algoritmo de optimizacion basado en ADMM para solucionar alternadamente los subproblemas de escases no local y minimizacion del rango. Este codigo se encuentra en el script sparsity_lowrank_nonlocal_join_for_Superresolution\NCSR_Superresolution_ADMM.m 

4. Codigo adicional para verificar los resultados obtenidos (graficos y metricas).
