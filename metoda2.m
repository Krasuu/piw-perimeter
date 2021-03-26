function obw2 = metoda2(img)

    % Dodanie paddingu
    new_img = padarray(img, [1 1], 0);

    kont = kontur(new_img);
    [h, w] = size(kont);

    sum_p = 0;
    sum_n = 0;

    for i=2:h-1
        for j=2:w-1
            frame = kont(i-1:i+1, j-1:j+1);

            if frame(2, 2) == 1
    %             sum_p = sum_p + sum(frame([2, 4, 6, 8]));
                if sum(frame([2, 4, 6, 8])) == 1
                    sum_p = sum_p + 1;
                elseif (sum(frame([2, 4, 6, 8])) > 1)
                    sum_p = sum_p + 2;
                end

                if sum(frame([1, 3, 7, 9])) > 0 && sum(frame([2, 4, 6, 8])) == 1
                    sum_n = sum_n + 1;
                elseif sum(frame([1, 3, 7, 9])) > 0 && sum(frame([2, 4, 6, 8])) == 0
                    sum_n = sum_n + 2;
                end
            end
        end
    end

%     obw2 = (sum_p/2) + (sum_n/2)*sqrt(2);
    obw2 = (pi/8)*(1+sqrt(2))*(sum_p/2+(sqrt(2)*(sum_n/2)));

end