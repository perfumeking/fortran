        !COMPILER-GENERATED INTERFACE MODULE: Mon May  9 16:46:57 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SOL__genmod
          INTERFACE 
            SUBROUTINE SOL(N,NDIM,A,B,IP)
              INTEGER(KIND=4) :: NDIM
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: A(NDIM,*)
              REAL(KIND=8) :: B(*)
              INTEGER(KIND=4) :: IP(*)
            END SUBROUTINE SOL
          END INTERFACE 
        END MODULE SOL__genmod
