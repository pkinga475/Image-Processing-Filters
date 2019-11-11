A=imread('C:\Users\P K\Desktop\PhD\Latex\Compact\Lab8_Praveen_19103280\Data_Lab8\Kanpur_Area.tif');

IR=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

I=cat(3,IR,G,B);

%Histogram Equalization
hIR=histeq(A(:,:,1));
hG=histeq(A(:,:,2));
hB=histeq(A(:,:,3));
I1=cat(3,hIR,hG,hB);

% Linear Stretching of Bands
for i=1:337
    for j=1:419
        sB(i,j)=((B(i,j)-10)*((255-0)/(180-10)))+0;
    end
end
for i=1:337
    for j=1:419
        sG(i,j)=((G(i,j)-10)*((255-0)/(180-10)))+0;
    end
end
for i=1:337
    for j=1:419
        sIR(i,j)=((IR(i,j)-25)*((255-0)/(225-25)))+0;
    end
end
I2=cat(3,sIR,sG,sB);

%Histograms of Original band 
figure, subplot(3,3,1);histogram(IR);title('Histogram of Original IR Band');
subplot(3,3,2);histogram(G);title('Histogram of Original G Band');
subplot(3,3,3);histogram(B);title('Histogram of Original B Band');
%Histograms of histeq() band 
subplot(3,3,4);histogram(hIR);title('Histogram of Histeq() IR Band');
subplot(3,3,5);histogram(hG);title('Histogram of Histeq() G Band');
subplot(3,3,6);histogram(hB);title('Histogram of Histeq() B Band');
%Histograms of Stretched band 
subplot(3,3,7);histogram(sIR);title('Histogram of Stretched IR Band');
subplot(3,3,8);histogram(sG);title('Histogram of Stretched G Band');
subplot(3,3,9);histogram(sB);title('Histogram of Stretched B Band');


% Low pass average filter
F1=(1/9)*[1 1 1; 1 1 1; 1 1 1];
figure,subplot(2,3,1);imshow(I);title('Original Image');
subplot(2,3,4);imshow(imfilter(I,F1));title('Avg filter on Original');
subplot(2,3,2);imshow(I1);title('Histeq() Image');
subplot(2,3,5);imshow(imfilter(I1,F1));title('Avg filter on Histeq');
subplot(2,3,3);imshow(I2);title('Stretched Image');
subplot(2,3,6);imshow(imfilter(I2,F1));title('Avg filter on Linear Stretched');

%Pepper Edges
BP=imread('C:\Users\P K\Desktop\PhD\Latex\Compact\Lab8_Praveen_19103280\pepper.jpg');
IRX=BP(:,:,1);
GX=BP(:,:,2);
BX=BP(:,:,3);
IX=cat(3,IRX,GX,BX);
FX=[1 1 1; 1 -8 1; 1 1 1];
figure,subplot(1,2,1);imshow(IX);title('Pepper Image');
subplot(1,2,2);imshow(imfilter(IX,FX));title('Edge filter');

%Different Boundary condition in imfilter()
figure,subplot(3,3,1);imshow(I1);title('Histeq() Original Image');
subplot(3,3,2);imshow(imfilter(I1,F1,0));title('Boundary Option: X');
subplot(3,3,3);imshow(imfilter(I1,F1,'symmetric'));title('Boundary Option: Symmetric');
subplot(3,3,4);imshow(imfilter(I1,F1,'replicate'));title('Boundary Option: Replicate');
subplot(3,3,5);imshow(imfilter(I1,F1,'circular'));title('Boundary Option: Circular');
subplot(3,3,6);imshow(imfilter(I1,F1,'same'));title('Boundary Option: same');
subplot(3,3,7);imshow(imfilter(I1,F1,'full'));title('Boundary Option: full');
subplot(3,3,8);imshow(imfilter(I1,F1,'corr'));title('Boundary Option: Coorelation');
subplot(3,3,9);imshow(imfilter(I1,F1,'conv'));title('Boundary Option: Convolution');

