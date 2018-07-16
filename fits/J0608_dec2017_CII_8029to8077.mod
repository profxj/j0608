run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_8029to8077.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[8030,8093]   loadrange=[8025,8097]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=HeI_7281.3
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    5    0.0008    20   wave=8031.1   specid=0    IntFlux=True
    gaussian    25    0.0008    20   wave=8039.9   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=8041.6   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=8050.5   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=8064.3   specid=0    IntFlux=True
    gaussian    25    0.0008    20   wave=8065.0   specid=0    IntFlux=True
    gaussian    25    0.0008    20   wave=8078.8   specid=0    IntFlux=True
model end

#link read

#link end