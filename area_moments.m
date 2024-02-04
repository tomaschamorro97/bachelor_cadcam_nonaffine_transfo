function [A,A2,CG_x,CG_y]=area_moments(polyg)
% Updated: Sept 01, 2007. by Oscar Ruiz
% Authors: Oscar Ruiz. 
% CAD CAM CAE LAboratory at EAFIT University. February 2007.
% This function calculates the 0- and 1- moments of Area
% of a polygon withouth holes, in the XY plane.
% INPUTS
% polyg:	The non-self-intersecting polygon (Nx2, Nx3, Nx4).
% OUTPUTS:
% A:        Area method 1 
%           Sumation of Signed Trapezoid Areas.
% A2:       Area Method 2. [Gems II] pp. 170-171:
%           "Area of Planar Polygons and Volume of Polyhedra", Ronald N. Goldman.

% CG_x,CG_y: Coordinates of the Center of Gravity of "polyg".

N_pts = size(polyg,1);
polyg = [polyg ; polyg(1,:)];
A=0;
CG_x = 0;
CG_y = 0;
A2=0;

X=polyg(:,1);
Y=polyg(:,2);


for i=1:N_pts
    A=A+(X(i)-X(i+1))*(Y(i)+Y(i+1))/2;
    A2 = A2 + ( X(i) * Y(i+1)- X(i+1)* Y(i))/2;
end    


for i=1:N_pts
    CG_x = CG_x + (X(i) + X(i+1))*( X(i) * Y(i+1)- X(i+1)* Y(i));
    CG_y = CG_y + (Y(i) + Y(i+1))*( X(i) * Y(i+1)- X(i+1)* Y(i));
end

CG_x = CG_x /(6*A2);
CG_y = CG_y /(6*A2);