%Low-Pass filter: Smoothening or Outlier removal
HLP=(1/2)*[1 1];
VLP=(1/2)*[1 ;1];

%High-Pass Filter: Sharpening or Edge detection
HHP=[-1 1];
VHP=[-1; 1];

%Filtering
HL=imfilter(I1,HLP);
HH=imfilter(I1,HHP);
VL=imfilter(I1,VLP);
VH=imfilter(I1,VHP);
figure,subplot(2,2,1);imshow(HL);title('Horizontal Low Pass Filter');
subplot(2,2,2);imshow(HH);title('Horizontal High Pass Filter');
subplot(2,2,3);imshow(VL);title('Vertical Low Pass Filter');
subplot(2,2,4);imshow(VH);title('Vertical High Pass Filter');

%Horizontal - Band Histogram comparison
figure,subplot(3,3,1);histogram(hIR);title('histeq() IR Histogram');
subplot(3,3,2);histogram(hG);title('histeq() Histogram');
subplot(3,3,3);histogram(hB);title('histeq() Histogram');
subplot(3,3,4);histogram(HL(:,:,1));title('H-LPF IR Histogram');
subplot(3,3,5);histogram(HL(:,:,2));title('H-LPF G Histogram');
subplot(3,3,6);histogram(HL(:,:,3));title('H-LPF B Histogram');
subplot(3,3,7);histogram(HH(:,:,1));title('H-HPF IR Histogram');
subplot(3,3,8);histogram(HH(:,:,2));title('H-HPF G Histogram');
subplot(3,3,9);histogram(HH(:,:,3));title('H-HPF B Histogram');

%Horizontal - Band Image comparison
figure,subplot(3,3,1);imshow(hIR);title('histeq() IR Band');
subplot(3,3,2);imshow(hG);title('histeq() G Band');
subplot(3,3,3);imshow(hB);title('histeq() B Band');
subplot(3,3,4);imshow(HL(:,:,1));title('H-LPF IR Band');
subplot(3,3,5);imshow(HL(:,:,2));title('H-LPF G Band');
subplot(3,3,6);imshow(HL(:,:,3));title('H-LPF B Band');
subplot(3,3,7);imshow(HH(:,:,1));title('H-HPF IR Band');
subplot(3,3,8);imshow(HH(:,:,2));title('H-HPF G Band');
subplot(3,3,9);imshow(HH(:,:,3));title('H-HPF B Band');

%Vertical - Band Histogram comparison
figure,subplot(3,3,1);histogram(hIR);title('histeq() Histogram');
subplot(3,3,2);histogram(hG);title('histeq() Histogram');
subplot(3,3,3);histogram(hB);title('histeq() Histogram');
subplot(3,3,4);histogram(VL(:,:,1));title('V-LPF Histogram');
subplot(3,3,5);histogram(VL(:,:,2));title('V-LPF Histogram');
subplot(3,3,6);histogram(VL(:,:,3));title('V-LPF Histogram');
subplot(3,3,7);histogram(VH(:,:,1));title('V-HPF Histogram');
subplot(3,3,8);histogram(VH(:,:,2));title('V-HPF Histogram');
subplot(3,3,9);histogram(VH(:,:,3));title('V-HPF Histogram');

%Vertical Filter - Band Image comparison
figure, subplot(3,3,1);imshow(hIR);title('histeq() IR Band');
subplot(3,3,2);imshow(hG);title('histeq() G Band');
subplot(3,3,3);imshow(hB);title('histeq() B Band');
subplot(3,3,4);imshow(VL(:,:,1));title('V-LPF IR Band');
subplot(3,3,5);imshow(VL(:,:,2));title('V-LPF G Band');
subplot(3,3,6);imshow(VL(:,:,3));title('V-LPF B Band');
subplot(3,3,7);imshow(VH(:,:,1));title('V-HPF IR Band');
subplot(3,3,8);imshow(VH(:,:,2));title('V-HPF G Band');
subplot(3,3,9);imshow(VH(:,:,3));title('V-HPF B Band');

