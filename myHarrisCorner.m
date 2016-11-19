function [R]=myHarrisCorner(Ix,Iy,threshold)
  k=0.04;
  Im=(Ix.^2 +Iy.^2).^(0.5);
  Ixx = Ix.*Ix ;
  Iyy = Iy.*Iy;
  Ixy= Ix.*Iy;
  h= fspecial('gaussian', [7 7], 2); 
  Ix2 = conv2(Ixx,h);
  Iy2 = conv2(Iyy,h);
  Ixy = conv2(Ixy,h);
  r=rows(Im);
  c=columns(Im);
  ans=zeros(r,c);
  R=zeros(r,c);
  for i=1:r
    for j=1:c
      matrix=[Ix2(i,j),Ixy(i,j);Ixy(i,j),Iy2(i,j)];
      R(i,j)=det(matrix)-(k*(trace(matrix).^2)) ;
      if(R>threshold)
        threshold=R(i,j);
        end
    end
  end  
  ans1=0;
  for i = 2:r-1
    for j = 2:c-1
      if R(i,j) > 0.1*threshold && R(i,j) > R(i,j+1) && R(i,j) > R(i-1,j) &&   R(i,j) > R(i+1,j-1) &&R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i-1,j-1) &&  R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
        ans(i,j) = 1;
        ans1 = ans1+1;
      end;
    end; 
  end;
  [x, y] = find(ans == 1);
  figure(4);   
  imshow(abs(Im),[]);
  hold on;
  plot(y,x,"or");  
endfunction