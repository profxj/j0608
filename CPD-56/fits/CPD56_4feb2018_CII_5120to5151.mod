run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots CPD56_4feb2018_CII_5120to5151.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../CPD-56/fits/CPD56.ascii   specid=0   fitrange=[5100,5167]   loadrange=[5100,5167]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 1000   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    1000    0.00001    35   wave=5032.1   specid=0    IntFlux=True
    gaussian    2000    0.00001    35   wave=5035.9   specid=0    IntFlux=True
    gaussian    500    0.00001    35   wave=5040.7   specid=0    IntFlux=True
    gaussian    1000    0.00001    35   wave=5120.1   specid=0    IntFlux=True
    gaussian    2000    0.00001    35   wave=5121.8   specid=0    IntFlux=True
    gaussian    5       0.00001    35   wave=5125.2   specid=0    IntFlux=True
    gaussian    5       0.00001    35   wave=5127.0   specid=0    IntFlux=True
    gaussian    500     0.00001    35   wave=5132.9   specid=0    IntFlux=True
    gaussian    500     0.00001    35   wave=5133.3   specid=0    IntFlux=True
    gaussian    4000    0.00001    35   wave=5137.3   specid=0    IntFlux=True
    gaussian    5000    0.00001    35   wave=5139.2   specid=0    IntFlux=True
    gaussian    100    0.00001    35   wave=5143.5   specid=0    IntFlux=True
    gaussian    7000    0.00001    35   wave=5145.2   specid=0    IntFlux=True
    gaussian    3000    0.00001    35   wave=5152.1   specid=0    IntFlux=True
model end

#link read

#link end