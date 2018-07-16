run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_oII37263728.pdf
plot dims 3x3
plot labels True
plot fits True

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[3725.36,3739.11]   loadrange=[3724.4,3740.1]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=OII3726+3728.8
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
#fix gaussian dispersion True
emission
# Specify the continuum (or background) level
    legendre 57.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian    57.0    0.0008    20.0   wave=3727.1 specid=0    IntFlux=True
    gaussian    57.0    0.0008    20.0   wave=3730.1 specid=0    IntFlux=True
model end

#link read
#oiib(oiiflux,oiia) = oiiflux - oiia
#link end