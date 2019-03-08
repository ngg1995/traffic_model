function [ cars2,out ] = carRules( cars,vmax,L,Pr )
%carRules Applies NaSch method to cars in cars array
%Cars are on road with vmax as speed limit, L as road length all cars have
%probability of slowing Pr
%The code outputs the new position and velocity of the cars
%As well as the number of cars that have looped from the end to start of
%the road


%Nicholas Gray 4226166

%Breaking the cars array into position and velocity components
p=cars(:,1);
v=cars(:,2);
n=length(p);

%Calculating the distance between cars
d=diff(p);
d(end+1)=p(1)+L-p(end);

%Creating array to find number of looping cars 
out=0;

for i = 1:n
    
    %Random number for NaSch step 3
    r=rand;
    if v(i)<vmax && d(i)>(v(i)+1) %NaSch step 1
        v(i)=v(i)+1;
    elseif d(i)<=v(i) %NaSch step 2
        v(i)=d(i)-1;
    end
    
    if v(i)>0 && r<Pr %NaSch step 3
        v(i)=v(i)-1;
    end
    
    if v(i)<0 %To ensure no cars have speed <0
        v(i)=0;
    end
    
    p(i)=p(i)+v(i); %NaSch step 4
    
    if p(i)>L %Check for Looping at end of road
        p(i)=p(i)-L;
        out=out+1;
    end
end

%Recombining position and velocity into new cars array
cars2(:,1)=p;
cars2(:,2)=v;

end

