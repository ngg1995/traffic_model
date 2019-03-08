clear

%conditions
maxSpeed=input('Max Speed?  ');
roadLength=input('Road Length?  ');
prob=input('Slowing probability?  ');
density=input('Density of traffic?  ');
simtime = input('simulation length (s)?  ');
%Set up
n=round(density.*roadLength);
cars(:,1)=round(linspace(1,roadLength,n));
cars(:,2)=maxSpeed.*ones(1,n);
cars(:,3) = rand(1,n);


figure('Position', [100 500 1500 100])
axis([0 roadLength 0.9 1.1])

tic
run = true;
while run
    axis([0 roadLength 0.9 1.1])
    
    [cars,flow]=carRules(cars,maxSpeed,roadLength,prob);
    if flow~=0
        cars=shuffle(cars,flow);
    end

    plot(cars(:,1),ones(length(cars),1),'k.','MarkerSize',25)
    pause(1/24)

    if toc > simtime
      run = false;
    else
      pause(1/24)
    end
end