%Creating 2-D filter with fspecial()
F2=fspecial('average',2);
F3=fspecial('disk',0.2);
F4=fspecial('gaussian',2,0.5);
F5=fspecial('laplacian',0.5);
F6=fspecial('log');
F7=fspecial('motion',5,30);
F8=fspecial('prewitt');
F9=fspecial('sobel');
figure,subplot(3,3,1);imshow(I1);title('Original histeq()');
subplot(3,3,2);imshow(imfilter(I1,F2,255));title('Filter: Average');
subplot(3,3,3);imshow(imfilter(I1,F3));title('Filter: Disk, Radius=0.2');
subplot(3,3,4);imshow(imfilter(I1,F4));title('Filter: Gaussian, hsize=2, Sigma=0.5');
subplot(3,3,5);imshow(imfilter(I1,F5));title('Filter: Laplacian, Alpha=0.5');
subplot(3,3,6);imshow(imfilter(I1,F6));title('Filter: Log, Default parameter');
subplot(3,3,7);imshow(imfilter(I1,F7));title('Filter: Motion, len=5, Theta=30');
subplot(3,3,8);imshow(imfilter(I1,F8));title('Filter: Prewitt');
subplot(3,3,9);imshow(imfilter(I1,F9));title('Filter: Sobel');

%Disk 
F31=fspecial('disk',2.0);
F32=fspecial('disk',2.5);
F33=fspecial('disk',3.0);
F34=fspecial('disk',3.5);
figure, subplot(2,2,1);imshow(imfilter(I1,F31));title('Filter: Disk, Radius=2.0');
subplot(2,2,2);imshow(imfilter(I1,F32));title('Filter: Disk, Radius=2.5');
subplot(2,2,3);imshow(imfilter(I1,F33));title('Filter: Disk, Radius=3.0');
subplot(2,2,4);imshow(imfilter(I1,F34));title('Filter: Disk, Radius=3.5');

%Gaussian - Hsize
F41=fspecial('gaussian',3,1.5);
F42=fspecial('gaussian',5,1.5);
F43=fspecial('gaussian',7,1.5);
F44=fspecial('gaussian',9,1.5);
figure,subplot(2,2,1);imshow(imfilter(I1,F41));title('Filter: Gaussian, hsize=3, Sigma=1.5');
subplot(2,2,2);imshow(imfilter(I1,F42));title('Filter: Gaussian, hsize=5, Sigma=1.5');
subplot(2,2,3);imshow(imfilter(I1,F43));title('Filter: Gaussian, hsize=7, Sigma=1.5');
subplot(2,2,4);imshow(imfilter(I1,F44));title('Filter: Gaussian, hsize=9, Sigma=1.5');

%Gaussian - Sigma
F45=fspecial('gaussian',15,0.5);
F46=fspecial('gaussian',15,1.0);
F47=fspecial('gaussian',15,1.5);
F48=fspecial('gaussian',15,2.0);
figure,subplot(2,2,1);imshow(imfilter(I1,F45));title('Filter: Gaussian, hsize=15, Sigma=0.5');
subplot(2,2,2);imshow(imfilter(I1,F46));title('Filter: Gaussian, hsize=15, Sigma=1.0');
subplot(2,2,3);imshow(imfilter(I1,F47));title('Filter: Gaussian, hsize=15, Sigma=1.5');
subplot(2,2,4);imshow(imfilter(I1,F48));title('Filter: Gaussian, hsize=15, Sigma=2.0');

%Motion - Theta
F71=fspecial('motion',20,0);
F72=fspecial('motion',20,45);
F73=fspecial('motion',20,90);
F74=fspecial('motion',20,135);
figure, subplot(2,2,1);imshow(imfilter(I1,F71));title('Filter: Motion, len=20, Theta=0');
subplot(2,2,2);imshow(imfilter(I1,F72));title('Filter: Motion, len=20, Theta=45');
subplot(2,2,3);imshow(imfilter(I1,F73));title('Filter: Motion, len=20, Theta=90');
subplot(2,2,4);imshow(imfilter(I1,F74));title('Filter: Motion, len=20, Theta=135');

