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
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[3888.,3898.]   loadrange=[3887.,3900.]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=HeI_3889
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
#fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 50.95228255LEG   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian 85.47849631   0.001108311   20.0   wave=3888.8 specid=0    IntFlux=True
    gaussian amplitude=-30   redshift=0.00088    dispersion=20    wave=3888.8    specid=0    IntFlux=True      
model end

#link read

#link end