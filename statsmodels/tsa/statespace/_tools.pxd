#cython: boundscheck=False
#cython: wraparound=False
#cython: cdivision=False
"""
State Space Models - Cython Tools declarations

Author: Chad Fulton  
License: Simplified-BSD
"""

cimport numpy as np

cdef validate_matrix_shape(str name, Py_ssize_t *shape, int nrows, int ncols, object nobs=*)

cdef validate_vector_shape(str name, Py_ssize_t *shape, int nrows, object nobs=*)

cdef int _ssolve_discrete_lyapunov(np.float32_t * a, np.float32_t * q, int n, int complex_step=*) except *
cdef int _dsolve_discrete_lyapunov(np.float64_t * a, np.float64_t * q, int n, int complex_step=*) except *
cdef int _csolve_discrete_lyapunov(np.complex64_t * a, np.complex64_t * q, int n, int complex_step=*) except *
cdef int _zsolve_discrete_lyapunov(np.complex128_t * a, np.complex128_t * q, int n, int complex_step=*) except *

cdef int _sldl(np.float32_t * A, int n) except *
cdef int _dldl(np.float64_t * A, int n) except *
cdef int _cldl(np.complex64_t * A, int n) except *
cdef int _zldl(np.complex128_t * A, int n) except *

cpdef int sldl(np.float32_t [::1, :] A) except *
cpdef int dldl(np.float64_t [::1, :] A) except *
cpdef int cldl(np.complex64_t [::1, :] A) except *
cpdef int zldl(np.complex128_t [::1, :] A) except *

cdef int _sreorder_missing_diagonal(np.float32_t * a, int * missing, int n)
cdef int _dreorder_missing_diagonal(np.float64_t * a, int * missing, int n)
cdef int _creorder_missing_diagonal(np.complex64_t * a, int * missing, int n)
cdef int _zreorder_missing_diagonal(np.complex128_t * a, int * missing, int n)

cdef int _sreorder_missing_submatrix(np.float32_t * a, int * missing, int n)
cdef int _dreorder_missing_submatrix(np.float64_t * a, int * missing, int n)
cdef int _creorder_missing_submatrix(np.complex64_t * a, int * missing, int n)
cdef int _zreorder_missing_submatrix(np.complex128_t * a, int * missing, int n)

cdef int _sreorder_missing_rows(np.float32_t * a, int * missing, int n, int m)
cdef int _dreorder_missing_rows(np.float64_t * a, int * missing, int n, int m)
cdef int _creorder_missing_rows(np.complex64_t * a, int * missing, int n, int m)
cdef int _zreorder_missing_rows(np.complex128_t * a, int * missing, int n, int m)

cdef int _sreorder_missing_cols(np.float32_t * a, int * missing, int n, int m)
cdef int _dreorder_missing_cols(np.float64_t * a, int * missing, int n, int m)
cdef int _creorder_missing_cols(np.complex64_t * a, int * missing, int n, int m)
cdef int _zreorder_missing_cols(np.complex128_t * a, int * missing, int n, int m)

cpdef int sreorder_missing_matrix(np.float32_t [::1, :, :] A, int [::1, :] missing, int reorder_rows, int reorder_cols, int diagonal) except *
cpdef int dreorder_missing_matrix(np.float64_t [::1, :, :] A, int [::1, :] missing, int reorder_rows, int reorder_cols, int diagonal) except *
cpdef int creorder_missing_matrix(np.complex64_t [::1, :, :] A, int [::1, :] missing, int reorder_rows, int reorder_cols, int diagonal) except *
cpdef int zreorder_missing_matrix(np.complex128_t [::1, :, :] A, int [::1, :] missing, int reorder_rows, int reorder_cols, int diagonal) except *

cpdef int sreorder_missing_vector(np.float32_t [::1, :] A, int [::1, :] missing) except *
cpdef int dreorder_missing_vector(np.float64_t [::1, :] A, int [::1, :] missing) except *
cpdef int creorder_missing_vector(np.complex64_t [::1, :] A, int [::1, :] missing) except *
cpdef int zreorder_missing_vector(np.complex128_t [::1, :] A, int [::1, :] missing) except *