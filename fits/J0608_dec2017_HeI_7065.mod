run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_HeI_7065.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7070,7080]   loadrange=[7068,7090]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=HeI7065
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian    15.0    0.0008    20   wave=7067.1 specid=0    IntFlux=True

#link read
#link end