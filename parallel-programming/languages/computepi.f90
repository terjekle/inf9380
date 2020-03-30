
! Simple program to compute pi using 4 * atan(1) series 
! to illustrate usage of vector units.

program computepi
  integer, parameter :: r8  = selected_real_kind(p=15,r=307)
  integer, parameter :: i8 = selected_int_kind(16)
  integer :: n, i
  real(r8) ::  sum, pi, x, h
  real(r8) :: f
  
  n = 200000000
  h = 1.0_r8/n
  sum = 0.0_r8
!$omp simd reduction(+:sum)
!This OpenMP-SIMD inform the compiler to generate vector instructions
  do i = 1,n
     x = h*(i-0.5_r8)
     sum = sum + (4.0_r8/(1.0_r8+x*x))
  enddo
  pi = h*sum
  write(*,*)"n : ",n,"Pi : ",pi
end program computepi

