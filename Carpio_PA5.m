% Name: Renz Gabriel P. Carpio
% Section: 2ECE-A
% ECE 2112 - Experiment 5: Introduction to MATLAB Programming
%
%% PROBLEM A: TRANSPOSE OPERATIONS
disp('=================== PROBLEM A: TRANSPOSE OPERATIONS ===================');

% Define the matrices exactly as given
R = [ 5 -2  0  7;
    1  3 -4  2;
    6  0  8 -1];

Z = [ 2+3i  -1+4i   5-2i;
    -3+1i   6      2+5i];

% ---- A replaced by R (real matrix) ----
A = R;
disp('A = R:');  disp(A);
disp('transpose(A):');  disp(transpose(A));
disp('A'':');           disp(A');
disp('A.'':');          disp(A.');

% ---- A replaced by Z (complex matrix) ----
A = Z;
disp('A = Z:');  disp(A);
disp('transpose(A):');  disp(transpose(A));
disp('A'':');           disp(A');
disp('A.'':');          disp(A.');


% ANSWERS:
% a. All three (transpose(R), R', and R.') give identical results, because
%    a real matrix has no imaginary parts to conjugate.
%
% b. transpose(Z) and Z.' give identical results (both are plain
%    transposes that do not conjugate).
%
% c. It also takes the complex conjugate of every entry (it is the
%    complex-conjugate transpose, or Hermitian transpose), so a + bi
%    becomes a - bi in the transposed position.

%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
disp(' ');
disp('================ PROBLEM B: LINEAR SYSTEM ================');

% Coefficient matrix and right-hand-side vector
A = [ 2 -1  3  2;
    1  4 -2  1;
    3  2  1 -1;
    -2  3  4  2];
b = [16; -7; 6; 7];

detA = det(A);
disp('Coefficient matrix A:');     disp(A);
disp('Right-hand-side vector b:'); disp(b);
disp('det(A) ='); disp(detA);   % must be nonzero

% ---- Method 1: Inverse method ----
x_inv = inv(A) * b;

% ---- Method 2: Cramer's Rule ----
n = size(A, 1);
x_cramer = zeros(n, 1);
for k = 1:n
    Ak = A;
    Ak(:, k) = b;                    % replace column k with b
    x_cramer(k) = det(Ak) / detA;    % ratio of determinants
end

disp('Solution using the inverse method, x_inv ='); disp(x_inv);
disp('Solution using Cramer''s Rule, x_cramer ='); disp(x_cramer);

% ---- Numerical checks ----
disp('norm(x_inv - x_cramer) ='); disp(norm(x_inv - x_cramer));
disp('norm(A*x_inv - b) ='); disp(norm(A*x_inv - b));
% Both norms should be approximately zero (on the order of 1e-14 or smaller).