%Motion - Len
F75=fspecial('motion',5,30);
F76=fspecial('motion',15,30);
F77=fspecial('motion',25,30);
F78=fspecial('motion',35,30);
figure, subplot(2,2,1);imshow(imfilter(I1,F75));title('Filter: Motion, len=5, Theta=30');
subplot(2,2,2);imshow(imfilter(I1,F76));title('Filter: Motion, len=15, Theta=30');
subplot(2,2,3);imshow(imfilter(I1,F77));title('Filter: Motion, len=25, Theta=30');
subplot(2,2,4);imshow(imfilter(I1,F78));title('Filter: Motion, len=35, Theta=30');

%Edge Strength, Direction
for i=1:336
    for j=1:418
        Dx(i,j,1)=hIR(i+1,j)-hIR(i,j);
        Dx(i,j,2)=hG(i+1,j)-hG(i,j);
        Dx(i,j,3)=hB(i+1,j)-hB(i,j);
    end
end

for i=1:336
    for j=2:419
        Dy(i,j,1)=hIR(i,j)-hIR(i,j-1);
        Dy(i,j,2)=hG(i,j)-hG(i,j-1);
        Dy(i,j,3)=hB(i,j)-hB(i,j-1);
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
        
        X1(i,j,1)=uint8(ES(i,j,1)+A(i,j,1));
        X1(i,j,2)=uint8(ES(i,j,2)+A(i,j,2));
        X1(i,j,3)=uint8(ES(i,j,3)+A(i,j,3));
    end
end

figure, subplot(2,2,1);imshow(A); title('Original Image');
subplot(2,2,2);imshow(ES); title('Only Edge Strength');
subplot(2,2,3);imshow(X1); title('Combined Edge Strength');
subplot(2,2,4);imshow(ED); title('Edge Direction');

%edge()
E11=edge(hIR);
E12=edge(hG);
E13=edge(hB);
figure,subplot(1,3,1);imshow(E11);title('Edge detection using edge(), 1st Band');
subplot(1,3,2);imshow(E12);title('Edge detection using edge(), 2nd Band');
subplot(1,3,3);imshow(E13);title('Edge detection using edge(), 3rd Band');

%imgradientxy()
[Gx1, Gy1]=imgradientxy(hIR);
[Gx2, Gy2]=imgradientxy(hG);
[Gx3, Gy3]=imgradientxy(hB);
figure,subplot(2,3,1);imshow(Gx1);title('Gx using imgradientxy(), 1st Band');
subplot(2,3,2);imshow(Gx2);title('Gx using imgradientxy(), 2nd Band');
subplot(2,3,3);imshow(Gx3);title('Gx using imgradientxy(), 3rd Band');
subplot(2,3,4);imshow(Gy1);title('Gy using imgradientxy(), 1st Band');
subplot(2,3,5);imshow(Gy2);title('Gy using imgradientxy(), 2nd Band');
subplot(2,3,6);imshow(Gy3);title('Gy using imgradientxy(), 3rd Band');


%imgradient()
[Gmag1, Gdir1] = imgradient(hIR);
[Gmag2, Gdir2] = imgradient(hG);
[Gmag3, Gdir3] = imgradient(hB);
figure,subplot(2,3,1);imshow(Gmag1);title('Gmag using imgradient(), 1st Band');
subplot(2,3,2);imshow(Gmag2);title('Gmag using imgradient(), 2nd Band');
subplot(2,3,3);imshow(Gmag3);title('Gmag using imgradient(), 3rd Band');
subplot(2,3,4);imshow(Gdir1);title('Gdir using imgradient(), 1st Band');
subplot(2,3,5);imshow(Gdir2);title('Gdir using imgradient(), 2nd Band');
subplot(2,3,6);imshow(Gdir3);title('Gdir using imgradient(), 3rd Band');