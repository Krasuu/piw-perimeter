function circ = circle(h, w, r)
    [cols, rows] = meshgrid(1:h, 1:w);
    circ = (rows - w/2).^2 + (cols - h/2).^2 <= r.^2;
end