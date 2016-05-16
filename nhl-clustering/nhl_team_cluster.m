num_features = 3;
num_clusters = 2;

data  = csvread('nhl_team_data.csv',1,1); % read data
[v,d] = eig(data'*data);
[s,o] = sort(diag(d),'descend');

lead_eigvect = v(:,o(1));
[s_f,o_f]    = sort(lead_eigvect,'descend');

simple_data = data(:,o_f(1:num_features));
clusters    = kmeans(simple_data,num_clusters);