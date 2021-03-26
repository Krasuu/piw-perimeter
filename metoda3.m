function obw3 = metoda3(img)

    new_img = padarray(img, [1 1], 0);

    top = 0;
    side = 0;
    p1 = 0;
    p2 = 0;
    p3 = 0;
    
    [idx_x, idx_y] = find(kontur(new_img));

    for i=1:numel(idx_x')

        frame = new_img(idx_x(i)-1:idx_x(i)+1, idx_y(i)-1:idx_y(i)+1);
        s = sum(frame([2, 4, 6, 8]));
        if frame(2, 2) == 1
            switch s
                case 1
                    top = top + 2;
                    side = side + 3;
                    p1 = p1 + 1;
                case 2
                    top = top + 1;
                    side = side + 2;
                    p2 = p2 + 1;
                case 3
                    side = side + 1;
                    p3 = p3 + 1;
            end
        end
    end

    a = (pi*(1+sqrt(2)))/8;
    b = pi/(8*sqrt(2));
    obw3 = a*side - b*top;

end