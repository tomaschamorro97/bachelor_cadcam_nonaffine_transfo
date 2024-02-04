function  int_pt_labels( pts, start_index )
% Oscar Ruiz 19 02 2016
% Oscar Ruiz, Juan P. Giraldo, Daniel Lopez 14 08 2015
%
% This function draws the sequence of integer labels
%    start_index+0, start_index+1, start_index+2, ...
% located at the vertices 
%    pts(:,1), pts(:,2), pts(:,3),..
% 
% INPUTS:
%   pts: (2 x _) or (3 x _) point matrix containing the cartesian
%        points at which the labels are placed.
%   start_index: Natural positive number which is the index to be
%        assigned to the first label.

[dims, N_pts ] = size( pts );

for i=1:N_pts
    
    x= pts(1,i);
    y= pts(2,i);
    str = sprintf('p%d', start_index+i-1 );
    
    if (dims == 3)
        z = pts(3,i);
        text(x,y,z, str );
    else
        text(x,y,str );
    end
    
  end

end

