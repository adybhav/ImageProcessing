function [img1]=myImageFilter(img0,h)
  #a=imread(img0);
  d=img0;
  #h=[1,2,3;,3,2,1;1,1,1];
  if size(img0,3) == 3
    d=rgb2gray(img0);
    %disp("grayscaling needed");
  else
    disp(" ");
  end
  fflip=fliplr(h);
  fflipp=flipud(fflip);
  d=double(d);
  d=padarray(d,[1,1]);
  %frow=rows(h);
  %fcol=columns(h);
  r=rows(d);
  c=columns(d);
  for i=2:r-1
    for j=2:c-1
        c1=d(i-1,j-1)*fflipp(1,1);
        c2=d(i-1,j)*fflipp(1,2);
        c8=d(i-1,j+1)*fflipp(1,3);
        c3=d(i,j-1)*fflipp(2,1);
        c4=d(i,j)*fflipp(2,2);
        c6=d(i,j+1)*fflipp(2,3);
        c9=d(i+1,j-1)*fflipp(3,1);
        c7=d(i+1,j)*fflipp(3,2);
        c5=d(i+1,j+1)*fflipp(3,3);
        img1(i-1,j-1)=c1+c2+c3+c4+c5+c6+c7+c8+c9;
       end
    end
 
endfunction

