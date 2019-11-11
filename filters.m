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

%Image Comparison
figure, imshow(I1);title('Original histeq() Image');
figure,subplot(2,2,1);imshow(HL);title('Horizontal Low Pass Filter');
subplot(2,2,2);imshow(HH);title('Horizontal High Pass Filter');
subplot(2,2,3);imshow(VL);title('Vertical Low Pass Filter');
subplot(2,2,4);imshow(VH);title('Vertical High Pass Filter');

%Horizontal - Histogram comparison of Bands
figure,subplot(3,3,1);histogram(hIR);title('histeq() IR Band');
subplot(3,3,2);histogram(hG);title('histeq() G Band');
subplot(3,3,3);histogram(hB);title('histeq() B Band');
subplot(3,3,4);histogram(HL(:,:,1));title('H-LPF IR Band');
subplot(3,3,5);histogram(HL(:,:,2));title('H-LPF G Band');
subplot(3,3,6);histogram(HL(:,:,3));title('H-LPF B Band');
subplot(3,3,7);histogram(HH(:,:,1));title('H-HPF IR Band');
subplot(3,3,8);histogram(HH(:,:,2));title('H-HPF G Band');
subplot(3,3,9);histogram(HH(:,:,3));title('H-HPF B Band');

%Vertical - Histogram comparison of Bands
figure, subplot(3,3,1);histogram(hIR);title('histeq() IR Band');
subplot(3,3,2);histogram(hG);title('histeq() G Band');
subplot(3,3,3);histogram(hB);title('histeq() B Band');
subplot(3,3,4);histogram(VL(:,:,1));title('V-LPF IR Band');
subplot(3,3,5);histogram(VL(:,:,2));title('V-LPF G Band');
subplot(3,3,6);histogram(VL(:,:,3));title('V-LPF B Band');
subplot(3,3,7);histogram(VH(:,:,1));title('V-HPF IR Band');
subplot(3,3,8);histogram(VH(:,:,2));title('V-HPF G Band');
subplot(3,3,9);histogram(VH(:,:,3));title('V-HPF B Band');

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

