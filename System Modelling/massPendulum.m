function system = massPendulum()
    
    g = 9.8;
    c = 5;
    k = 100;
    L = 7;
    m1 = 500;
    m2 = 200;



    %Mass matrix
    system.mass_matrix = [(m1+m2), m2*L;
                           m2*L, m2*L*L];
      
    %Damping matrix
    C = [c, 0;
        0, 0];
    
    %Gyroscopic matrix
    G = [0, 0;
        0, 0];
    
    %Stiffness matrix
    K = [k, 0;
         0, m2*g*L];
     
    %Circulatory matrix
    H = [0, 0;
         0, 0];
     
    %Force handles
    system.force_func_handle1 = @(time) 50*cos(time);
    
    system.damping_plus_gyroscopic = C+G;
    system.stiffness_plus_circulatory = K+H;
    
end