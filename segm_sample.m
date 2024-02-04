function Re_sample = segm_sample( p, q, n)


% Oscar Ruiz. 20-06-2012
% This function re-samples a straight segment in equispaced point samples.

% INPUTS: 
%  p, q:       (3 x 1) the extremes of the segment.
%  n:          the number of samples to obtain from the segment.  
%
% OUTPUTS: 
% Re_sample:    (3 x N) The point re-sample of the input segment.



Re_sample = [];
for i=0:n
    pt = p + (i/n)*(q-p);
    Re_sample = [ Re_sample pt ];
end    


