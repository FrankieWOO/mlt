% Gaussian radial basis function
%
% Implements polynomial basis function of the form:
%
%  phi(x) = XXX
%
% in: 
%     x   - input
%
% out: 
%     phi - basis function prediction
%
function phi = fn_basis_gaussian_rbf ( x, c, s2 );

D   = distances(c,x);
phi = exp(-(0.5/s2)*D);

%[dimX ,N] = size(x );
%[dimS2,n] = size(s2);
%
%if dimS2==1
%D   = distances(c,x/sqrt(s2));
%else
%if dimX~=dimS2; error 'bad dims'; end
%D   = distances(c,x./repmat(sqrt(s2),1,N));
%end
%phi = exp(-0.5*D);

%phi = phi.*repmat(sum(phi).^(-1),size(c,2),1); % normalise phi

