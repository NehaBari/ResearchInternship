K = 3; %Number of student units
M = 3; %Number of teacher units
N = 1000; %Number of dimensions

T = N*eye(M);        %teacher-teacher overlaps
Q = N*eye(K);    %Student-student "
R = N*[
        10^-3, 0, 0; 
        0, 10^-3, 0;
        0, 0, 10^-3
    ]; %Student-teacher "

[B, J] = layer_weight_init(Q, R, T, K, M, N);
%B: teacher vectors, J student vectors

%Show the overlaps of the initialized vectors
J' * J
B' * B
J' * B