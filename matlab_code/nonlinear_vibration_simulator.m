%% Nonlinear Vibration Simulator: Duffing Oscillator
% This script simulates the dynamics of a Duffing oscillator.

% Parameters
m = 1;          % mass
k1 = 1;        % linear stiffness
k3 = -0.5;     % nonlinear stiffness
b = 0.1;       % damping
F0 = 1;        % amplitude of external force
omega = 1;     % frequency of external force

% Time parameters
T = 100;        % total time
dt = 0.01;      % time step
N = T/dt;       % number of time points

% Initialize state
x = zeros(N,1); % displacement
v = zeros(N,1); % velocity

t = (0:dt:T-dt)';

% Simulate the Duffing oscillator using the Runge-Kutta method
for i = 2:N
    % Forces
    F = F0 * cos(omega * t(i));
    
    % Nonlinear equation of motion: m * x'' + b * x' + k1 * x + k3 * x^3 = F
    
    % Runge-Kutta step
    x1 = x(i-1);
    v1 = v(i-1);
    k1x = v1;
    k1v = (F - b*v1 - k1*x1 - k3*x1^3) / m;
    
    k2x = v1 + 0.5*dt*k1v;
    k2v = (F - b*(v1 + 0.5*dt*k1v) - k1*k2x - k3*k2x^3) / m;
    
    k3x = v1 + 0.5*dt*k2v;
    k3v = (F - b*(v1 + 0.5*dt*k2v) - k1*k3x - k3*k3x^3) / m;
    
    k4x = v1 + dt*k3v;
    k4v = (F - b*(v1 + dt*k3v) - k1*k4x - k3*k4x^3) / m;
    
    % Update state
    x(i) = x1 + (dt/6)*(k1x + 2*k2x + 2*k3x + k4x);
    v(i) = v1 + (dt/6)*(k1v + 2*k2v + 2*k3v + k4v);
end

% Plotting the results
figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Duffing Oscillator Simulation');
grid on;