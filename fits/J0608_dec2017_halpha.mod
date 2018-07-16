run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_halpha.pdf
plot dims 3x3
plot labels True
plot fits True

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[6563.0,6574.7]   loadrange=[6560.0,6577.0]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=Halpha
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
#fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 15   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian    60.0    0.00075    35.0   wave=6564.614 specid=0    IntFlux=True
model end

#link read
#oiib(oiiflux,oiia) = oiiflux - oiia
#link end