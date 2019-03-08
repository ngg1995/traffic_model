# traffic_model
Nagel-Schreckenberg traffic model


The NaSch model is a cellular automation model for traffic flow that works in the following way. A road of length is broken up into L cells in which only one car can occupy, and each car has an associated speed, v, that can take integer values up to v_max  .Four simple rules are then used to simulate the flow of traffic on a road.
1. Acceleration: if the speed of a car is less than the maximum speed limit of the road v<v_max. Then its speed is increased by 1 [v→v+1]
2. 	Slowing Down: If the distance between one cars and the car in front, d, is smaller than the current speed, then the speed of the car is reduced to d-1 [v→d-1]
3. 	Randomisation: With probability p, the speed of a car is reduced by 1 [v→v-1]
4.	Movement: The position of each car is advanced by v
These four steps are carried out in order, for all cars on the road in parallel, these actions are then repeated to simulate the traffic flow. In the model the road is a close loop such that when a car reaches the end of the road in reappears with the same velocity at the start of the road. This means that there are periodic boundary conditions and the is a constant total density as cars don’t enter or exit the road.

This repo contains 3 files:
* carRule.m ->> function that contains the rules required to simulate the model
* shuffle.m ->> function that makes the cars loop from the start to the end
*  simulation.m ->> file that needs to be run to see simulation of traffic flow. will ask for values for max speed, road length, slowing probability, density of cars and simulation time. It will make an animation in which each dot represents a car

This code was originally developed as part of a scientific computing module during my physics degree at the University of Nottingham. Contact nickgray@liv.ac.uk for more information


Reference full report (doc file):

title = The Effect of Variable Speed Limits on Traffic Flow,
author = Gray, Nick,
school = The University of Nottingham,
year = 2016,
url = https://github.com/ngg1995/traffic_model/
