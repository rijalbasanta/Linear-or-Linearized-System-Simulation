function [state_dot] = stateSpaceRepresentation(t, state, M, C_G, K_H, fn)
    
    N = size(M,1);
    %f = @(time) 50*cos(time);
    
    ZERO = zeros(N);
    I = eye(N);
    S = state(1:2*N);
    F = [fn(t); 0];
    
    A = [ZERO, I; -inv(M)*(K_H), -inv(M)*(C_G)];   % State Transition Matrix
    B = [ZERO; inv(M)];                     % 
    % State Space Representation
    state_dot = A*S + B*F;

end