run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_OI_8447.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[8450,8460]   loadrange=[8445,8470]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=CII7231+7236
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 5   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    5    0.0008    20   wave=8448.8   specid=0    IntFlux=True
model end

#link read

#link end