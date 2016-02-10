% Script to demonstrate k-Nearest Neighbours on a 2D binary classification problem.

clear all
rand('seed',1);randn('seed',1)
figNo=1;

% generative model
fd= inline('3*x(1,:)-1'); % decision boundry
f = inline('3*x(1,:)-x(2,:)-1>0');

% generate data
Ntr  = 101;
dimX = 2;
xmax = ones(dimX,1); xmin=zeros(dimX,1);
Xtr  = repmat(xmax-xmin,1,Ntr).*rand(dimX,Ntr)+repmat(xmin,1,Ntr);
Ytr  = f(Xtr + 0.1*randn(dimX,Ntr));
fprintf(1,'#Data: %5d, ',Ntr);   

% set up regression model
model.k  = 2;               % no. neighbours to use
model.X  = Xtr;             % model points
model.Y  = Ytr;             % classes
model.N  = Ntr;             % no. of points
model.l  = unique(model.Y); % class labels
model.Nl = length(model.l); % no. class labels

% predict training data
Yptr = predict_knn(Xtr,model);

% compute training error (percentage misclassified instances)
i=find(Yptr~=Ytr); 
pcetr = 100*length(i)/Ntr;
fprintf(1,'%% error (train) = %5.3f%%, ',pcetr);   

% predict test data
Nte  = Ntr;
Xte  = repmat(xmax-xmin,1,Nte).*rand(dimX,Nte)+repmat(xmin,1,Nte);
Yte  = f(Xte);
Ypte = predict_knn(Xte,model);

% compute test error (percentage misclassified instances)
i=find(Ypte~=Yte); 
pcete = 100*length(i)/Nte;
fprintf(1,'%% error (test) = %5.3f, ',pcete);   
fprintf(1,'\n');   

% visualisation
figure(figNo),clf,hold on,grid on,box on

% visualise the generative model
xd  =linspace(xmin(1),xmax(1),20); yd = fd(xd);
h(1)=plot(xd, yd,'k-'); % generative model

% training data
i = find(Ytr); j = setdiff(1:Ntr,i);
h(2)=plot(Xtr(1,i),Xtr(2,i),'r.');
h(3)=plot(Xtr(1,j),Xtr(2,j),'b.');

% training data predictions
i = find(Yptr); j = setdiff(1:Ntr,i);
h(4)=plot(Xtr(1,i),Xtr(2,i),'ro');
h(5)=plot(Xtr(1,j),Xtr(2,j),'bo');

% test data
i = find(Yte); j = setdiff(1:Nte,i);
h(6)=plot(Xte(1,i),Xte(2,i),'rx');
h(7)=plot(Xte(1,j),Xte(2,j),'bx');

% test data predictions
i = find(Ypte); j = setdiff(1:Nte,i);
h(8)=plot(Xte(1,i),Xte(2,i),'ro');
h(9)=plot(Xte(1,j),Xte(2,j),'bo');

axis equal
xlim([xmin(1),xmax(1)])
ylim([xmin(2),xmax(2)])
