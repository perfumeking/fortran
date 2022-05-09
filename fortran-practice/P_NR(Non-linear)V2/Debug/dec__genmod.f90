        !COMPILER-GENERATED INTERFACE MODULE: Mon May  9 17:24:03 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DEC__genmod
          INTERFACE 
            SUBROUTINE DEC(N,NDIM,A,IP,IER)
              INTEGER(KIND=4) :: NDIM
              INTEGER(KIND=4) :: N
              REAL(KIND=8) :: A(NDIM,*)
              INTEGER(KIND=4) :: IP(*)
              INTEGER(KIND=4) :: IER
            END SUBROUTINE DEC
          END INTERFACE 
        END MODULE DEC__genmod
