function [ newX ] = shuffle( X,n )
%SHUFFLE Moves the last n rows of x to the top of the matrix

%Nicholas Gray 4226166


m=n-1;
a=X((end-m):end,:);
b=X(1:(end-m-1),:);
newX=[a;b];
end

