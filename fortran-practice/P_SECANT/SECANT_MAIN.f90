PROGRAM SECANT_MAIN
!--------------------------------------------------------------------------------------------------------------------
IMPLICIT NONE
!--------------------------------------------------------------------------------------------------------------------
INTEGER             :: Kp, ITERMAX
INTEGER             :: NFile_Out
!
DOUBLE PRECISION    :: XX(100000)
DOUBLE PRECISION    :: FF(100000)
DOUBLE PRECISION    :: FFD(100000)
DOUBLE PRECISION    :: E
DOUBLE PRECISION    :: error
DOUBLE PRECISION    :: X0
DOUBLE PRECISION    :: X1
!--------------------------------------------------------------------------------------------------------------------

X0 = 1
X1 = 10
E = 10E-7
ITERMAX = 10000

NFile_Out = 1000

OPEN(NFile_Out, FILE = 'OUT_NR.m')
WRITE(NFile_Out,*) ' result = ['

XX(1) = X0
XX(2) = X1

DO Kp=1,ITERMAX
    IF (Kp==1) THEN
        CALL function_SECANT(XX(Kp),FF(Kp))
        CALL function_SECANT(XX(Kp+1),FF(Kp+1))
    ELSE
        CALL function_SECANT(XX(Kp+1),FF(Kp+1))
    END IF
    error = ABS(FF(Kp+1))
    IF (error < E) THEN 
        EXIT;
    END IF
    
    WRITE(NFIle_Out, 106) Kp, XX(Kp), FF(Kp), error
    XX(Kp+2) = XX(Kp+1)-(FF(Kp+1)/(FF(Kp+1)-FF(Kp)))*(XX(Kp+1)-XX(Kp))
END DO
WRITE(NFile_Out,*) '];'




106 FORMAT(2X, I8, 100(5X, E16.8))
!--------------------------------------------------------------------------------------------------------------------
END PROGRAM SECANT_MAIN
