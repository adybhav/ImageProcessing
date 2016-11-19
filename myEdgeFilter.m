function [Im,Ix,Iy]=myEdgeFilter(img0,s)
  a=img0;
  %b=imnoise(a,'Gaussian',0.04,0.03)
  %figure,imshow(b)
  %test=[1,2,3;4,5,6;7,8,9];
  %d=double(a);
  %d=padarray(d,[1,1]);
  %f=padarray(test,[1,1]);
  r=rows(a);
  c=columns(a);
  x=[-50:50:50];
  y=[-50:50:50];
  [xm,ym]=meshgrid(x,y);
  M=size(xm,1)-1;
  N=size(ym,1)-1;
  exp1=(-(xm.^2+ym.^2)/(2*s*s));
  exp(exp1);
  fil=exp(exp1)/(2*pi*s*s);
  sx=[-1,0,1;-2,0,2;-1,0,1];
   sy=[1,2,1;0,0,0;-1,-2,-1]; 
  q=myImageFilter(a,fil);
  Ix=myImageFilter(q,sx);
  Ix=nonmax_supress(Ix,Ix); %to make edges 1 pixel 
  Iy=myImageFilter(q,sy);
  Iy=nonmax_supress(Iy,Iy); %to make edges 1 pixel 
   Im=(Ix.^2 +Iy.^2).^(0.5);
   Im=nonmax_supress(Im,Im); %to make edges 1 pixel 
%   figure(1);
%   imshow(abs(Im),[]);
%   figure(2);
%   imshow(abs(Ix), []);
%   figure(3);
%   imshow(abs(Iy), []);

 endfunction