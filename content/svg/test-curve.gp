set terminal cairolatex standalone pdf monochrome # color
set o "test-curve.tex"
unset xtics
set xtics ('$2 - \sqrt{3}$' 2 - sqrt(3))
set xtics add ('$2 - \frac{2}{\sqrt{3}}$' 2 - (2 / sqrt(3)))
set xtics add ('$2 - \frac{1}{\sqrt{3}}$' 2 - (1 / sqrt(3)))
set xtics add ('$2$' 2)
set xtics add ('$2 + \frac{1}{\sqrt{3}}$' 2 + (1 / sqrt(3)))
set xtics add ('$2 + \frac{1}{\sqrt{3}}$' 2 + (2 / sqrt(3)))
set xtics add ('$2 + \sqrt{3}$' 2 + sqrt(3))
set grid
plot [2-sqrt(3):2+sqrt(3)] x**3 - (6 * (x**2)) + (11 * x) - 6 t '$f(x) = x^3 - 6x^2 + 11x - 6$'
