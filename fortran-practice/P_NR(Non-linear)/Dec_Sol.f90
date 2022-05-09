      SUBROUTINE DEC (N, NDIM, A, IP, IER)      !YSUSE
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
! VERSION REAL DOUBLE PRECISION
!      INTEGER N,NDIM,IP,IER,NM1,K,KP1,M,I,J
!      DOUBLE PRECISION A,T
      DIMENSION A(NDIM,*), IP(*)
!-----------------------------------------------------------------------
!  MATRIX TRIANGULARIZATION BY GAUSSIAN ELIMINATION.
!  INPUT..
!     N = ORDER OF MATRIX.
!     NDIM = DECLARED DIMENSION OF ARRAY  A .
!     A = MATRIX TO BE TRIANGULARIZED.
!  OUTPUT..
!     A(I,J), I.LE.J = UPPER TRIANGULAR FACTOR, U .
!     A(I,J), I.GT.J = MULTIPLIERS = LOWER TRIANGULAR FACTOR, I - L.
!     IP(K), K.LT.N = INDEX OF K-TH PIVOT ROW.
!     IP(N) = (-1)**(NUMBER OF INTERCHANGES) OR O .
!     IER = 0 IF MATRIX A IS NONSINGULAR, OR K IF FOUND TO BE
!           SINGULAR AT STAGE K.
!  USE  SOL  TO OBTAIN SOLUTION OF LINEAR SYSTEM.
!  DETERM(A) = IP(N)*A(1,1)*A(2,2)*...*A(N,N).
!  IF IP(N)=O, A IS SINGULAR, SOL WILL DIVIDE BY ZERO.
!
!  REFERENCE..
!     C. B. MOLER, ALGORITHM 423, LINEAR EQUATION SOLVER,
!     C.A.C.M. 15 (1972), P. 274.
!-----------------------------------------------------------------------
      IER = 0
      IP(N) = 1
      IF (N .EQ. 1) GO TO 70
      NM1 = N - 1
      DO 60 K = 1,NM1
        KP1 = K + 1
        M = K
        DO 10 I = KP1,N
          IF (DABS(A(I,K)) .GT. DABS(A(M,K))) M = I
 10     CONTINUE
        IP(K) = M
        T = A(M,K)
        IF (M .EQ. K) GO TO 20
        IP(N) = -IP(N)
        A(M,K) = A(K,K)
        A(K,K) = T
 20     CONTINUE
        IF (T .EQ. 0.D0) GO TO 80
        T = 1.D0/T
        DO 30 I = KP1,N
 30       A(I,K) = -A(I,K)*T
        DO 50 J = KP1,N
          T = A(M,J)
          A(M,J) = A(K,J)
          A(K,J) = T
          IF (T .EQ. 0.D0) GO TO 45
          DO 40 I = KP1,N
 40         A(I,J) = A(I,J) + A(I,K)*T
 45       CONTINUE
 50       CONTINUE
 60     CONTINUE
 70   K = N
      IF (A(N,N) .EQ. 0.D0) GO TO 80
      RETURN
 80   IER = K
      IP(N) = 0
      RETURN
!----------------------- END OF SUBROUTINE DEC -------------------------
      END
!
!
      SUBROUTINE SOL (N, NDIM, A, B, IP)        !YSUSE
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
! VERSION REAL DOUBLE PRECISION
!      INTEGER N,NDIM,IP,NM1,K,KP1,M,I,KB,KM1
!      DOUBLE PRECISION A,B,T
      DIMENSION A(NDIM,*), B(*), IP(*)
!-----------------------------------------------------------------------
!  SOLUTION OF LINEAR SYSTEM, A*X = B .
!  INPUT..
!    N = ORDER OF MATRIX.
!    NDIM = DECLARED DIMENSION OF ARRAY  A .
!    A = TRIANGULARIZED MATRIX OBTAINED FROM DEC.
!    B = RIGHT HAND SIDE VECTOR.
!    IP = PIVOT VECTOR OBTAINED FROM DEC.
!  DO NOT USE IF DEC HAS SET IER .NE. 0.
!  OUTPUT..
!    B = SOLUTION VECTOR, X .
!-----------------------------------------------------------------------
      IF (N .EQ. 1) GO TO 50
      NM1 = N - 1
      DO 20 K = 1,NM1
        KP1 = K + 1
        M = IP(K)
        T = B(M)
        B(M) = B(K)
        B(K) = T
        DO 10 I = KP1,N
 10       B(I) = B(I) + A(I,K)*T
 20     CONTINUE
      DO 40 KB = 1,NM1
        KM1 = N - KB
        K = KM1 + 1
        B(K) = B(K)/A(K,K)
        T = -B(K)
        DO 30 I = 1,KM1
 30       B(I) = B(I) + A(I,K)*T
 40     CONTINUE
 50   B(1) = B(1)/A(1,1)
      RETURN
!----------------------- END OF SUBROUTINE SOL -------------------------
      END