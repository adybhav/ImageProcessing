function lab3_demo(img)
   d=img;
   if size(img,3) == 3
    d=rgb2gray(img);
    %disp("grayscaling needed");
  end
  [Im,Ix,Iy]=myEdgeFilter(d,0.7);
  subplot(2,2,1),imshow(abs(Im),[]);
    title("Im");
  subplot(2,2,2),imshow(abs(Ix),[]);
    title("Ix");
  subplot(2,2,3),imshow(abs(Iy),[]);
    title("Iy");
   ax = subplot(2, 2, 4);
    text(0.0,1.0,"R in 3 mins in separate window");
    set ( ax, 'visible', 'off')
   %subplot(2,2,4);title("") 
  [R]=myHarrisCorner(Ix,Iy,1000000);
endfunction