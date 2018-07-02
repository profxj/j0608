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
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7515.2,7543.1]   loadrange=[7510,7545]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII7509+7520+7531

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian 5   0.0011   20   wave=7508.9   specid=0    IntFlux=True
    gaussian 5   0.0011   20   wave=7519.49   specid=0    IntFlux=True
    gaussian 5   0.0011   20   wave=7519.93   specid=0    IntFlux=True
    gaussian 5   0.0011   20   wave=7530.6   specid=0    IntFlux=True

model end

#link read

#link end