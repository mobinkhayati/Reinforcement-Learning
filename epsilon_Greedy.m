clc
clear
close all
%%

k = 10;
qs = randn (1, k);
[~, OptimalAction] = max (qs);

N = 5000; %% time steps
SelectedAction = zeros(N, 1);
Reward = zeros(N, 1);


epsilon = 0.1; %% 1 - 0.1 + 0.1 / 10 = 0.91
Q = zeros(1, k);
Counter = zeros(1, k);

for t = 1:N

    if t > 1e5
        epsilon = 0;
    end

     maxQ = max(Q);
     A = find(Q == maxQ);
     A = A (randi (numel(A), 1));

     %% Exploration
     if rand < epsilon
         A = randi(k, 1);
     end

     SelectedAction(t, 1) = A;
     Counter(A) = Counter(A) + 1;
     Reward(t) = qs(A) + randn(1);

     Q(A) = Q(A) + 1 / Counter(A) * (Reward(t) - Q(A));
end

OAP = mean (SelectedAction == OptimalAction);
disp(['Optimal Action Percent = ' num2str(OAP * 100) '%']);

fig = figure(1);
subplot(211);
plot(Reward, 'LineWidth', 3);
grid on
xlabel('Time Step', 'FontSize', 14);
ylabel('Reward', 'FontSize', 14);
title('e-Greedy Reward', 'FontSize', 14);

fig = figure(1);
subplot(212);
plot(SelectedAction, 'LineWidth', 3);
grid on
xlabel('Time Step', 'FontSize', 14);
ylabel('Selected Action', 'FontSize', 14);
title(['e-Greedy Selected Action, Optimal Action = ' num2str(OptimalAction)], 'FontSize', 14);
