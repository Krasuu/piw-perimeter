function obw1 = metoda1(img)
    obw1 = sum(sum(kontur(padarray(img, [1 1], 0))));
end