run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_5107to5126.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5107,5135]   loadrange=[5100,5140]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=CII_5133to5151

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 30   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    10    0.0008    20   wave=5109.3   specid=0    IntFlux=True
    gaussian    10    0.0008    20   wave=5115.1   specid=0    IntFlux=True
    gaussian    10    0.0008    20   wave=5115.7   specid=0    IntFlux=True
    gaussian    1    0.0008    20   wave=5118.1   specid=0    IntFlux=True
    gaussian    20    0.0008    20   wave=5120.8   specid=0    IntFlux=True
    gaussian    30    0.0008    20   wave=5121.5   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5123.9   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5126.6   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5128.3   specid=0    IntFlux=True


model end

#link read

#link end