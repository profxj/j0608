run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_7509_7520_7531.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7506,7543.1]   loadrange=[7505,7545]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=CI7507+CII7509+7520+7531

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    15    0.0008    20   wave=7507.73   specid=0    IntFlux=True
    gaussian    15    0.0008    20   wave=7510.96   specid=0    IntFlux=True
    gaussian    15    0.0008    20   wave=7522.00   specid=0    IntFlux=True
    gaussian    10    0.0008    20   wave=7532.64   specid=0    IntFlux=True

model end

#link read

#link end