SUBROUTINE FUNC(XX,YY,FF) 
!------------------------------------------------------------------------------------------    
IMPLICIT NONE
!------------------------------------------------------------------------------------------    
! F_1 = 3x+2y+5
! F_2 = -3xy+3x^2 +y
DOUBLE PRECISION    ::  FF(2), XX, YY
!------------------------------------------------------------------------------------------    

FF(1) = 3*XX + 2*YY + 5
FF(2) = -3*XX*YY + 3*XX**3 + 5

RETURN
END