function main

    %Extract System Model
    system = massPendulum();
    
    %Extract Simulation Configuration
    config = configuration();
    
    %Set all initial conditions to 'ZERO'
    N = size(system.mass_matrix,1);
    %config.IC = zeros(N);
    
    %State Space Representation
    state_dot = @(t,y) stateSpaceRepresentation(t,y,system.mass_matrix,system.damping_plus_gyroscopic,system.stiffness_plus_circulatory,system.force_func_handle1);
     
    %Simulating with ODE45
    [t,S] = ode45(state_dot, config.tspan, config.IC);
    
    %Plot Results
    for i = 1:2*N
        figure(i), clf
        st = append('State S', int2str(i));
        plot(t,S(:,i), xlabel('Time (s)'), ylabel("st"))
        title(append(st,' vs. Time'))
    end
end