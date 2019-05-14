function p=feature_extraction(I)
 
I = imread(I);
I = rgb2gray(I);
 
I2 = threesholding(I);
 
cc=bwconncomp(I2,8);
n=cc.NumObjects;
Area = zeros(n,1);
Perimeter = zeros(n,1);

 
k=regionprops(cc,'Area','Perimeter')
for i=1:n
    Area(i)=k(i).Area;
    Perimeter(i)=k(i).Perimeter;
end
 
p(1,1)=mean(Area);
p(2,1)=mean(Perimeter);
% p is now a 2*4 vector .