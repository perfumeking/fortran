        !COMPILER-GENERATED INTERFACE MODULE: Mon May  9 16:46:57 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MAT_INV__genmod
          INTERFACE 
            SUBROUTINE MAT_INV(AMAT,A_INV,IPVT,N,LDA)
              INTEGER(KIND=4) :: LDA
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: AMAT(LDA,*)
              REAL(KIND=8) :: A_INV(LDA,*)
              INTEGER(KIND=4) :: IPVT(*)
            END SUBROUTINE MAT_INV
          END INTERFACE 
        END MODULE MAT_INV__genmod
