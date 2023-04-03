clc
clear
close all
%%

k = 10;

N = 2000; %% time steps
nEpisode = 1000;

SelectedAction = zeros(N, nEpisode);
Reward = zeros(N, nEpisode);
OptimalAction = zeros(1, nEpisode);

epsilon = 0.1; %% 1 - 0.1 + 0.1 / 10 = 0.91

for e = 1: nEpisode
    qs = randn (1, k);
    [~, OptimalAction(e)] = max (qs);

    Q = zeros(1, k);
    Counter = zeros(1, k);

    for t = 1:N
        maxQ = max(Q);
        A = find(Q == maxQ);
        A = A (randi (numel(A), 1));

        %% Exploration
        if rand < epsilon
            A = randi(k, 1);
        end

        SelectedAction(t, e) = A;
        Counter(A) = Counter(A) + 1;
        Reward(t, e) = qs(A) + randn(1);

        Q(A) = Q(A) + 1 / Counter(A) * (Reward(t, e) - Q(A));
    end
    disp(['Episode (' num2str(e) ' / ' num2str(nEpisode) ')']);
end

AvrageReward = mean (Reward, 2);

OAP = zeros(N, nEpisode);
for e = 1: nEpisode
    OAP(: , e) = SelectedAction(: , e) == OptimalAction(e);
end
OAP = mean (OAP, 2);

fig = figure(1);
fig.Color = [1 1 1];
subplot(211);
plot(AvrageReward, 'LineWidth', 3);
grid on
xlabel('Time Step', 'FontSize', 14);
ylabel('AvrageReward', 'FontSize', 14);
title('e-Greedy AvrageReward', 'FontSize', 14);

fig = figure(1);
subplot(212);
plot(OAP * 100, 'LineWidth', 3);
grid on
xlabel('Time Step', 'FontSize', 14);
ylabel('OAP', 'FontSize', 14);
title('e-Greedy Optimal Selected Action', 'FontSize', 14);
