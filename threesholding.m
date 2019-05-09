function im = threesholding(I)
[r,c]= size(I);
im= zeros(r,c);
for i=1:r
    for j=1:c
        if  I(i,j)>105
            im(i,j)=1;
        end
    end
end
im= bwareaopen(im,5);
im=imfill(im,'holes');
end
