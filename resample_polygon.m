function Resampled_P = resample_polygon(Polygon, N_resample)

% Oscar Ruiz. 20-06-2012
% This function obtaines equispaced point samples from each one of the 
% sides of a polygon and returns the resampled polygon. 

% INPUTS: 
%  Polygon:       (3 x N) The list of vertices of the Polygon.
%  N_resample:    Number of samples to obtain from each polygon side.
%
%
% OUTPUTS: 
% Resampled_P:    (3 x N) The polygon which is the re-sample of the input polygon.

Resampled_P = [];
N = size( Polygon, 2);

Polygon = [Polygon Polygon(:,1)];

for i=1:N
    
    Re_sample = segm_sample( Polygon(:,i), Polygon(:,i+1), N_resample);
    Resampled_P = [Resampled_P Re_sample];
   
end    


