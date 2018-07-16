run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_5133to5151.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5134,5160]   loadrange=[5130,5165]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=CII_5133to5151

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    -90    0.0008    20   wave=5134.3   specid=0    IntFlux=True
    gaussian    90    0.0008    20   wave=5134.7   specid=0    IntFlux=True
    gaussian    90    0.0008    20   wave=5138.7   specid=0    IntFlux=True
    gaussian    90    0.0008    20   wave=5140.6   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5144.9   specid=0    IntFlux=True
    gaussian    -20    0.0005    20   wave=5146.6   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5146.6   specid=0    IntFlux=True
    gaussian    -50    0.0005    20   wave=5152.5   specid=0    IntFlux=True
    gaussian    60    0.0008    20   wave=5152.5   specid=0    IntFlux=True

model end

#link read

#link end