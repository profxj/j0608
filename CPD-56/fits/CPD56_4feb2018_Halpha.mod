run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots CPD56_4feb2018_Halpha.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../CPD-56/fits/CPD56.ascii   specid=0   fitrange=[6544,6594]   loadrange=[6555,6571]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=OI
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 1000   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    4000    0.00001    35   wave=6548.1   specid=0    IntFlux=True
    gaussian    9000    0.00001    35   wave=6562.8   specid=0    IntFlux=True
    gaussian    -500    -0.0005    35   wave=6577.3   specid=0    IntFlux=True
    gaussian    7000    0.00001    35   wave=6577.3   specid=0    IntFlux=True
    gaussian    100000    0.00001    35   wave=6583.5   specid=0    IntFlux=True
model end

#link read

#link end