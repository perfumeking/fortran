PROGRAM MAIN
!------------------------------------------------------------------------------------------    
!Newton-Raphson Method for the System of Nonlinear Equations
USE Module_NR
!------------------------------------------------------------------------------------------    
IMPLICIT NONE
!------------------------------------------------------------------------------------------    
INTEGER             :: Kp
INTEGER             :: N, LDA, IPVT(1)
!
DOUBLE PRECISION    :: error
DOUBLE PRECISION    :: XX(2), FF(2), J(2,2), J_INV(2,2)
!---------------------------------------------------------------------  
!PRINT *, "-----------------------------------------------------------" 
!PRINT *, "Newton-Raphson Method for the System of Nonlinear Equations" 
!PRINT *, "-----------------------------------------------------------"
!PRINT *, "Put initial Value x0, y0"
!read(*,*) X0,Y0

XX(1) = X0(1)
XX(2) = X0(2)
IPVT(1) = 2;
N =2;
LDA = 2;

OPEN(NFile_Out, FILE = 'OUT_NR.m')
WRITE(NFile_Out,*) ' result = ['
Do Kp=1, ITERMAX
    CALL FUNC(XX(1),XX(2),FF)
    error = SQRT((FF(1)**2) + (FF(2)**2))
    PRINT*, error
    
    
    
    IF (error < E) THEN
     EXIT;
    END IF
    
    WRITE(NFile_Out, 106) Kp, XX(1), XX(2), FF(1), FF(2) , error
    
    CALL JACOBIAN(XX,H,J)
    CALL MAT_INV(J,J_INV,IPVT,N,LDA)
    XX = XX - 0.1*MATMUL(J_INV,FF)
END DO
WRITE(NFile_Out,*) '];'

106 FORMAT(2X, I8, 100(5X, E16.8))
!------------------------------------------------------------------------------------------       
END PROGRAM MAIN