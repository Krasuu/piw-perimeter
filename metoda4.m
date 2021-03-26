function obw4 = metoda4(img)
    [h, w] = size(img);

    Q{1, 1} = [1 0; 0 0];
    Q{1, 2} = [0 0; 1 0];
    Q{1, 3} = [0 0; 0 1];
    Q{1, 4} = [0 1; 0 0];

    Q{2, 1} = [1 0; 1 0];
    Q{2, 2} = [0 0; 1 1];
    Q{2, 3} = [0 1; 0 1];
    Q{2, 4} = [1 1; 0 0];

    Q{3, 1} = [1 0; 1 1];
    Q{3, 2} = [0 1; 1 1];
    Q{3, 3} = [1 1; 0 1];
    Q{3, 4} = [1 1; 1 0];

    Q{4, 1} = [1 1; 1 1];

    Q{5, 1} = [1 0; 0 1];
    Q{5, 2} = [0 1; 1 0];

    p{1} = 0;
    p{2} = 0;
    p{3} = 0;
    p{4} = 0;
    p{5} = 0;

    for i=1:h-1
        for j=1:w-1
            frame = img(i:i+1, j:j+1);

            for k=1:size(Q, 1)
                for m=1:size(Q, 2)

                    if numel(Q{k, m}) ~= 0
                        if frame == Q{k, m}
                            p{k} = p{k} + 1;
                        end
                    end

                end
            end

        end
    end

    obw4 = p{2} + (1/sqrt(2))*(p{1}+p{3}+2*p{5});
    
end