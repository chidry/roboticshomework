clear all
clc

%% using Roation matrix approach
Rd=[1 0 0;0 1 0;0 0 1];
R=[cos(pi/6) 0 sin(pi/6); 0 1 0;-sin(pi/6) 0 cos(pi/6)]
rel_R=Rd'*R; %rotation matrix from R to Rd

[u,v]=eig(rel_R) 
% u is the eigenvector, and v is the eigenvalue
% and the axis of rotation is the eigenvactor with eigenvalue of 1
angle_of_rotation=acos((trace(rel_R)-1)/2)*180/pi

%% using GC approach
ax=0.5*(rel_R-rel_R');
[axis_of_rotation]=vee_map(ax)

omega=[1; 2; 3];
omega_d=[1; 0; 1];
e_omega=omega-R'*Rd*omega_d

%% =======
function [axis_of_rotation]=vee_map(R)
    axis_of_rotation(1)=R(3,2);
    axis_of_rotation(2)=R(1,3);
    axis_of_rotation(3)=R(2,1);
end