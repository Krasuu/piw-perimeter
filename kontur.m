function ImageNew = kontur(Image)
    
    [x,y,~] = size(Image);
    old_pix = 0;
    suma = 0;
    ImageNew = zeros(x,y);
    
    for i = 1:x
       for j = 1:y
           new_pix = Image(i,j);
           if old_pix > new_pix
               ImageNew(i,j-1) = 1;
           elseif old_pix < new_pix
               ImageNew(i,j) = 1;
           end
           old_pix = new_pix;
       end
    end
    
    for i = 1:y
       for j = 1:x
           new_pix = Image(j,i);
           if old_pix > new_pix
               ImageNew(j-1,i) = 1;
           elseif old_pix < new_pix
               ImageNew(j,i) = 1;
           end
           old_pix = new_pix;
       end
    end
    
    for i = 1:x
       for j = 1:y
            if ImageNew(i,j) == 1
                suma = suma + 1;
            end
       end
    end

end