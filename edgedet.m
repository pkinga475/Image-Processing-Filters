A=imread('C:\Users\P K\Desktop\PhD\Latex\Compact\Lab8_Praveen_19103280\Data_Lab8\Kanpur_Area.tif');

IR=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

X=[-1 1];
Y=[-1; 1];

for i=1:336
    for j=1:418
        Dx(i,j,1)=IR(i+1,j)-IR(i,j);
        Dx(i,j,2)=G(i+1,j)-G(i,j);
        Dx(i,j,3)=B(i+1,j)-B(i,j);
    end
end

for i=1:336
    for j=2:419
        Dy(i,j,1)=IR(i,j)-IR(i,j-1);
        Dy(i,j,2)=G(i,j)-G(i,j-1);
        Dy(i,j,3)=B(i,j)-B(i,j-1);
    end
end

for i=1:336
    for j=1:418
        ES(i,j,1)=sqrt(double(Dx(i,j,1)^2+Dy(i,j,1)^2));
        ES(i,j,2)=sqrt(double(Dx(i,j,2)^2+Dy(i,j,2)^2));
        ES(i,j,3)=sqrt(double(Dx(i,j,3)^2+Dy(i,j,3)^2));
        
        ED(i,j,1)=atan(double(Dy(i,j,1)/Dx(i,j,1)));
        ED(i,j,2)=atan(double(Dy(i,j,2)/Dx(i,j,2)));
        ED(i,j,3)=atan(double(Dy(i,j,3)/Dx(i,j,3)));
        
        X1(i,j,1)=ES(i,j,1)+A(i,j,1);
        X1(i,j,2)=ES(i,j,2)+A(i,j,2);
        X1(i,j,3)=ES(i,j,3)+A(i,j,3);
    end
end

figure, subplot(2,2,1);imshow(A); title('Original Image');
subplot(2,2,2);imshow(ES); title('Only Edge Strength');
subplot(2,2,3);imshow(X1); title('Combined Edge Strength');
subplot(2,2,4);imshow(ED); title('Edge Direction');

[Gmag1, Gdir1] = imgradient(IR);
[Gmag2, Gdir2] = imgradient(G);
[Gmag3, Gdir3] = imgradient(B);

E11=edge(IR);
E12=edge(G);
E13=edge(B);

[Gx1 Gy1]=imgradientxy(IR);
[Gx2 Gy2]=imgradientxy(G);
[Gx3 Gy3]=imgradientxy(B);

[Gmag1, Gdir1] = imgradient(IR);
[Gmag2, Gdir2] = imgradient(G);
[Gmag3, Gdir3] = imgradient(B);

figure,subplot(1,3,1);imshow(E11);title('Edge detection using edge(), 1st Band');
subplot(1,3,2);imshow(E12);title('Edge detection using edge(), 2nd Band');
subplot(1,3,3);imshow(E13);title('Edge detection using edge(), 3rd Band');

figure,subplot(2,3,1);imshow(Gx1);title('Gx using imgradientxy(), 1st Band');
subplot(2,3,2);imshow(Gx2);title('Gx using imgradientxy(), 2nd Band');
subplot(2,3,3);imshow(Gx3);title('Gx using imgradientxy(), 3rd Band');
subplot(2,3,4);imshow(Gy1);title('Gy using imgradientxy(), 1st Band');
subplot(2,3,5);imshow(Gy2);title('Gy using imgradientxy(), 2nd Band');
subplot(2,3,6);imshow(Gy3);title('Gy using imgradientxy(), 3rd Band');

figure,subplot(2,3,1);imshow(Gmag1);title('Gmag using imgradient(), 1st Band');
subplot(2,3,2);imshow(Gmag2);title('Gmag using imgradient(), 2nd Band');
subplot(2,3,3);imshow(Gmag3);title('Gmag using imgradient(), 3rd Band');
subplot(2,3,4);imshow(Gdir1);title('Gdir using imgradient(), 1st Band');
subplot(2,3,5);imshow(Gdir2);title('Gdir using imgradient(), 2nd Band');
subplot(2,3,6);imshow(Gdir3);title('Gdir using imgradient(), 3rd Band');