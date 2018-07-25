run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_HeI_4471.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4470,4482]   loadrange=[4466,4490]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=HBeta
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion True
emission
# Specify the continuum (or background) level
    legendre 40.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian    -50    0.0005    36   wave=4472.74 specid=0 IntFlux=True
    gaussian    70    0.0008    36   wave=4472.74 specid=0    IntFlux=True
    #link read
#link end