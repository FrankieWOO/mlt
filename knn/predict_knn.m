% K-nearest neigbours.
%
% in:
%     X        - input data
%     model    - model struct, containing
%          .k  - no. neighbours to use
%          .X  - model input samples
%          .Y  - model output samples
%          .N  - no. of model samples
%          .l  - class labels
%          .Nl - no. class labels
% out:
%     
function Y = knn(X,model)

N = size(X,2);

% squared distances
D2  = repmat(sum(model.X'.^2,2),1,N)+...
      repmat(sum(X'.^2,2)',model.N,1)-2*model.X'*X;

if model.k==1 % if just 1 NN, then find the min of D
	[d,i] = min(D2); Y=model.Y(i);
else % otherwise sort the distances, find the majority class label
	[d si] = sort(D2);
	Y = nan(1,N); % initialise N
	for i=1:N % for each data point
		n = zeros(1,model.Nl); % 
		for j=1:model.Nl % for each class label
			% count the no. of points with this label
			im=find(model.Y(si(1:model.k,i))==model.l(j));
			if ~isempty(im)
				n(j) = size(im,2);
			end
		end
		[d li] = max(n);
		Y(i) = model.l(li);
	end
end
