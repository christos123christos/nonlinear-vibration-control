function frequency_response
    % Frequency Response Analysis of Nonlinear Duffing Oscillator
    % This script compares the frequency response of nonlinear and linear Duffing systems.

    % Parameters for the Duffing oscillator
    m = 1;              % mass
    k1 = 1;             % linear stiffness
    k2 = 0.5;           % nonlinear stiffness
    gamma = 0.1;        % damping coefficient
    F0 = 0.5;           % amplitude of periodic forcing

    % Generate frequency range
    frequencies = linspace(0, 3, 100); 
    responses_linear = zeros(size(frequencies));
    responses_nonlinear = zeros(size(frequencies));

    for i = 1:length(frequencies)
        omega = frequencies(i);
        % Linear response calculation (numerical solution or analytical)
        % Placeholder for linear system response 
        responses_linear(i) = F0 / (k1 - m*omega^2);  % Inverse of stiffness for linear system
        
        % Nonlinear response calculation 
        A = [ m*(omega^2) 0; 0 1];  % nonlinear terms are not simple here
        B = [ -k1 - k2; 0];  % Placeholder for computation
        responses_nonlinear(i) = F0 / (k1 + k2 - m*omega^2); % basic damping model
    end

    % Plotting the results
    figure;
    plot(frequencies, responses_linear, 'b', 'DisplayName','Linear System');
    hold on;
    plot(frequencies, responses_nonlinear, 'r', 'DisplayName','Nonlinear System');
    title('Frequency Response of Duffing Oscillator');
    xlabel('Frequency (rad/s)');
    ylabel('Response amplitude');
    legend show;
    grid on;
end