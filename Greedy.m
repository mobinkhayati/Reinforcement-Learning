clc
clear
close all
%%

k = 10;
qs = randn (1, k);
[~, OptimalAction] = max (qs);

N = 1000; %% time steps
SelectedAction = zeros(N, 1);
Reward = zeros(N, 1);


epsilon = 0;
Q = zeros(1, k);
Counter = zeros(1, k);

for t = 1:N
     maxQ = max(Q);
     A = find(Q == maxQ);
     A = A (randi (numel(A), 1));

     SelectedAction(t, 1) = A;
     Counter(A) = Counter(A) + 1;
     Reward(t) = qs(A) + randn(1);

     Q(A) = Q(A) + 1 / Counter(A) * (Reward(t) - Q(A));
end

OAP = mean (SelectedAction == OptimalAction);
disp(['Optimal Action Percent = ' num2str(OAP * 100) '%']);
 