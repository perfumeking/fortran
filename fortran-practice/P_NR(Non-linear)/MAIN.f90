PROGRAM MAIN
!------------------------------------------------------------------------------------------    
!Newton-Raphson Method for the System of Nonlinear Equations
!------------------------------------------------------------------------------------------    
IMPLICIT NONE
!------------------------------------------------------------------------------------------    
INTEGER             :: Kp , ITERMAX
INTEGER             :: NFile_Out
!
DOUBLE PRECISION    :: error, X0, Y0
DOUBLE PRECISION    :: XX(1000)
DOUBLE PRECISION    :: YY(1000)
DOUBLE PRECISION    :: FF(1000)
DOUBLE PRECISION    :: J
DOUBLE PRECISION    :: h
!---------------------------------------------------------------------  
!PRINT *, "-----------------------------------------------------------" 
!PRINT *, "Newton-Raphson Method for the System of Nonlinear Equations" 
!PRINT *, "-----------------------------------------------------------"
!PRINT *, "Put initial Value x0, y0"
!read(*,*) X0,Y0

X0 = 3
Y0 = 10
E = 10E-7
ITERMAX = 1000
h = 0.001
DIMENSION J(ITERMAX,2,2)
NFile_Out = 1000
OPEN(NFile_Out, FILE = 'OUT_NR.m')
WRITE(NFile_Out,*) ' result = ['
XX(1) = X0
YY(1) = Y0
FF(1)
Do Kp=1, ITERMAX
    CALL FUNC(


!------------------------------------------------------------------------------------------       

PROGRAM MAIN END