function  box_2d = rectangle_2D( origin, Dx, Dy )
% Oscar Ruiz.  21-03-2013
% This function defines the vertes sequence of a 2D rectangular polygon
% whose lower left corner is at point 'origin' and has Dx (wide) and
% Dy (height) dimensions.
% INPUTS:
%    origin : (2 x 1)  lower left corner of the rectangle.
% 
%    Dx, Dy: Real numbers. Dx = wide, Dy=height of the rectangle.
%
% OUTPUTS:
%    box_2d: (2 x 4), the sequence of 2D rectangle vertices.
%

p1 = origin;

p2 = origin + [ Dx, 0 ]';

p3 = origin + [ Dx, Dy ]';

p4 = origin + [ 0, Dy ]' ;

box_2d = [ p1 p2 p3 p4 ] ;


end