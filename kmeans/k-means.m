% generate k random clusters (r elems) with sd in range a-by-a square
% calculate in q guesses
k    = 4;
q    = 8;
a    = 5;
sd   = .5;
r    = 100;
data = zeros(k*r, 3);
c    = ['k', 'b', 'r', 'g', 'm', 'c', 'y'];

% calculate k original clusters
clusters = -a + rand(k,2) * 2*a; 

% generate "random" data
for i = 1:k
    x  = -a + rand(1,2) * 2*a;
    x1 = normrnd(x(1),sd,r,1);
    x2 = normrnd(x(2),sd,r,1);
    data((r*(i-1) + 1):(r*i),1) = x1;
    data((r*(i-1) + 1):(r*i),2) = x2;
end

% plot black data
figure(1)
plot(data(:,1), data(:,2), '.', 'Color', 'k')
title('Data Before Clustering')

% plot 'known' clusters
figure(2)
hold on
for i = 1:k
    rng = (r*(i-1) + 1):(r*i);
    plot(data(rng,1), data(rng,2), '.', 'Color', c(i+1))
end
title('Data With Known Clusters')
hold off

% plot original cluster guess
for d = 1:(k*r)
    min_dist = Inf;
    min_c    = data(d,3);
    for l = 1:k
        dist = pdist([data(d,[1 2]); clusters(l,[1 2])], 'euclidean')^2;
        if (dist < min_dist)
            min_dist = dist;
            min_c    = l;
        end
    end
    data(d,3) = min_c;
end

figure(3)
hold on
for i = 1:k
    match = data(data(:,3) == i,:,:);
    plot(match(:,1), match(:,2), '.', 'Color', c(i+1))
end
plot(clusters(:,1), clusters(:,2), 'o', 'Color', 'k')
title('Data Clusters - Initial Guess')
hold off

%% iterate: recalculate clusters and plot
for j = 4:q
    for d = 1:(k*r)
        min_dist = Inf;
        min_c    = data(d,3);
        for l = 1:k
            dist = pdist([data(d,[1 2]); clusters(l,[1 2])], 'euclidean')^2;
            if (dist < min_dist)
                min_dist = dist;
                min_c    = l;
            end
        end
        data(d,3) = min_c;
	end
    
    figure(j)
    hold on
    for i = 1:k
        match = data(data(:,3) == i,:,:);
        avg_x = mean(match(:,1));
        avg_y = mean(match(:,2));
        clusters(i,:) = [avg_x avg_y];
        plot(match(:,1), match(:,2), '.', 'Color', c(i+1))
    end
    plot(clusters(:,1), clusters(:,2), 'o', 'Color', c(1))
    title(['Data Clusters - Guess #', num2str(j-2)])
    hold off
end

%% replotting original clusters with correct colors
% plot 'known' clusters
figure(q+1)
hold on
c2 = ['b', 'g', 'r', 'm']
for i = 1:k
    rng = (r*(i-1) + 1):(r*i);
    plot(data(rng,1), data(rng,2), '.', 'Color', c2(i))
end
title('Data With Known Clusters')
hold off
