# series 1**1 + 2**2 + 3**3... 1000**1000
(1..1000).inject(0) { |acc, x| acc+= x**x } % 10000000000
# guess I overestimated how much calculation this would take, actually quite easy.
