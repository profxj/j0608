run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_5032andsoon.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5030,5068]   loadrange=[5030,5070]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 28   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    5    0.0008    20   wave=5032.1   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5035.9   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5040.7   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5041.8   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5044.3   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5045.0   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5047.1   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=5049.2   specid=0    IntFlux=True

model end

#link read

#link end