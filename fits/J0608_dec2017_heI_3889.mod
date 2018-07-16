run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_dec2017_heI_3889.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[3884.,3898.]   loadrange=[3884.,3900.]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=HeI_3889
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
#fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 50   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian    -30    0.0005    20    wave=3889.75    specid=0    IntFlux=True
    gaussian    85    0.0008   20.0   wave=3889.75 specid=0    IntFlux=True
          
model end

#link read

#link end