run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_5250to5260.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5250,5270]   loadrange=[5245,5275]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=CII

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 23   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    2    0.0008    20   wave=5250.989   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5251.45   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5255.02   specid=0    IntFlux=True
    gaussian    1    0.0008    20   wave=5257.55   specid=0    IntFlux=True
    gaussian    6    0.0008    20   wave=5258.70   specid=0    IntFlux=True
    gaussian    6    0.0008    20   wave=5260.5   specid=0    IntFlux=True
    gaussian    15    0.0008    20   wave=5261.22  specid=0    IntFlux=True


model end

#link read

#link end