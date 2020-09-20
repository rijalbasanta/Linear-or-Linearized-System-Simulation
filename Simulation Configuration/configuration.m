function config = configuration()

    %Time Span(seconds)
    t0 = 0;     tf = 30;    %time_step = 0.5;  
    config.tspan = [t0, tf];
    %tspan = [t0:time_step:tf];
    
    %Initial State
    x0 = 0;     v0 = 0;
    thetha0 = 0;     omega0 = 0;
    config.IC = [x0, thetha0, v0, omega0];
end