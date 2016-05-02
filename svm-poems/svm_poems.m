global C; 
global n; 
global x;
global y; 
global c;

n      = 10;
poems  = {'I cannot live with you, It would be life, And life', ...
          'What happens to a dream deferred? Does it dry up',   ...
          'I wandered lonely as a cloud That floats on high',   ...
          'Oh whence do you come, my dear friend, to me, With', ...
          'Two roads diverged in a yellow wood, And sorry I',   ...
          'Wie rafft ich mich auf in der Nacht, in der Nacht',  ...
          'Im Wasser wogt die Lilie, die blanke, hin und her',  ...
          'Als er Siebzig war und war gebrechlich, drangte es', ...
          'An einem Sommermorgen da nimm den Wanderstab, es',   ...
          'Aktenstose nachts verschlingen, Schwatzen nach der Welt'};

% calculate features of poems
poem_sizes = zeros(n,1);
i_count    = zeros(n,1);
for i = 1:n
    poem_sizes(i) = size(cell2mat(strfind(poems(i),' ')),2) + 1;
    i_count(i)    = size(cell2mat(strfind(poems(i),'i')),2) + ...
                    size(cell2mat(strfind(poems(i),'I')),2);
end

x = poem_sizes;
y = i_count;
c = [-1, -1, -1, -1, -1,  1,  1, 1, 1, 1];

% plot data
hold on
plot(x(1:5), y(1:5),  '.r', 'Markersize', 25)
plot(x(6:10),y(6:10), '.b', 'Markersize', 25)
title('Categorizing German vs. English Poems');
ylabel('number of "i"');
xlabel('number of complete words');
xlim([5, 15]);
ylim([0, 7]);

z_0= [1; 0; 0];
C  = 1;

% perform operation of SVM
z=fminunc(@F,z_0);
w=[z(1); z(2)];
b=z(3);
xx(1)=20;
yy(1)=(-b-xx(1)*w(1))/w(2);
xx(2)=0;
yy(2)=(-b-xx(2)*w(1))/w(2);

% plot line on chart
plot(xx,yy,'-g','Linewidth',1);

% testing SVM by plotting new poem in magenta
% poem is obviously in German - should be on blue side of partition
new_poem = 'Hat der alte Hexenmeister sich doch einmal wegbege';
new_poem_x = size(cell2mat(strfind(poems(i),' ')),2) + 1;
new_poem_y = size(cell2mat(strfind(poems(i),'i')),2) + ...
             size(cell2mat(strfind(poems(i),'I')),2);
plot(new_poem_x,new_poem_y,'.m', 'Markersize', 25);

hold off;