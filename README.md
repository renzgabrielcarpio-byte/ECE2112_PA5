# ECE2112_PA4
## EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING
CARPIO, Renz Gabriel P.  |  2ECE-A

I. OBJECTIVES
1. Create real and complex matrices in MATLAB;
2. Distinguish transpose from complex-conjugate transpose operations;
3. Express a simultaneous linear system in matrix form; and
4. Solve and check a linear system using the inverse method and Cramer’s Rule.


II. INSTRUCTIONS

Write a MATLAB script containing clearly labeled sections for both problems. Display the requested matrices and numerical checks. Use MATLAB matrix operations and built-in functions; do not type a computed answer directly into the output.


# **A. TRANSPOSE OPERATIONS**

Define a real matrix `R` and a complex matrix `Z` exactly as specified. For both matrices, compute and evaluate three transpose representations: `transpose(A)`, the apostrophe operator `A'`, and the dot-apostrophe operator `A.'`.

The following functions and operators were used in this problem:

• `transpose(A)` - a built-in MATLAB function that returns the non-conjugate transpose of matrix `A`, interchanging row and column indices without altering imaginary components.

• `A.'` - the dot-apostrophe operator in MATLAB representing the array transpose (unconjugated transpose).

• `A'` - the standard apostrophe operator representing the complex-conjugate transpose (Hermitian transpose), which interchanges rows and columns and replaces every complex entry with its complex conjugate.

Combining these operations along with the required commentary, the implementation for this problem is as follows:

```matlab
%% PROBLEM A: TRANSPOSE OPERATIONS

% Define matrices
R = [ 5, -2,  0,  7;
      1,  3, -4,  2;
      6,  0,  8, -1 ];

Z = [ 2+3i, -1+4i, 5-2i;
     -3+1i,     6, 2+5i ];

% Compute and display operations for real matrix R
disp('--- Real Matrix R ---');
R_trans = transpose(R);
R_ctrans = R';
R_dottrans = R.';

disp('transpose(R):');
disp(R_trans);
disp("R':");
disp(R_ctrans);
disp("R.':");
disp(R_dottrans);

% Compute and display operations for complex matrix Z
disp('--- Complex Matrix Z ---');
Z_trans = transpose(Z);
Z_ctrans = Z';
Z_dottrans = Z.';

disp('transpose(Z):');
disp(Z_trans);
disp("Z':");
disp(Z_ctrans);
disp("Z.':");
disp(Z_dottrans);

```
# **B. Two Methods for a Linear System** 
Express a simultaneous linear system of four equations with four unknowns in matrix form `Ax = b`. Solve the system using two independent approaches without using the backslash operator (\): the Matrix Inverse Method and Cramer's Rule. Validate the accuracy with determinant and norm checks.   

The following functions and methods were used in this problem:

• inv(A) - computes the matrix inverse `A^{-1}`, enabling the direct algebraic solution `x_inv = A^{-1}b`.   

• det(A) - computes the matrix determinant to ensure the coefficient matrix is nonsingular (`det(A) ≠ 0`) and to evaluate ratios for Cramer's Rule.   

• Cramer's Rule - an explicit algebraic method where the `i`-th unknown is solved by replacing the `i`-th column of `A` with vector `b` and computing `{det(A_i) / det(A)}`.   

• norm() - computes the Euclidean vector norm to evaluate residual error `A x_inv - b` and assess convergence between methods `x_inv - x_cramer`.   

Combining these operations, the implementation for this problem is as follows:

```matlab
%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM

% Define coefficient matrix A and constant vector b
A = [  2, -1,  3,  2;
       1,  4, -2,  1;
       3,  2,  1, -1;
      -2,  3,  4,  2 ];

b = [ 16;
      -7;
       6;
       7 ];

% 1. Inverse Method
x_inv = inv(A) * b;

% 2. Cramer's Rule
det_A = det(A);
x_cramer = zeros(4, 1);

for i = 1:4
    A_temp = A;
    A_temp(:, i) = b; % Replace column i with b
    x_cramer(i) = det(A_temp) / det_A;
end

% Required Checks and Displays
disp('Coefficient Matrix Determinant det(A):');
disp(det_A);

disp('Solution vector via Inverse Method (x_inv):');
disp(x_inv);

disp("Solution vector via Cramer's Rule (x_cramer):");
disp(x_cramer);

disp('Norm difference between methods norm(x_inv - x_cramer):');
disp(norm(x_inv - x_cramer));

disp('Residual norm check norm(A * x_inv - b):');
disp(norm(A * x_inv - b));
```
