PROGRAM EX_main
!-----------------------------------------------------------------------------------
USE Module01_Ex
!-----------------------------------------------------------------------------------
IMPLICIT NONE    
!-----------------------------------------------------------------------------------    
DOUBLE PRECISION :: XX(100000)
!
INTEGER          :: No_XX, K
DOUBLE PRECISION, DIMENSION (:)  , ALLOCATABLE :: XX_A, FF
!-----------------------------------------------------------------------------------    
OPEN(10, FILE = 'OUT_Ex.m')

WRITE(10,*) ' a=['

No_XX = (XX_f - XX_0)/Dx + 2

ALLOCATE(XX_A(No_XX),FF(No_XX))
    
DO K=1,No_XX
    XX_A(K) = XX_0  + Dx*(K-1)
END DO    

DO K=1, No_XX
    CALL EX_function(XX_A(K), FF(K))
    WRITE(*,*) XX_A(K), FF(K)
    WRITE(10,100) XX_A(K), FF(K)
END DO    

WRITE(10,*) ' ];'

    
100 FORMAT(2X,100(E12.6,1X)) 

    
!-----------------------------------------------------------------------------------  
END PROGRAM EX_main