PROGRAM NR_MAIN
!-----------------------------------------------------------------------------------
IMPLICIT NONE
!-----------------------------------------------------------------------------------    
INTEGER             :: Kp , ITERMAX
INTEGER             :: NFile_Out
!
DOUBLE PRECISION    :: XX(100000)
DOUBLE PRECISION    :: FF(100000)
DOUBLE PRECISION    :: FFD(100000)
DOUBLE PRECISION    :: E
DOUBLE PRECISION    :: error
DOUBLE PRECISION    :: X0


!-----------------------------------------------------------------------------------    
X0 = 3
E = 10E-7
ITERMAX = 100000
!
NFile_Out = 1000

OPEN(NFile_Out, FILE = 'OUT_NR.m')
WRITE(NFile_Out,*) ' result = ['

XX(1) = X0
CALL function_NR(X0,FF(1))

DO Kp=1, ITERMAX
    CALL functionD_NR(XX(Kp),FFD(Kp))
    CALL function_NR(XX(Kp),FF(Kp))
    !WRITE (*,*) FF(Kp)
    error = ABS(FF(Kp))
    
    IF (error < E) THEN
     EXIT;
    END IF
    
    PRINT 106,  Kp, XX(Kp), FF(Kp), FFD(Kp), Error
    WRITE(NFile_Out, 106) Kp, XX(Kp), FF(Kp), FFD(Kp), Error
    XX(Kp+1) = XX(Kp) - FF(Kp)/FFD(Kp)
END DO
WRITE(NFile_Out,*) '];'


106 FORMAT(2X, I8, 100(5X, E16.8))
!------------------------------------------------------------------------------------------    
END PROGRAM NR_MAIN